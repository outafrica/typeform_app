import 'package:typeform_app/features/authentication/data/models/authentication_models.dart';
import 'package:typeform_app/features/authentication/domain/params/authentication_params.dart';

abstract class AuthenticationRepository {
  Future<UserModel?> checkLogin();
  Future<UserModel> login(LoginParams params);
  Future<UserModel> signup(SignupParams params);
  Future<List<RoleModel>> getRoles();
  Future<List<GenderModel>> getGenders();
  Future<void> createPin(PinParams pin);
  Future<UserModel> verifyPin(PinParams pin);
  Future<UserModel> fetchUser();
  Future<void> logout();
}
