enum Flavor {
  prod,
  dev,
  stage,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.prod:
        return 'BOILERPLATE_PROD';
      case Flavor.dev:
        return 'BOILERPLATE_DEV';
      case Flavor.stage:
        return 'BOILERPLATE_STAGE';
      default:
        return 'title';
    }
  }
}
