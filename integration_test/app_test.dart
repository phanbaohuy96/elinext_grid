import 'package:cached_network_image/cached_network_image.dart';
import 'package:elinext_grid/core/constants/grid_layout.dart';
import 'package:elinext_grid/main.dart' as app;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  const onePage = GridLayout.itemsPerPage;

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

  double currentPage(WidgetTester tester) {
    final pageView = tester.widget<PageView>(find.byType(PageView));
    return pageView.controller?.page ?? 0;
  }

  testWidgets('e2e: boot, +, animate-add, reload, animate-back', (
    tester,
  ) async {
    app.main();
    await tester.pumpAndSettle(const Duration(seconds: 1));

    await waitFor(
      tester,
      () => find.byType(CachedNetworkImage).evaluate().length == onePage,
    );
    expect(currentPage(tester), 0.0);

    // Tap "+" → state grows by 1, listener animates to the new last page.
    await tester.tap(find.byTooltip('Add image'));
    await waitFor(
      tester,
      () => currentPage(tester) > 1.5,
      timeout: const Duration(seconds: 5),
    );

    // Tap "Reload All" → fresh batch + auto-animate back to page 0.
    await tester.tap(find.text('Reload All'));
    await waitFor(
      tester,
      () => currentPage(tester) < 0.5,
      timeout: const Duration(seconds: 10),
    );
  });
}
