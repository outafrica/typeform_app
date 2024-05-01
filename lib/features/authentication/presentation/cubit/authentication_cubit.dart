import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:typeform_app/features/authentication/data/datasources/authentication_local_datasource.dart';
import 'package:typeform_app/features/authentication/data/models/authentication_models.dart';
import 'package:typeform_app/features/authentication/domain/authentication_module_injector.dart';
import 'package:typeform_app/features/authentication/domain/params/authentication_params.dart';
import 'package:typeform_app/features/authentication/domain/usecases/authentication_usecases.dart';

part 'authentication_state.dart';
part 'authentication_cubit.freezed.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final CheckLogin _checkLogin;
  final CreatePin _createPin;
  final FetchUser _fetchUser;
  final Login _login;
  final LogOut _logOut;
  final SignUp _signUp;
  final GetGenders _getGenders;
  final GetRoles _getRoles;
  final VerifyPin _verifyPin;

  AuthenticationCubit(
    this._checkLogin,
    this._createPin,
    this._fetchUser,
    this._login,
    this._logOut,
    this._signUp,
    this._getGenders,
    this._getRoles,
    this._verifyPin,
  ) : super(
          const AuthenticationState.initial(
            payload: AuthenticationStatePayload(
              error: '',
              user: null,
              roles: [],
              genders: [],
            ),
          ),
        ) {
    AuthenticationModuleInjector.resolve<AuthenticationLocalDatasource>()
        .dataStreamController
        .stream
        .listen(
      (user) {
        // ignore: unnecessary_null_comparison
        if (user == null) {
          logout();
        }
        emit(state.copyWith.payload(user: user));
      },
    );
  }

  Future<void> checkLogin() async {
    emit(AuthenticationState.loggingIn(payload: state.payload.copyWith()));

    final result = await _checkLogin();

    result.fold(
      (l) => emit(
        AuthenticationState.loggedOut(
          payload: state.payload.copyWith(error: l.message),
        ),
      ),
      (r) {
        if (r != null) {
          emit(AuthenticationState.pinRequired(
            payload: state.payload.copyWith(
              user: r,
            ),
          ));
        } else {
          logout();
        }
      },
    );
  }

  Future<void> login({required LoginParams params}) async {
    emit(AuthenticationState.loggingIn(payload: state.payload.copyWith()));

    final result = await _login(params);

    result.fold(
      (l) => emit(
        AuthenticationState.error(
            payload: state.payload.copyWith(error: l.message)),
      ),
      (r) {
        if (r.kycStatus == KycStatus.Pending) {
          emit(
            AuthenticationState.kycRequired(
                payload: state.payload.copyWith(user: r)),
          );
        } else {
          emit(
            AuthenticationState.loggedIn(
                payload: state.payload.copyWith(user: r)),
          );
        }
      },
    );
  }

  Future<void> fetchUser() async {}

  Future<void> signup({required SignupParams params}) async {
    emit(AuthenticationState.signingUp(payload: state.payload.copyWith()));

    final result = await _signUp(params);

    result.fold(
      (l) => emit(
        AuthenticationState.signUpError(
          payload: state.payload.copyWith(error: l.message),
        ),
      ),
      (r) {
        if (r.kycStatus == KycStatus.Pending) {
          emit(
            AuthenticationState.kycRequired(
                payload: state.payload.copyWith(user: r)),
          );
        } else {
          emit(
            AuthenticationState.loggedIn(
                payload: state.payload.copyWith(user: r)),
          );
        }
      },
    );
  }

  Future<void> getRoles() async {
    emit(AuthenticationState.gettingRoles(payload: state.payload.copyWith()));

    final result = await _getRoles();

    result.fold(
      (l) => emit(
        AuthenticationState.rolesError(
          payload: state.payload.copyWith(error: l.message),
        ),
      ),
      (r) => emit(
        AuthenticationState.gotRoles(
          payload: state.payload.copyWith(roles: r),
        ),
      ),
    );
  }

  Future<void> getGenders() async {
    emit(AuthenticationState.gettingRoles(payload: state.payload.copyWith()));

    final result = await _getGenders();

    result.fold(
      (l) => emit(
        AuthenticationState.gendersError(
          payload: state.payload.copyWith(error: l.message),
        ),
      ),
      (r) => emit(
        AuthenticationState.gotGenders(
          payload: state.payload.copyWith(genders: r),
        ),
      ),
    );
  }

  Future<void> createPin(PinParams params) async {}

  Future<void> verifyPin(PinParams params) async {}

  Future<void> logout({bool tokenExpired = false}) async {
    emit(AuthenticationState.loggingOut(payload: state.payload.copyWith()));

    final result = await _logOut();

    result.fold(
      (l) => emit(
        AuthenticationState.error(
          payload: state.payload.copyWith(error: l.message),
        ),
      ),
      (r) => emit(
        AuthenticationState.loggedOut(
          payload: state.payload.copyWith(user: null),
        ),
      ),
    );
  }
}
