// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

// Project imports:
import 'package:typeform_app/core/di/core_dependencies.dart';
import 'package:typeform_app/core/platform/platform.dart';
import 'package:typeform_app/core/presentation/widgets/loader.dart';
import 'firebase_options.dart';
import 'main_dev.dart';
import 'main_prod.dart';
import 'main_stage.dart';

void main() {
  runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );

      await SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp]);

      // Pass all uncaught errors from the framework to Crashlytics.
      FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

      // Setup logger, only show warning and higher in release mode.
      if (kReleaseMode) {
        Logger.level = Level.warning;
      } else {
        Logger.level = Level.debug;
      }

      await Hive.initFlutter();

      // register our service locator
      configureDependencies();

      // setup storage paths
      HydratedBloc.storage = await HydratedStorage.build(
        storageDirectory: kIsWeb
            ? HydratedStorage.webStorageDirectory
            : await getTemporaryDirectory(),
      );

      // initialize connection listener
      ConnectionStatusSingleton.getInstance().initialize();

      late StatelessWidget app;

      if (EnvironmentConfig.ENVIRONMENT_VAR == 'DEVELOPMENT') {
        app = getDev();
      } else if (EnvironmentConfig.ENVIRONMENT_VAR == 'STAGING') {
        app = getStage();
      } else if (EnvironmentConfig.ENVIRONMENT_VAR == 'PRODUCTION') {
        app = getProd();
      }

      // setup loader configs
      configLoading();

      // load Sentry app monitoring
      await SentryFlutter.init(
        (options) {
          options.dsn =
              'https://107ecd82d43a3079a4f00d8982672380@o4504762660814848.ingest.sentry.io/4505914309541888';
          // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
          // We recommend adjusting this value in production.
          options.tracesSampleRate = 1.0;
        },
        appRunner: () => runApp(app),
      );
    },
    (error, stackTrace) async {
      await FirebaseCrashlytics.instance.recordError(error, stackTrace);
      await Sentry.captureException(error, stackTrace: stackTrace);
    },
  );
}
