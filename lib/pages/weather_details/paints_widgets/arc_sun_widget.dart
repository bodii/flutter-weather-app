import 'package:flutter/material.dart';

import 'arc_painter.dart';

class ArcSunWidget extends StatelessWidget {
  const ArcSunWidget({
    super.key,
    required this.color,
    required this.length,
  });

  final Color color;
  final double length;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 150,
      top: 130,
      child: CustomPaint(
        painter: ArcPainter(color: color, length: length),
      ),
    );
  }
}
