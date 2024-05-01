class EnvironmentConfig {
  // ignore: constant_identifier_names
  static const ENVIRONMENT_VAR = String.fromEnvironment(
    'ENVIRONMENT_VAR',
    defaultValue: 'STAGING',
  );
}
