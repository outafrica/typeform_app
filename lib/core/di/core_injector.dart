// Package imports:
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:kiwi/kiwi.dart';

// Project imports:
import 'package:typeform_app/core/data/database/database_service.dart';
import 'package:typeform_app/core/data/database/database_service_impl.dart';
import 'package:typeform_app/core/data/network/network_service.dart';
import 'package:typeform_app/core/data/network/network_service_impl.dart';
import 'package:typeform_app/core/presentation/widgets/nav_service.dart';

part 'core_injector.g.dart';

abstract class CoreInjector {
  static KiwiContainer? kiwiContainer;
  static final resolve = kiwiContainer!.resolve;

  void setup() {
    kiwiContainer = KiwiContainer();
    _$CoreInjector()._configure();
  }

  @Register.factory(DatabaseService, from: HiveDatabaseService)
  @Register.factory(NetworkService, from: NetworkServiceImpl)
  @Register.singleton(FlutterSecureStorage)
  @Register.singleton(NavigatorService)
  void _configure(); // ignore: unused_element
}

CoreInjector coreInjector() => _$CoreInjector();
