// Flutter imports:
import 'package:flutter/material.dart';

class NavigatorService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> pushNamed(String routeName, {dynamic arguments}) =>
      navigatorKey.currentState!.pushNamed(routeName, arguments: arguments);

  Future<dynamic> push(Widget route, {dynamic arguments}) =>
      navigatorKey.currentState!.push(
        MaterialPageRoute(builder: (BuildContext context) => route),
      );

  void pop({required bool leave}) => navigatorKey.currentState!.pop(leave);

  BuildContext context() => navigatorKey.currentContext!;

  Future<dynamic> pushReplacementNamed(String routeName, {dynamic arguments}) =>
      navigatorKey.currentState!.pushReplacementNamed(
        routeName,
        result: (Route<dynamic> route) => false,
        arguments: arguments,
      );

  Future<dynamic> pushReplacement(Widget route, {dynamic arguments}) =>
      navigatorKey.currentState!.pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => route),
        // arguments: arguments,
      );

  Future<dynamic> pushNamedAndRemoveUntil(String routeName, String until,
          {required Map arguments}) =>
      navigatorKey.currentState!.pushNamedAndRemoveUntil(
        routeName,
        ModalRoute.withName(until),
        arguments: arguments,
      );

  String currentRoute() => ModalRoute.of(context())!.settings.name!;

  void popUntil(String until) =>
      navigatorKey.currentState!.popUntil(ModalRoute.withName(until));

  Future<dynamic> navigateShowDialog({required Widget dialog}) =>
      navigatorKey.currentState!.push(
        PageRouteBuilder(
          barrierDismissible: true,
          opaque: true,
          pageBuilder: (context, anim1, anim2) => dialog,
        ),
      );
}
