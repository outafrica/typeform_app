class AuthenticationEndpoints {
  // registration endpoint
  static String register = 'auth/register';

  // get genders endpoint
  static String getGenders = 'auth/genders';

  // get roles endpoint
  static String getRoles = 'auth/roles';

  // login endpoint
  static String login = 'auth/login';

  //fetch user endpoint
  static String fetchUser({required String userId}) => 'auth/user';

  //create pin endpoint
  static String createPin = 'auth/create-pin';

  // verify pin
  static String verifyPin = 'auth/verify-pin';

  // forgot password
  static String forgotPassword = 'auth/forgot-password';

  //reset password
  static String resetPassword = 'auth/reset-password';

  // forgot pin
  static String forgotPin = 'auth/forgot-pin';

  // reset pin
  static String resetPin = 'auth/reset-pin';

  // logout user
  static String logout = 'auth/logout';
}
