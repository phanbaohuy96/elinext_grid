import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/grid_layout.dart';
import '../../../../../domain/entities/image_item.dart';

class ImageCell extends StatelessWidget {
  const ImageCell({super.key, required this.item});

  final ImageItem item;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(GridLayout.cornerRadius),
        child: CachedNetworkImage(
          imageUrl: item.url,
          cacheKey: item.id,
          fit: BoxFit.cover,
          fadeInDuration: const Duration(milliseconds: 150),
          placeholder: (context, _) => const ColoredBox(
            color: Color(0xFFE0E0E0),
            child: Center(
              child: SizedBox(
                width: 18,
                height: 18,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),
          ),
          errorWidget: (context, _, _) => const ColoredBox(
            color: Color(0xFFE0E0E0),
            child: Icon(Icons.broken_image, size: 18, color: Colors.black38),
          ),
        ),
      ),
    );
  }
}
