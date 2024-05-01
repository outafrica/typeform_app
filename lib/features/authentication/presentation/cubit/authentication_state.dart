part of 'authentication_cubit.dart';

@freezed
class AuthenticationState with _$AuthenticationState {
  const factory AuthenticationState.initial({
    required AuthenticationStatePayload payload,
  }) = _InitialAuthenticationState;

  const factory AuthenticationState.signingUp({
    required AuthenticationStatePayload payload,
  }) = _SigningUpAuthenticationState;

  const factory AuthenticationState.loggingIn({
    required AuthenticationStatePayload payload,
  }) = _LoggingInAuthenticationState;

  const factory AuthenticationState.gettingRoles({
    required AuthenticationStatePayload payload,
  }) = _GettingRolesAuthenticationState;

  const factory AuthenticationState.gettingGenders({
    required AuthenticationStatePayload payload,
  }) = _GettingGendersAuthenticationState;

  const factory AuthenticationState.loggingOut({
    required AuthenticationStatePayload payload,
  }) = _LoggingOutAuthenticationState;

  const factory AuthenticationState.loggedIn({
    required AuthenticationStatePayload payload,
  }) = _LoggedInAuthenticationState;

  const factory AuthenticationState.gotRoles({
    required AuthenticationStatePayload payload,
  }) = _GotRolesAuthenticationState;

  const factory AuthenticationState.gotGenders({
    required AuthenticationStatePayload payload,
  }) = _GotGendersAuthenticationState;

  const factory AuthenticationState.loggedOut({
    required AuthenticationStatePayload payload,
  }) = _LoggedOutAuthenticationState;

  const factory AuthenticationState.pinRequired({
    required AuthenticationStatePayload payload,
  }) = _PinRequiredAuthenticationState;

  const factory AuthenticationState.onboardingRequired({
    required AuthenticationStatePayload payload,
  }) = _OnboardingRequiredAuthenticationState;

  const factory AuthenticationState.kycRequired({
    required AuthenticationStatePayload payload,
  }) = _KycRequiredAuthenticationState;

  const factory AuthenticationState.signUpError({
    required AuthenticationStatePayload payload,
  }) = _SignUpErrorAuthenticationState;

  const factory AuthenticationState.loginError({
    required AuthenticationStatePayload payload,
  }) = _LoginErrorAuthenticationState;

  const factory AuthenticationState.pinError({
    required AuthenticationStatePayload payload,
  }) = _PinErrorAuthenticationState;

  const factory AuthenticationState.rolesError({
    required AuthenticationStatePayload payload,
  }) = _RolesErrorAuthenticationState;

  const factory AuthenticationState.gendersError({
    required AuthenticationStatePayload payload,
  }) = _GendersErrorAuthenticationState;

  const factory AuthenticationState.error({
    required AuthenticationStatePayload payload,
  }) = _ErrorAuthenticationState;
}

@freezed
class AuthenticationStatePayload with _$AuthenticationStatePayload {
  const factory AuthenticationStatePayload({
    required String error,
    required UserModel? user,
    required List<RoleModel> roles,
    required List<GenderModel> genders,
  }) = _AuthenticationStatePayload;
}
