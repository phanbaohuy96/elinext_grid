import 'package:cached_network_image/cached_network_image.dart';
import 'package:elinext_grid/core/constants/grid_layout.dart';
import 'package:elinext_grid/domain/entities/image_item.dart';
import 'package:elinext_grid/presentation/modules/grid/views/widgets/image_cell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

const _item = ImageItem(id: 'x', url: 'https://example.test/x.jpg');

Widget _wrap(Widget child) => MaterialApp(
  home: Scaffold(body: SizedBox(width: 100, height: 100, child: child)),
);

void main() {
  group('Requirement: rounded corners radius 7', () {
    testWidgets('ImageCell wraps CachedNetworkImage in a ClipRRect(r=7)', (
      tester,
    ) async {
      await tester.pumpWidget(_wrap(const ImageCell(item: _item)));
      await tester.pump();

      final cellFinder = find.byType(ImageCell);
      final clip = tester.widget<ClipRRect>(
        find.descendant(of: cellFinder, matching: find.byType(ClipRRect)),
      );
      expect(clip.borderRadius, BorderRadius.circular(GridLayout.cornerRadius));
      expect(
        find.descendant(
          of: cellFinder,
          matching: find.byType(CachedNetworkImage),
        ),
        findsOneWidget,
      );
    });
  });

  group('Requirement: activity indicator while image loads', () {
    testWidgets(
      'CachedNetworkImage placeholder is a CircularProgressIndicator',
      (tester) async {
        await tester.pumpWidget(_wrap(const ImageCell(item: _item)));
        await tester.pump();

        final cell = tester.widget<CachedNetworkImage>(
          find.byType(CachedNetworkImage),
        );
        final placeholder = cell.placeholder!(
          tester.element(find.byType(CachedNetworkImage)),
          '',
        );
        expect(
          find.descendant(
            of: find.byWidget(placeholder),
            matching: find.byType(CircularProgressIndicator),
          ),
          findsOneWidget,
        );
      },
    );
  });
}
