// Dart imports:
import 'dart:async';
import 'dart:convert';

// Project imports:
import 'package:typeform_app/core/data/database/database_service.dart';
import 'package:typeform_app/core/data/database/up_boxes.dart';
import 'package:typeform_app/core/data/datasources/local_datasource_base.dart';
import 'package:typeform_app/features/authentication/data/models/user_model.dart';

abstract class AuthenticationLocalDatasource
    implements LocalDataSource<UserModel> {
  Future<UserModel?> getPersonalAccountUser();
  Future<void> savePersonalAccountUser(UserModel user);
  Future<void> deletePersonalAccountUser(UserModel user);
  Future<void> logout();
}

class AuthenticationLocalDatasourceImpl
    implements AuthenticationLocalDatasource {
  final DatabaseService _databaseService;
  static final StreamController<UserModel> _streamController =
      StreamController.broadcast();

  AuthenticationLocalDatasourceImpl(this._databaseService);

  @override
  StreamController<UserModel> get dataStreamController => _streamController;

  @override
  void dispose() {
    _streamController.close();
  }

  @override
  Future<UserModel?> getPersonalAccountUser() async {
    final result = await _databaseService.retrieve(
      collection: UpBoxes.users,
      key: UpBoxKeys.userPersonalAccountUser.toString(),
      notFoundDefault: null,
    );

    if (result['data'] == null) {
      return null;
    }

    if (!(result['data'] as Map).containsKey('userProfile')) {
      return null;
    }

    final data = jsonDecode(jsonEncode(result['data']));

    return UserModel.fromJson(data as Map);
  }

  @override
  Future<void> savePersonalAccountUser(UserModel user) async {
    await _databaseService.create(
      collection: UpBoxes.users,
      key: UpBoxKeys.userPersonalAccountUser.toString(),
      value: user.toJson(),
    );

    _streamController.add(user);
  }

  @override
  Future<void> deletePersonalAccountUser(UserModel user) async {
    await _databaseService.delete(
      collection: UpBoxes.users,
      key: UpBoxKeys.userPersonalAccountUser.toString(),
    );
  }

  @override
  Future<void> logout() async => _databaseService.clearData();
}
