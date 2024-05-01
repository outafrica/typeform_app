// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_module_injector.dart';

// **************************************************************************
// KiwiInjectorGenerator
// **************************************************************************

class _$HomeModuleInjector extends HomeModuleInjector {
  @override
  void _configure() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerFactory<HomeRemoteDataSource>(
          (c) => HomeDataSourceImpl(c<NetworkService>()))
      ..registerFactory<HomeRepository>(
          (c) => HomeRepositoryImpl(c<HomeRemoteDataSource>()))
      ..registerSingleton((c) => CreateOption(c<HomeRepository>()))
      ..registerSingleton((c) => CreateQuestion(c<HomeRepository>()))
      ..registerSingleton((c) => GetCategories(c<HomeRepository>()))
      ..registerSingleton((c) => GetForms(c<HomeRepository>()))
      ..registerSingleton((c) => GetOptionTypes(c<HomeRepository>()))
      ..registerSingleton((c) => GetQuestions(c<HomeRepository>()));
  }
}
