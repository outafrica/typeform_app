// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_module_injector.dart';

// **************************************************************************
// KiwiInjectorGenerator
// **************************************************************************

class _$AuthenticationModuleInjector extends AuthenticationModuleInjector {
  @override
  void _configure() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerFactory<AuthenticationLocalDatasource>(
          (c) => AuthenticationLocalDatasourceImpl(c<DatabaseService>()))
      ..registerFactory<AuthenticationRemoteDataSource>(
          (c) => AuthenticationDataSourceImpl(c<NetworkService>()))
      ..registerFactory<AuthenticationRepository>((c) =>
          AuthenticationRepositoryImpl(c<AuthenticationLocalDatasource>(),
              c<AuthenticationRemoteDataSource>()))
      ..registerSingleton((c) => CheckLogin(c<AuthenticationRepository>()))
      ..registerSingleton((c) => CreatePin(c<AuthenticationRepository>()))
      ..registerSingleton((c) => FetchUser(c<AuthenticationRepository>()))
      ..registerSingleton((c) => Login(c<AuthenticationRepository>()))
      ..registerSingleton((c) => LogOut(c<AuthenticationRepository>()))
      ..registerSingleton((c) => SignUp(c<AuthenticationRepository>()))
      ..registerSingleton((c) => GetRoles(c<AuthenticationRepository>()))
      ..registerSingleton((c) => VerifyPin(c<AuthenticationRepository>()))
      ..registerSingleton((c) => GetGenders(c<AuthenticationRepository>()));
  }
}
