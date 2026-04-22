import 'package:elinext_grid/presentation/modules/grid/views/widgets/page_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PageIndicator', () {
    testWidgets('renders nothing when pageCount <= 1', (tester) async {
      final controller = PageController();
      addTearDown(controller.dispose);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PageIndicator(controller: controller, pageCount: 1),
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(AnimatedContainer), findsNothing);
    });

    testWidgets('renders one AnimatedContainer per page', (tester) async {
      final controller = PageController();
      addTearDown(controller.dispose);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PageIndicator(controller: controller, pageCount: 3),
          ),
        ),
      );
      await tester.pump();

      expect(find.byType(AnimatedContainer), findsNWidgets(3));
    });
  });
}
