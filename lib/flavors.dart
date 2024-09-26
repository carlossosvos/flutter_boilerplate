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
        return 'My Boilerplate App';
      case Flavor.dev:
        return 'My Boilerplate App Dev';
      case Flavor.stage:
        return 'My Boilerplate App Stage';
      default:
        return 'title';
    }
  }
}
