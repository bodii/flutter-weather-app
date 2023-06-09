import 'package:flutter/material.dart';

import 'dart:math';

class ArcPainter extends CustomPainter {
  const ArcPainter({
    required this.color,
    required this.length,
  });

  final Color color;
  final double length;
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..style = PaintingStyle.stroke
      ..isAntiAlias = true
      ..strokeWidth = 5.0
      ..color = color
      ..invertColors = false;

    Rect rect = Rect.fromCircle(
      center: Offset(size.width, size.height),
      radius: 100.0,
    );

    canvas.drawArc(rect, pi, pi * length, false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
