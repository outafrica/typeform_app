// Package imports:
import 'package:kiwi/kiwi.dart';

// Project imports:
import 'package:typeform_app/core/data/network/network_service.dart';
import 'package:typeform_app/features/home/data/datasources/home_remote_data_source.dart';
import 'package:typeform_app/features/home/data/repositories/home_repository_impl.dart';
import 'package:typeform_app/features/home/domain/repositories/home_repository.dart';
import 'package:typeform_app/features/home/domain/usecases/home_usecases.dart';

part 'home_module_injector.g.dart';

abstract class HomeModuleInjector {
  static late KiwiContainer container;
  static final resolve = container.resolve;

  void setup() {
    container = KiwiContainer();
    _$HomeModuleInjector()._configure();
  }

  @Register.factory(HomeRemoteDataSource, from: HomeDataSourceImpl)
  @Register.factory(HomeRepository, from: HomeRepositoryImpl)
  @Register.singleton(CreateOption)
  @Register.singleton(CreateQuestion)
  @Register.singleton(GetCategories)
  @Register.singleton(GetForms)
  @Register.singleton(GetOptionTypes)
  @Register.singleton(GetQuestions)
  void _configure(); // ignore: unused_element
}

HomeModuleInjector homeModuleInjector() => _$HomeModuleInjector();
