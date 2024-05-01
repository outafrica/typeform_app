import 'package:typeform_app/core/data/datasources/remote_datasource_base.dart';
import 'package:typeform_app/core/data/network/network_service.dart';
import 'package:typeform_app/core/data/network/network_service_impl.dart';
import 'package:typeform_app/core/data/network/utilities/error_helpers.dart';
import 'package:typeform_app/core/platform/platform.dart';
import 'package:typeform_app/features/authentication/data/datasources/authentication_endpoints.dart';
import 'package:typeform_app/features/authentication/data/models/authentication_models.dart';
import 'package:typeform_app/features/authentication/domain/params/authentication_params.dart';

abstract class AuthenticationRemoteDataSource implements RemoteDataSource {
  Future<void> signup(SignupParams params);
  Future<List<GenderModel>> getGenders();
  Future<List<RoleModel>> getRoles();
  Future<UserModel> login(LoginParams params);
  Future<void> createPin(PinParams pin);
  Future<UserModel> verifyPin(PinParams pin);
  Future<UserModel> fetchUser();
  Future<void> logout();
}

class AuthenticationDataSourceImpl implements AuthenticationRemoteDataSource {
  final NetworkService _networkService;

  AuthenticationDataSourceImpl(this._networkService);

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  Future<void> createPin(PinParams params) async {
    final _result = await _networkService.postHttp(
      AuthenticationEndpoints.createPin,
      tokenRequired: false,
      body: {
        "username": params.userName,
        "deviceId": params.deviceId,
        "pin": params.pin,
      },
    );

    if (_result['error'] != null) {
      await handleApiFailure(
        source: 'createPin',
        errorMessage: _result['message'] as String,
        errorCode: _result['error'] as ApiErrors,
      );
    }
  }

  @override
  Future<UserModel> fetchUser() async {
    final _result = await _networkService.getHttp(
      AuthenticationEndpoints.register,
      tokenRequired: false,
    );

    if (_result['error'] != null) {
      await handleApiFailure(
        source: 'fetchUser',
        errorMessage: _result['message'] as String,
        errorCode: _result['error'] as ApiErrors,
      );
    }

    final user = UserModel.fromJson(_result['data'] as Map);

    return user;
  }

  @override
  Future<UserModel> login(LoginParams params) async {
    final _result = await _networkService.postHttp(
      AuthenticationEndpoints.login,
      body: {
        "username": params.username,
        "password": params.password,
        "device_id": params.deviceId,
      },
      tokenRequired: false,
    );

    if (_result['error'] != null) {
      await handleApiFailure(
        source: 'login',
        errorMessage: _result['message'] as String,
        errorCode: _result['error'] as ApiErrors,
      );
    }

    final user = UserModel.fromJson(_result['data'] as Map);

    return user;
  }

  @override
  Future<void> logout() async {
    final _result = await _networkService.getHttp(
      AuthenticationEndpoints.logout,
      tokenRequired: true,
    );

    if (_result['error'] != null) {
      await handleApiFailure(
        source: 'logout',
        errorMessage: _result['message'] as String,
        errorCode: _result['error'] as ApiErrors,
      );
    }
  }

  @override
  Future<UserModel> signup(SignupParams params) async {
    final _result = await _networkService.postHttp(
      AuthenticationEndpoints.register,
      tokenRequired: false,
      body: {
        "username": params.userName,
        "first_name": params.firstName,
        "last_name": params.lastName,
        "phone_number": params.phone,
        "country_code": params.countryCode,
        "email": params.email,
        "password": params.password,
        "password_confirmation": params.passwordConfirm,
        "role_id": params.roleId,
        "gender_id": params.genderId,
        "device_id": params.deviceId,
      },
    );

    if (_result['error'] != null) {
      await handleApiFailure(
        source: 'signup',
        errorMessage: _result['message'] as String,
        errorCode: _result['error'] as ApiErrors,
      );
    }

    return UserModel.fromJson(_result['data'] as Map);
  }

  @override
  Future<UserModel> verifyPin(PinParams params) async {
    final _result = await _networkService.postHttp(
      AuthenticationEndpoints.login,
      body: {
        "username": params.userName,
        "password": params.pin,
        "device_id": params.deviceId,
      },
      tokenRequired: false,
    );

    if (_result['error'] != null) {
      await handleApiFailure(
        source: 'verifyPin',
        errorMessage: _result['message'] as String,
        errorCode: _result['error'] as ApiErrors,
      );
    }

    final user = UserModel.fromJson(_result);

    return user;
  }

  @override
  Future<List<GenderModel>> getGenders() async {
    final result = await _networkService.getHttp(
      AuthenticationEndpoints.getGenders,
      tokenRequired: false,
    );

    if (result['error'] != null) {
      await handleApiFailure(
        source: 'getGenders',
        errorMessage: result['message'] as String,
        errorCode: result['error'] as ApiErrors,
      );
    }

    logger.i(result);

    return (result['data'] as List)
        .map((e) => GenderModel.fromJson(e as Map))
        .toList();
  }

  @override
  Future<List<RoleModel>> getRoles() async {
    final result = await _networkService.getHttp(
      AuthenticationEndpoints.getRoles,
      tokenRequired: false,
    );

    if (result['error'] != null) {
      await handleApiFailure(
        source: 'getRoles',
        errorMessage: result['message'] as String,
        errorCode: result['error'] as ApiErrors,
      );
    }

    return (result['data'] as List)
        .map((e) => RoleModel.fromJson(e as Map))
        .toList();
  }
}
