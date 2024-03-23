/// Represents the app routes and their paths.
enum AppRoutes {
  signIn(
    name: 'signIn',
    path: '/signIn',
  ),
  signUp(
    name: 'signUp',
    path: '/signUp',
  );

  const AppRoutes({
    required this.name,
    required this.path,
  });

  /// Represents the route name
  ///
  /// Example: `AppRoutes.signIn.name`
  /// Returns: 'recipesList'
  final String name;

  /// Represents the route path
  ///
  /// Example: `AppRoutes.signIn.path`
  /// Returns: '/recipesList'
  final String path;

  @override
  String toString() => name;
}
