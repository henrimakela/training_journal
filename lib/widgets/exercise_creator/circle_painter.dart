import 'package:flutter/material.dart';

class CirclePainter extends CustomPainter{

  Color color;
  Offset offset;
  double radius;

  CirclePainter({this.color, this.offset, this.radius});
  
  @override
  void paint(Canvas canvas, Size size) {

    Paint backgroundPaint = Paint();
    backgroundPaint.color = color;
    backgroundPaint.style = PaintingStyle.fill;

    canvas.drawCircle(offset, radius, backgroundPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {

    return true;
  }

}