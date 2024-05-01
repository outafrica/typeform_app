// Project imports:
import 'package:typeform_app/features/authentication/domain/authentication_module_injector.dart';
import 'package:typeform_app/features/home/domain/home_module_injector.dart';

import 'core_injector.dart';

// register all relevant injectors(usually per feature)
void configureDependencies() {
  coreInjector().setup();
  authenticationModuleInjector().setup();
  homeModuleInjector().setup();
}
