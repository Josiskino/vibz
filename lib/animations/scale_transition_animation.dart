import 'package:flutter/material.dart';

class ScaleTransitionAnimation {
  /// Create a scale animation controller
  static AnimationController createController(TickerProvider vsync) {
    return AnimationController(
      vsync: vsync,
      duration: const Duration(milliseconds: 200),
    );
  }

  /// Create a scale animation
  static Animation<double> createAnimation(AnimationController controller) {
    return Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  /// Apply scale animation to a widget
  static Widget apply({
    required Widget child,
    required Animation<double> animation,
  }) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Transform.scale(
          scale: animation.value,
          child: child,
        );
      },
      child: child,
    );
  }
}