import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../../route/route_paths.dart';

extension GridCoordinator on BuildContext {
  void goToGrid() => go(RoutePaths.grid);
}
