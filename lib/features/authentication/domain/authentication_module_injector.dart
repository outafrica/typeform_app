// Package imports:
import 'package:kiwi/kiwi.dart';

// Project imports:
import 'package:typeform_app/core/data/database/database_service.dart';
import 'package:typeform_app/core/data/network/network_service.dart';
import 'package:typeform_app/features/authentication/data/datasources/authentication_local_datasource.dart';
import 'package:typeform_app/features/authentication/data/datasources/authentication_remote_datasource.dart';
import 'package:typeform_app/features/authentication/data/repositories/authentication_repository_impl.dart';
import 'package:typeform_app/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:typeform_app/features/authentication/domain/usecases/authentication_usecases.dart';

part 'authentication_module_injector.g.dart';

abstract class AuthenticationModuleInjector {
  static late KiwiContainer container;
  static final resolve = container.resolve;

  void setup() {
    container = KiwiContainer();
    _$AuthenticationModuleInjector()._configure();
  }

  @Register.factory(AuthenticationLocalDatasource,
      from: AuthenticationLocalDatasourceImpl)
  @Register.factory(AuthenticationRemoteDataSource,
      from: AuthenticationDataSourceImpl)
  @Register.factory(AuthenticationRepository,
      from: AuthenticationRepositoryImpl)
  @Register.singleton(CheckLogin)
  @Register.singleton(CreatePin)
  @Register.singleton(FetchUser)
  @Register.singleton(Login)
  @Register.singleton(LogOut)
  @Register.singleton(SignUp)
  @Register.singleton(GetRoles)
  @Register.singleton(VerifyPin)
  @Register.singleton(GetGenders)
  void _configure(); // ignore: unused_element
}

AuthenticationModuleInjector authenticationModuleInjector() =>
    _$AuthenticationModuleInjector();
