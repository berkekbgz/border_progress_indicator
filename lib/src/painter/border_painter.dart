import 'dart:ui';

import 'package:flutter/rendering.dart';

class BorderPainter extends CustomPainter {
  final double strokeWidth;
  final Color color;
  final double value;
  final double borderRadius;

  BorderPainter(
    this.value, {
    required this.color,
    this.strokeWidth = 2,
    this.borderRadius = 10,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final animationPercent = value;

    final path = Path()
      ..moveTo(size.width / 2, 0)
      ..lineTo(size.width - borderRadius, 0)
      ..arcToPoint(Offset(size.width, borderRadius),
          radius: Radius.circular(borderRadius))
      ..lineTo(size.width, size.height - borderRadius)
      ..arcToPoint(Offset(size.width - borderRadius, size.height),
          radius: Radius.circular(borderRadius))
      ..lineTo(borderRadius, size.height)
      ..arcToPoint(Offset(0, size.height - borderRadius),
          radius: Radius.circular(borderRadius))
      ..lineTo(0, borderRadius)
      ..arcToPoint(Offset(borderRadius, 0),
          radius: Radius.circular(borderRadius))
      ..lineTo(size.width / 2, 0);

    final totalLength = path
        .computeMetrics()
        .fold(0.0, (double prev, PathMetric metric) => prev + metric.length);

    final currentLength = totalLength * animationPercent;

    final followablePath = extractPathUntilLength(path, currentLength);

    final Paint paint = Paint();
    paint
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..isAntiAlias = true
      ..filterQuality = FilterQuality.high
      ..strokeJoin = StrokeJoin.round;

    canvas.drawPath(followablePath, paint);
  }

  @override
  bool shouldRepaint(BorderPainter oldDelegate) => value != oldDelegate.value;

  Path extractPathUntilLength(
    Path originalPath,
    double length,
  ) {
    var currentLength = 0.0;

    final path = Path();

    var metricsIterator = originalPath.computeMetrics().iterator;

    while (metricsIterator.moveNext()) {
      var metric = metricsIterator.current;

      var nextLength = currentLength + metric.length;

      final isLastSegment = nextLength > length;
      if (isLastSegment) {
        final remainingLength = length - currentLength;
        final pathSegment = metric.extractPath(0.0, remainingLength);

        path.addPath(pathSegment, Offset.zero);
        break;
      } else {
        final pathSegment = metric.extractPath(0.0, metric.length);
        path.addPath(pathSegment, Offset.zero);
      }

      currentLength = nextLength;
    }

    return path;
  }
}
