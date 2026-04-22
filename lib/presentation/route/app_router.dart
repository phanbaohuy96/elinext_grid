import 'package:go_router/go_router.dart';

import '../modules/grid/grid_route.dart';
import 'route_paths.dart';

class AppRouter {
  const AppRouter._();

  static GoRouter build() => GoRouter(
    initialLocation: RoutePaths.grid,
    routes: [...GridRoute().routes()],
  );
}
