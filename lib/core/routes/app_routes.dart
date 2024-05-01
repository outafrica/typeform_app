// Flutter imports:
// ignore_for_file: prefer_const_literals_to_create_immutables

// Dart imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:go_router/go_router.dart';

// Project imports:
import 'package:typeform_app/core/di/core_injector.dart';
import 'package:typeform_app/core/platform/utilities/utilities.dart';
import 'package:typeform_app/core/presentation/pages/web_view.dart';
import 'package:typeform_app/core/presentation/widgets/nav_service.dart';
import 'package:typeform_app/features/authentication/presentation/pages/landing_page.dart';
import 'package:typeform_app/features/authentication/presentation/pages/login/log_in.dart';
import 'package:typeform_app/features/authentication/presentation/pages/signup/sign_up.dart';
import 'package:typeform_app/features/home/data/models/category_model.dart';
import 'package:typeform_app/features/home/data/models/form_model.dart';
import 'package:typeform_app/features/home/presentation/pages/create_question.dart';
import 'package:typeform_app/features/home/presentation/pages/questions_page.dart';

part 'app_pages.dart';

class AppRoutes {
  static final _navigatorService = CoreInjector.resolve<NavigatorService>();
  static final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  /// use this in [MaterialApp.router]
  static final GoRouter _router = GoRouter(
    initialLocation: AppPages.initial,
    navigatorKey: _navigatorService.navigatorKey,
    observers: [
      FirebaseAnalyticsObserver(analytics: _analytics),
    ],
    // log diagnostic info for your routes
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: AppPages.initial,
        builder: AppWidgets.splashWidget,
      ),
      GoRoute(
        path: AppPages.login,
        builder: AppWidgets.loginWidget,
      ),
      GoRoute(
        path: AppPages.register,
        builder: AppWidgets.registerWidget,
      ),
      GoRoute(
        path: AppPages.webview,
        name: 'webview',
        builder: AppWidgets.webviewWidget,
      ),
      GoRoute(
          path: AppPages.questions,
          name: 'questions',
          builder: AppWidgets.questionWidget,
          routes: [
            GoRoute(
              path: AppPages.createQuestion,
              name: 'create',
              builder: AppWidgets.createQuestionWidget,
            ),
          ]),
    ],
    errorBuilder: (context, state) {
      // logger.e(state.fullpath);

      logger.e(state.error.toString());

      logger.e(state.name);

      return Container(
        child: Center(
          child: Text('${state.error}'),
        ),
      );
    },
  );

  static GoRouter get router => _router;
}
