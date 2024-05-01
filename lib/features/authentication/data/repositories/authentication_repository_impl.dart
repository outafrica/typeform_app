// Project imports:
import 'package:typeform_app/core/data/network/utilities/guarded_datasource_calls.dart';
import 'package:typeform_app/features/authentication/data/datasources/authentication_local_datasource.dart';
import 'package:typeform_app/features/authentication/data/datasources/authentication_remote_datasource.dart';
import 'package:typeform_app/features/authentication/data/models/authentication_models.dart';
import 'package:typeform_app/features/authentication/domain/params/login_params.dart';
import 'package:typeform_app/features/authentication/domain/params/pin_params.dart';
import 'package:typeform_app/features/authentication/domain/params/signup_params.dart';
import 'package:typeform_app/features/authentication/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationLocalDatasource _localDataSource;
  final AuthenticationRemoteDataSource _remoteDataSource;

  AuthenticationRepositoryImpl(this._localDataSource, this._remoteDataSource);

  @override
  Future<UserModel?> checkLogin() async =>
      guardedCacheAccess<UserModel?>(_localDataSource.getPersonalAccountUser);

  @override
  Future<void> createPin(PinParams pin) =>
      guardedApiCall<UserModel>(() => _remoteDataSource.createPin(pin));

  @override
  Future<UserModel> fetchUser() async {
    final res = await guardedApiCall<UserModel?>(
      _remoteDataSource.fetchUser,
    );
    await guardedCacheAccess<void>(
      () => _localDataSource.savePersonalAccountUser(res!),
    );

    return res!;
  }

  @override
  Future<UserModel> login(LoginParams params) async {
    final res = await guardedApiCall<UserModel?>(
      () => _remoteDataSource.login(params),
    );

    await guardedCacheAccess<void>(
      () => _localDataSource.savePersonalAccountUser(res!),
    );

    return res!;
  }

  @override
  Future<void> logout() async =>
      guardedCacheAccess<void>(_localDataSource.logout);

  @override
  Future<UserModel> signup(SignupParams params) async =>
      guardedApiCall<UserModel>(
        () => _remoteDataSource.signup(params),
      );

  @override
  Future<UserModel> verifyPin(PinParams pin) async =>
      guardedApiCall<UserModel>(() => _remoteDataSource.verifyPin(pin));

  @override
  Future<List<GenderModel>> getGenders() async =>
      guardedApiCall<List<GenderModel>>(_remoteDataSource.getGenders);

  @override
  Future<List<RoleModel>> getRoles() async =>
      guardedApiCall<List<RoleModel>>(_remoteDataSource.getRoles);
}
