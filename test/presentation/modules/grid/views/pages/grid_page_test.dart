import 'package:elinext_grid/core/constants/grid_layout.dart';
import 'package:elinext_grid/domain/entities/image_item.dart';
import 'package:elinext_grid/l10n/generated/app_localizations.dart';
import 'package:elinext_grid/l10n/generated/app_localizations_en.dart';
import 'package:elinext_grid/presentation/modules/grid/bloc/grid_bloc.dart';
import 'package:elinext_grid/presentation/modules/grid/bloc/grid_event.dart';
import 'package:elinext_grid/presentation/modules/grid/bloc/grid_state.dart';
import 'package:elinext_grid/presentation/modules/grid/views/pages/grid_page.dart';
import 'package:elinext_grid/presentation/modules/grid/views/widgets/page_indicator.dart';
import 'package:flutter/material.dart';
// ignore: invalid_use_of_visible_for_testing_member
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

import '../../../../../helpers/test_factories.dart';

final _en = AppLocalizationsEn();

Widget _wrap(GridBloc bloc) {
  final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (_, _) =>
            BlocProvider<GridBloc>.value(value: bloc, child: const GridPage()),
      ),
    ],
  );
  return MaterialApp.router(
    routerConfig: router,
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
  );
}

void main() {
  late GridBloc bloc;

  setUp(() => bloc = buildGridBloc());
  tearDown(() async => bloc.close());

  group('Requirement: top bar with + and Reload All', () {
    testWidgets('renders English AppBar with + and Reload All', (tester) async {
      await tester.pumpWidget(_wrap(bloc));
      await tester.pumpAndSettle();

      expect(find.text(_en.appTitle), findsOneWidget);
      expect(find.text(_en.actionReloadAll), findsOneWidget);
      expect(find.byTooltip(_en.actionAddImage), findsOneWidget);
    });
  });

  group('Requirement: + appends one image', () {
    testWidgets('tapping + dispatches AddImageRequested', (tester) async {
      await tester.pumpWidget(_wrap(bloc));
      await tester.pumpAndSettle();

      await tester.tap(find.byTooltip(_en.actionAddImage));
      await tester.pumpAndSettle();

      expect(bloc.state.images.length, 1);
    });
  });

  group('Requirement: Reload All loads a fresh batch', () {
    testWidgets('tapping Reload All loads a fresh batch', (tester) async {
      bloc.add(const GridEvent.addImageRequested());
      await tester.pumpWidget(_wrap(bloc));
      await tester.pump();

      await tester.tap(find.text(_en.actionReloadAll));
      await tester.pump();

      expect(bloc.state.images.length, GridLayout.initialBatchSize);
    });
  });

  group('Empty state', () {
    testWidgets('shows empty-state copy when there are no images', (
      tester,
    ) async {
      await tester.pumpWidget(_wrap(bloc));
      await tester.pumpAndSettle();

      expect(find.text(_en.emptyImages), findsOneWidget);
    });
  });

  group('PageIndicator', () {
    testWidgets('hidden when only one page', (tester) async {
      bloc.emit(
        GridState(
          images: List.generate(
            GridLayout.itemsPerPage,
            (i) => ImageItem(id: 's-$i', url: 'https://example.test/s-$i.jpg'),
          ),
        ),
      );
      await tester.pumpWidget(_wrap(bloc));
      await tester.pump();

      expect(find.byType(PageIndicator), findsNothing);
    });

    testWidgets('visible when there are multiple pages', (tester) async {
      bloc.emit(
        GridState(
          images: List.generate(
            GridLayout.initialBatchSize,
            (i) => ImageItem(id: 's-$i', url: 'https://example.test/s-$i.jpg'),
          ),
        ),
      );
      await tester.pumpWidget(_wrap(bloc));
      await tester.pump();

      expect(find.byType(PageIndicator), findsOneWidget);
    });
  });

  // Note: the actual animation-to-new-page is exercised by the e2e test
  // (integration_test/app_test.dart). In a widget-level test the page-slide
  // animation collides with the cells' CircularProgressIndicator placeholder
  // animations under flutter_test's clock, making pump-driven verification
  // brittle.
}
