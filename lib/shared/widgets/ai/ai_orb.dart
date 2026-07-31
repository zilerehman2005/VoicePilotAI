import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_durations.dart';
import '../../../core/theme/app_shadows.dart';

enum AiOrbState { idle, listening, thinking, speaking }

/// Glowing AI orb with state-based animation.
class AiOrb extends StatefulWidget {
  const AiOrb({
    super.key,
    this.state = AiOrbState.idle,
    this.size = 180,
  });

  final AiOrbState state;
  final double size;

  @override
  State<AiOrb> createState() => _AiOrbState();
}

class _AiOrbState extends State<AiOrb> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: AppDurations.orbPulse,
  )..repeat(reverse: true);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        final double t = _controller.value;

        return SizedBox(
          width: widget.size,
          height: widget.size,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: widget.size,
                height: widget.size,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const RadialGradient(
                    colors: [
                      AppColors.gradientEnd,
                      AppColors.gradientStart,
                      Colors.transparent,
                    ],
                    stops: [0.0, 0.45, 1.0],
                  ),
                  boxShadow: AppShadows.glow,
                ),
              ),
              _buildInner(t),
            ],
          ),
        );
      },
    );
  }

  Widget _buildInner(double t) {
    switch (widget.state) {
      case AiOrbState.idle:
        return Container(
          width: widget.size * (0.45 + (t * 0.04)),
          height: widget.size * (0.45 + (t * 0.04)),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.surface,
          ),
          child: const Icon(Icons.graphic_eq_rounded, color: AppColors.textPrimary),
        );
      case AiOrbState.listening:
        return CustomPaint(
          size: Size.square(widget.size * 0.72),
          painter: _ListeningOrbPainter(t),
        );
      case AiOrbState.thinking:
        return CustomPaint(
          size: Size.square(widget.size * 0.72),
          painter: _ThinkingOrbPainter(t),
        );
      case AiOrbState.speaking:
        return CustomPaint(
          size: Size.square(widget.size * 0.72),
          painter: _SpeakingOrbPainter(t),
        );
    }
  }
}

class _ListeningOrbPainter extends CustomPainter {
  _ListeningOrbPainter(this.t);

  final double t;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = AppColors.primaryLight.withOpacity(0.85)
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 6;

    final double centerX = size.width / 2;
    final double baseY = size.height / 2;
    final List<double> heights = [0.3, 0.55, 0.85, 0.5, 0.7, 0.35];

    for (int i = 0; i < heights.length; i++) {
      final double x = centerX - 45 + (i * 18);
      final double wave = 0.8 + (0.2 * (i % 2 == 0 ? t : 1 - t));
      final double h = size.height * 0.18 * heights[i] * wave;
      canvas.drawLine(Offset(x, baseY - h), Offset(x, baseY + h), paint);
    }
  }

  @override
  bool shouldRepaint(covariant _ListeningOrbPainter oldDelegate) => oldDelegate.t != t;
}

class _ThinkingOrbPainter extends CustomPainter {
  _ThinkingOrbPainter(this.t);

  final double t;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint orbitPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..color = AppColors.primaryLight.withOpacity(0.6);

    final Paint dotPaint = Paint()..color = AppColors.textPrimary;
    final Offset center = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(center, size.shortestSide * 0.22, orbitPaint);

    for (int i = 0; i < 3; i++) {
      final double angle = (t * 2 * 3.14159) + (i * 2.094);
      final Offset dot = Offset(
        center.dx + (size.shortestSide * 0.22 * 0.95 * 1.2) * math.cos(angle),
        center.dy + (size.shortestSide * 0.22 * 0.95 * 1.2) * math.sin(angle),
      );
      canvas.drawCircle(dot, 4.5, dotPaint);
    }
  }

  @override
  bool shouldRepaint(covariant _ThinkingOrbPainter oldDelegate) => oldDelegate.t != t;
}

class _SpeakingOrbPainter extends CustomPainter {
  _SpeakingOrbPainter(this.t);

  final double t;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = AppColors.primary.withOpacity(0.9)
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 7;

    final double centerY = size.height / 2;
    final List<double> levels = [0.35, 0.65, 0.95, 0.7, 0.5];

    for (int i = 0; i < levels.length; i++) {
      final double x = (size.width / (levels.length + 1)) * (i + 1);
      final double amp = levels[i] * (0.7 + (0.3 * (i.isEven ? t : 1 - t)));
      canvas.drawLine(
        Offset(x, centerY - (size.height * 0.18 * amp)),
        Offset(x, centerY + (size.height * 0.18 * amp)),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _SpeakingOrbPainter oldDelegate) => oldDelegate.t != t;
}
