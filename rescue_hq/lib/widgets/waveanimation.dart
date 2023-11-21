// ignore_for_file: library_private_types_in_public_api
import 'dart:math';

import 'package:flutter/material.dart';

class WaveAnimation extends StatefulWidget {
  const WaveAnimation({
    super.key,
    this.size = 80.0,
    required this.child,
  });
  final double size;
  final Widget child;

  @override
  _WaveAnimationState createState() => _WaveAnimationState();
}

class _WaveAnimationState extends State<WaveAnimation>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  final Color _color = const Color(0xFFFFD600);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint(
        painter: CirclePainter(
          _controller,
          color: _color.withOpacity(0.1),
        ),
        child: SizedBox(
          width: widget.size * 2,
          height: widget.size * 2,
          child: _button(),
        ),
      ),
    );
  }

  Widget _button() {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(widget.size),
        child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: RadialGradient(
              colors: <Color>[
                _color,
                Color.lerp(_color, Colors.black, 0.05) ?? Colors.transparent,
              ],
            ),
          ),
          child: ScaleTransition(
            scale: Tween(begin: 0.95, end: 1.0).animate(
              CurvedAnimation(
                parent: _controller,
                curve: const CurveWave(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CurveWave extends Curve {
  const CurveWave();

  @override
  double transform(double t) {
    if (t == 0 || t == 1) {
      return 0.01;
    }
    return sin(t * pi);
  }
}

class CirclePainter extends CustomPainter {
  CirclePainter(
    this._animation, {
    required this.color,
  }) : super(repaint: _animation);
  final Color color;
  final Animation<double> _animation;

  void circle(Canvas canvas, Rect rect, double value) {
    final double opacity = (1.0 - (value / 4.0)).clamp(0.0, 0.2);
    final Color _color = color.withOpacity(opacity);
    final double size = rect.width / 2;
    final double area = size * size;
    final double radius = sqrt(area * value / 4);
    final Paint paint = Paint()..color = _color;
    canvas.drawCircle(rect.center, radius, paint);
  }

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromLTRB(0.0, 0.0, size.width, size.height);
    for (int wave = 3; wave >= 0; wave--) {
      circle(canvas, rect, wave + _animation.value);
    }
  }

  @override
  bool shouldRepaint(CirclePainter oldDelegate) => true;
}
