part of 'app_routes.dart';

class AppPages {
  // all the route paths. So that we can access them easily  across the app
  static const initial = '/';
  static const login = '/login';
  static const register = '/register';
  static const home = '/home';
  static const questions = '/questions';
  static const createQuestion = 'create';

  // WebView
  static const webview = '/webview';

  //Intro Screens
}

// Builder route widgets for different routes
class AppWidgets {
  static Widget splashWidget(BuildContext context, GoRouterState state) =>
      const LandingPage();

  static Widget loginWidget(BuildContext context, GoRouterState state) =>
      const LoginPage();

  static Widget registerWidget(BuildContext context, GoRouterState state) =>
      const SignupPage();

  // WebView Page
  static Widget webviewWidget(BuildContext context, GoRouterState state) {
    final routepath = state.extra as Map<String, dynamic>;
    return WebView(
      url: routepath['url'].toString(),
      title: routepath['title'].toString(),
    );
  }

  //Questions page
  static Widget questionWidget(BuildContext context, GoRouterState state) {
    final payload = state.extra as Map<String, dynamic>;
    return QuestionsPage(
      form: payload['forms'] as FormModel,
      categories: payload['categories'] as List<CategoryModel>,
    );
  }

  //Questions page
  static Widget createQuestionWidget(
      BuildContext context, GoRouterState state) {
    final payload = state.extra as Map<String, dynamic>;
    return CreateQuestion(
      forms: payload['forms'] as List<FormModel>,
      categories: payload['categories'] as List<CategoryModel>,
    );
  }
}
