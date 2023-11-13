import 'package:border_progress_indicator/src/painter/border_painter.dart';
import 'package:flutter/material.dart';

class BorderProgressIndicator extends StatefulWidget {
  final Widget? child;
  final double strokeWidth;
  final Color color;
  final double value;
  final double borderRadius;

  const BorderProgressIndicator({
    super.key,
    this.child,
    this.strokeWidth = 1,
    this.color = Colors.black,
    this.value = 0,
    this.borderRadius = 0,
  });

  @override
  State<BorderProgressIndicator> createState() =>
      _BorderProgressIndicatorState();
}

class _BorderProgressIndicatorState extends State<BorderProgressIndicator> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: BorderPainter(
        widget.value,
        color: widget.color,
        strokeWidth: widget.strokeWidth,
        borderRadius: widget.borderRadius,
      ),
      child: widget.child,
    );
  }
}
