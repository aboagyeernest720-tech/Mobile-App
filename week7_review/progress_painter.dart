import 'package:flutter/material.dart';
import 'dart:math';

class MyCirclePainter extends CustomPainter {
  final double progress; // Value between 0.0 and 1.0
  MyCirclePainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke;

    // Draw the circle based on progress
    canvas.drawArc(
      Rect.fromLTWH(0, 0, size.width, size.height),
      -pi / 2,      // Start at the top
      2 * pi * progress, 
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(MyCirclePainter oldDelegate) => oldDelegate.progress != progress;
}