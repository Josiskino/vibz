import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';

class TimelineWaveAnimation {
  /// Animates the timeline with a wave effect
  static void animate({
    required double targetIndex,
    required double currentPosition,
    required Function(double) onPositionChanged,
    required bool mounted,
  }) {
    final steps = 10;
    final duration = const Duration(milliseconds: 500);
    final stepDuration = Duration(milliseconds: duration.inMilliseconds ~/ steps);

    for (int i = 0; i < steps; i++) {
      final t = i / (steps - 1);
      final easedT = Curves.easeOutCubic.transform(t);
      final interpolatedIndex = currentPosition + (targetIndex - currentPosition) * easedT;

      Future.delayed(stepDuration * i, () {
        if (mounted) {
          onPositionChanged(interpolatedIndex);
        }
      });
    }
  }
}