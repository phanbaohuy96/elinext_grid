import 'package:flutter/material.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({
    super.key,
    required this.controller,
    required this.pageCount,
  });

  final PageController controller;
  final int pageCount;

  static const double _dotSize = 6;
  static const double _activeDotWidth = 18;
  static const double _gap = 6;

  @override
  Widget build(BuildContext context) {
    if (pageCount <= 1) {
      return const SizedBox.shrink();
    }

    final theme = Theme.of(context);
    final activeColor = theme.colorScheme.primary;
    final inactiveColor = theme.colorScheme.primary.withValues(alpha: 0.3);

    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        final page = controller.hasClients && controller.page != null
            ? controller.page!
            : controller.initialPage.toDouble();
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(pageCount, (i) {
            final distance = (page - i).abs().clamp(0.0, 1.0);
            final width =
                _dotSize + (_activeDotWidth - _dotSize) * (1 - distance);
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: _gap / 2),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                height: _dotSize,
                width: width,
                decoration: BoxDecoration(
                  color: Color.lerp(inactiveColor, activeColor, 1 - distance),
                  borderRadius: BorderRadius.circular(_dotSize / 2),
                ),
              ),
            );
          }),
        );
      },
    );
  }
}
