import 'dart:math';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class ShapesPainter extends CustomPainter {
  final DateTime time;
  final int minuto;
  final bool isPaint;
  ShapesPainter({
    required this.time,
    this.isPaint = true,
    this.minuto = 0,
  });
  @override
  void paint(Canvas canvas, Size size) {
    var angle = vector.radians(-90);

    final double r =
        sqrt(size.width * size.width + size.height * size.height) / 2;
    final alpha = atan(size.height / size.width);
    final beta = alpha + angle;
    final shiftY = r * sin(beta);
    final shiftX = r * cos(beta);
    final translateX = size.width / 2 - shiftX;
    final translateY = size.height / 2 - shiftY;
    canvas.translate(translateX, translateY);
    canvas.rotate(angle);

    final paint = Paint();
    var center = Offset(size.width / 2, size.height / 2);
    paint.color = Colors.white;
    canvas.drawCircle(center, (size.width / 3 + 3), paint);
    paint.strokeCap = StrokeCap.round;

    /**
     * Seconds line
     */
    final secondsP1 = center;
    double secondDegree = 360 / 60 * time.second;
    // x = cx + r * cos(a)
    double x = (size.width / 2) +
        (size.width / 3 - 0) * cos(vector.radians(secondDegree));
    // y = cy + r * sin(a)
    double y = (size.height / 2) +
        (size.width / 3 - 0) * sin(vector.radians(secondDegree));

    final secondsP2 = Offset(x, y);

    paint.color = const Color.fromARGB(255, 136, 195, 197);
    paint.strokeWidth = 2;

    canvas.drawLine(secondsP1, secondsP2, paint);

    /**
     * Minutes line
     */
    final minutesP1 = center;
    double minuteDegree = 360 / 60 * time.minute;
    // x = cx + r * cos(a)
    x = (size.width / 2) +
        (size.width / 3 - 20) * cos(vector.radians(minuteDegree));
    // y = cy + r * sin(a)
    y = (size.height / 2) +
        (size.width / 3 - 20) * sin(vector.radians(minuteDegree));

    final minutesP2 = Offset(x, y);

    paint.color = Colors.black;
    paint.strokeWidth = 3;
    canvas.drawLine(minutesP1, minutesP2, paint);

    /**
     * Hours line
     */
    final p1 = center;
    double hourseDegree = 360 / 12 * (time.hour - 12);
    hourseDegree += 30 / 60 * time.minute;
    // x = cx + r * cos(a)
    x = (size.width / 2) +
        (size.width / 3 - 40) * cos(vector.radians(hourseDegree));
    // y = cy + r * sin(a)
    y = (size.height / 2) +
        (size.width / 3 - 40) * sin(vector.radians(hourseDegree));

    final p2 = Offset(x, y);

    paint.color = Colors.black;
    paint.strokeWidth = 3;

    canvas.drawLine(p1, p2, paint);

    /**
     * External lines
     */
    for (int i = 0; i < 60; i++) {
      // Calculate line position
      double minute = 360 / 60 * i;

      // Set style every 5 minutes
      paint.color = (i == minuto)
          ? Colors.transparent //Colors.red
          : ((i % 5 == 0)
              ? Colors.transparent //const Color.fromARGB(255, 136, 195, 197) //
              : Colors.transparent // const Color.fromARGB(255, 92, 131, 133) //
          );
      paint.strokeWidth = (i % 5 == 0) ? 4 : 1;

      int distance = (i % 5 == 0) ? 10 : 15;

      double x1 = (size.width / 2) +
          (size.width / 3 + distance) * cos(vector.radians(minute));
      double y1 = (size.height / 2) +
          (size.width / 3 + distance) * sin(vector.radians(minute));
      final p1 = Offset(x1, y1);

      double x2 = (size.width / 2) +
          (size.width / 3 + 30) * cos(vector.radians(minute));
      double y2 = (size.height / 2) +
          (size.width / 3 + 30) * sin(vector.radians(minute));
      final p2 = Offset(x2, y2);

      canvas.drawLine(p1, p2, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
