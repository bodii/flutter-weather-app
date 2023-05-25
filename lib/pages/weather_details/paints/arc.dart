import 'package:flutter/material.dart';

const double pi = 3.14;

class ArcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..style = PaintingStyle.stroke
      ..isAntiAlias = true
      ..strokeWidth = 0.0
      ..color = Colors.redAccent
      ..invertColors = false;

    Rect rect = Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: 100.0,
    );

    canvas.drawArc(rect, 0.0, 2 * pi / 4, false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
