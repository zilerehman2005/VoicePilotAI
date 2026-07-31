import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_durations.dart';

/// Animated horizontal voice waveform bars.
class VoiceWaveform extends StatefulWidget {
  const VoiceWaveform({
    super.key,
    this.barCount = 7,
    this.amplitudes,
    this.height = 32,
  });

  final int barCount;
  final List<double>? amplitudes;
  final double height;

  @override
  State<VoiceWaveform> createState() => _VoiceWaveformState();
}

class _VoiceWaveformState extends State<VoiceWaveform> with SingleTickerProviderStateMixin {
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
        final List<double> levels = widget.amplitudes ??
            List<double>.generate(
              widget.barCount,
              (index) => 0.35 + (0.65 * (((index % 2 == 0) ? t : 1 - t))),
            );

        return SizedBox(
          height: widget.height,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(levels.length, (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: Container(
                  width: 4,
                  height: widget.height * levels[index],
                  decoration: BoxDecoration(
                    color: AppColors.primaryLight,
                    borderRadius: BorderRadius.circular(999),
                  ),
                ),
              );
            }),
          ),
        );
      },
    );
  }
}
