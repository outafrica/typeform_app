// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'core_injector.dart';

// **************************************************************************
// KiwiInjectorGenerator
// **************************************************************************

class _$CoreInjector extends CoreInjector {
  @override
  void _configure() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerFactory<DatabaseService>((c) => HiveDatabaseService())
      ..registerFactory<NetworkService>((c) => NetworkServiceImpl())
      ..registerSingleton((c) => FlutterSecureStorage(
          iOptions: c<IOSOptions>(),
          aOptions: c<AndroidOptions>(),
          lOptions: c<LinuxOptions>(),
          wOptions: c<WindowsOptions>(),
          webOptions: c<WebOptions>(),
          mOptions: c<MacOsOptions>()))
      ..registerSingleton((c) => NavigatorService());
  }
}
