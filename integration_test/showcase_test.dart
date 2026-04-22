import 'package:cached_network_image/cached_network_image.dart';
import 'package:elinext_grid/core/constants/grid_layout.dart';
import 'package:elinext_grid/main.dart' as app;
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

Future<void> main() async {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  Future<void> waitFor(
    WidgetTester tester,
    bool Function() predicate, {
    Duration timeout = const Duration(seconds: 30),
    Duration step = const Duration(milliseconds: 200),
  }) async {
    final deadline = DateTime.now().add(timeout);
    while (DateTime.now().isBefore(deadline)) {
      await tester.pump(step);
      if (predicate()) {
        return;
      }
    }
    fail('Timed out after ${timeout.inSeconds}s waiting for predicate');
  }

  Future<void> settle(WidgetTester tester, [int seconds = 8]) async {
    await tester.runAsync(
      () => Future<void>.delayed(Duration(seconds: seconds)),
    );
    for (var i = 0; i < 10; i++) {
      await tester.pump(const Duration(milliseconds: 100));
    }
  }

  Future<void> shoot(WidgetTester tester, String name) async {
    await binding.convertFlutterSurfaceToImage();
    await tester.pump();
    await binding.takeScreenshot(name);
  }

  testWidgets('showcase: capture screens for README', (tester) async {
    app.main();
    await tester.pumpAndSettle(const Duration(seconds: 1));

    // Initial grid (page 1 of 2).
    await waitFor(
      tester,
      () =>
          find.byType(CachedNetworkImage).evaluate().length >=
          GridLayout.itemsPerPage,
    );
    await settle(tester, 10);
    await shoot(tester, '01_grid_page1');

    // Tap "+" → auto-animates to the (new) last page.
    await tester.tap(find.byTooltip('Add image'));
    await settle(tester, 8);
    await shoot(tester, '02_added_animated_to_last_page');

    // Reload All → fresh batch (cache miss on every cell) + auto-animate to 0.
    await tester.tap(find.text('Reload All'));
    await settle(tester, 14);
    await shoot(tester, '03_reloaded');
  });
}
