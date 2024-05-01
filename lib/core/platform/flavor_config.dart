// define the environement values
enum Flavor { development, staging, production }

// define the class for fetching the environment url
class FlavorValues {
  final String baseUrl;

  FlavorValues({
    required this.baseUrl,
  });
}

class FlavorConfig {
  final Flavor flavor;
  final FlavorValues flavorValues;
  static FlavorConfig? _instance;

  factory FlavorConfig({
    required Flavor flavor,
    required FlavorValues flavorValues,
  }) =>
      _instance ??= FlavorConfig._internal(flavor, flavorValues);

  FlavorConfig._internal(this.flavor, this.flavorValues);
  static FlavorConfig get instance => _instance!;

  static bool isDev() => _instance!.flavor == Flavor.development;
  static bool isStage() => _instance!.flavor == Flavor.staging;
  static bool isProd() => _instance!.flavor == Flavor.production;
}
