import 'package:border_progress_indicator/src/painter/border_painter.dart';
import 'package:flutter/material.dart';

class AnimatedBorderProgressIndicator extends ImplicitlyAnimatedWidget {
  final Widget? child;
  final double strokeWidth;
  final Color color;
  final double value;
  final double borderRadius;

  const AnimatedBorderProgressIndicator({
    super.key,
    super.duration = const Duration(milliseconds: 300),
    super.curve = Curves.easeInOut,
    this.child,
    this.strokeWidth = 1,
    this.color = Colors.black,
    this.value = 0,
    this.borderRadius = 0,
  });

  @override
  AnimatedWidgetBaseState<AnimatedBorderProgressIndicator> createState() =>
      _AnimatedBorderProgressIndicatorState();
}

class _AnimatedBorderProgressIndicatorState
    extends AnimatedWidgetBaseState<AnimatedBorderProgressIndicator> {
  Tween<double>? _percent;
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: BorderPainter(
        _percent!.evaluate(animation),
        color: widget.color,
        strokeWidth: widget.strokeWidth,
        borderRadius: widget.borderRadius,
      ),
      child: widget.child,
    );
  }

  @override
  void forEachTween(visitor) {
    _percent = visitor(
      _percent,
      widget.value,
      (dynamic value) => Tween<double>(begin: value as double),
    ) as Tween<double>;
  }
}
