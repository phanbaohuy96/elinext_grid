import 'package:flutter/material.dart';

import '../../../../../core/constants/grid_layout.dart';
import '../../../../../domain/entities/image_item.dart';
import '../../../../../l10n/localization_ext.dart';
import 'image_cell.dart';

class PaginatedGrid extends StatelessWidget {
  const PaginatedGrid({
    super.key,
    required this.images,
    required this.controller,
  });

  final List<ImageItem> images;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    if (images.isEmpty) {
      return Center(
        child: Text(
          context.l10n.emptyImages,
          style: TextStyle(color: Theme.of(context).hintColor),
        ),
      );
    }

    final pageCount =
        (images.length + GridLayout.itemsPerPage - 1) ~/
        GridLayout.itemsPerPage;

    return PageView.builder(
      controller: controller,
      itemCount: pageCount,
      itemBuilder: (context, pageIndex) {
        final start = pageIndex * GridLayout.itemsPerPage;
        final length = (images.length - start).clamp(
          0,
          GridLayout.itemsPerPage,
        );
        return _GridPage(images: images, start: start, length: length);
      },
    );
  }
}

class _GridPage extends StatefulWidget {
  const _GridPage({
    required this.images,
    required this.start,
    required this.length,
  });

  final List<ImageItem> images;
  final int start;
  final int length;

  @override
  State<_GridPage> createState() => _GridPageState();
}

class _GridPageState extends State<_GridPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Padding(
      padding: const EdgeInsets.all(GridLayout.spacing),
      child: GridView.builder(
        addRepaintBoundaries: false,
        itemCount: widget.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: GridLayout.columns,
          mainAxisSpacing: GridLayout.spacing,
          crossAxisSpacing: GridLayout.spacing,
        ),
        itemBuilder: (context, index) {
          final item = widget.images[widget.start + index];
          return ImageCell(key: ValueKey(item.id), item: item);
        },
      ),
    );
  }
}
