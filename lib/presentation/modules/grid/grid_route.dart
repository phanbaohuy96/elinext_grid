import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/di/injection.dart';
import '../../route/i_feature_route.dart';
import '../../route/route_paths.dart';
import 'bloc/grid_bloc.dart';
import 'bloc/grid_event.dart';
import 'views/pages/grid_page.dart';

class GridRoute implements IFeatureRoute {
  @override
  List<RouteBase> routes() => [
    GoRoute(
      path: RoutePaths.grid,
      builder: (_, _) => BlocProvider<GridBloc>(
        create: (_) => getIt<GridBloc>()..add(const GridEvent.loadInitial()),
        child: const GridPage(),
      ),
    ),
  ];
}
