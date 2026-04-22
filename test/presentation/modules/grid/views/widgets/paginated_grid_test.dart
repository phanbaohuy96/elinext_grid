import 'package:elinext_grid/core/constants/grid_layout.dart';
import 'package:elinext_grid/domain/entities/image_item.dart';
import 'package:elinext_grid/l10n/generated/app_localizations.dart';
import 'package:elinext_grid/presentation/modules/grid/views/widgets/paginated_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

List<ImageItem> _items(int n) => List.generate(
  n,
  (i) => ImageItem(id: 'p-$i', url: 'https://example.test/p-$i.jpg'),
);

Widget _wrap(Widget child) {
  final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (_, _) => Scaffold(body: child),
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
  group('Requirement: 7×10 grid with 2pt spacing, horizontal pagination', () {
    testWidgets('GridView is configured with 7 columns and 2pt spacing', (
      tester,
    ) async {
      final controller = PageController();
      addTearDown(controller.dispose);

      await tester.pumpWidget(
        _wrap(
          PaginatedGrid(
            images: _items(GridLayout.itemsPerPage),
            controller: controller,
          ),
        ),
      );
      await tester.pump();

      final grid = tester.widget<GridView>(find.byType(GridView));
      final delegate =
          grid.gridDelegate as SliverGridDelegateWithFixedCrossAxisCount;

      expect(delegate.crossAxisCount, 7);
      expect(delegate.mainAxisSpacing, 2);
      expect(delegate.crossAxisSpacing, 2);
    });

    testWidgets(
      'page 1 GridView.itemCount equals itemsPerPage on a full batch',
      (tester) async {
        final controller = PageController();
        addTearDown(controller.dispose);

        await tester.pumpWidget(
          _wrap(
            PaginatedGrid(
              images: _items(GridLayout.itemsPerPage * 2),
              controller: controller,
            ),
          ),
        );
        await tester.pump();

        final grid = tester.widget<GridView>(find.byType(GridView).first);
        final delegate = grid.childrenDelegate as SliverChildBuilderDelegate;
        expect(delegate.childCount, GridLayout.itemsPerPage);
      },
    );

    testWidgets('PageView is horizontal (default)', (tester) async {
      final controller = PageController();
      addTearDown(controller.dispose);

      await tester.pumpWidget(
        _wrap(
          PaginatedGrid(
            images: _items(GridLayout.initialBatchSize),
            controller: controller,
          ),
        ),
      );
      await tester.pump();

      final pageView = tester.widget<PageView>(find.byType(PageView));
      expect(pageView.scrollDirection, Axis.horizontal);
    });
  });
}
