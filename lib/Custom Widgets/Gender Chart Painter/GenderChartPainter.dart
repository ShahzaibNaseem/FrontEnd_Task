import 'package:flutter/material.dart';

class GenderChartPainter extends CustomPainter {
  final double malePercentage;
  final double femalePercentage;

  GenderChartPainter({
    required this.malePercentage,
    required this.femalePercentage,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final strokeWidth = 16.0;
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;

    final paintBackground = Paint()
      ..color = Colors.grey.shade200
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final paintMale = Paint()
      ..color = Colors.yellow
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final paintFemale = Paint()
      ..color = Colors.blue.shade500
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    // Draw Background Circle
    canvas.drawCircle(center, radius, paintBackground);

    // Draw Male Arc
    double maleAngle = 3.6 * malePercentage;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -1.5,
      maleAngle * 0.0174533,
      false,
      paintMale,
    );

    // Draw Female Arc
    double femaleAngle = 3.6 * femalePercentage;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -1.5 + maleAngle * 0.0174533,
      femaleAngle * 0.0174533,
      false,
      paintFemale,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
