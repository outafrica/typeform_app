// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:sizer/sizer.dart';

// Project imports:
import 'core/data/network/config.dart';
import 'core/platform/platform.dart';
import 'core/routes/app_routes.dart';

StatelessWidget getDev() {
  FlavorConfig(
    flavor: Flavor.development,
    flavorValues: FlavorValues(
      baseUrl: devUrl,
    ),
  );

  return _DevApp();
}

class _DevApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: providers,
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light, //Android
            statusBarBrightness: Brightness.dark, //iOS
          ),
          child: Sizer(
            builder: (context, orientation, deviceType) => MaterialApp.router(
              title: 'Typeform Dev',
              debugShowCheckedModeBanner: false,
              routerConfig: AppRoutes.router,
              builder: EasyLoading.init(
                builder: (context, child) => MediaQuery(
                  data: MediaQuery.of(context).copyWith(
                    textScaleFactor: 1.0,
                  ), //set desired text scale factor here
                  child: child!,
                ),
              ),
              theme: AppTheme.appThemeLight,
            ),
          ),
        ),
      );
}
