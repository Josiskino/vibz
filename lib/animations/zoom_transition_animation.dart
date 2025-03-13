import 'package:flutter/material.dart';

class ZoomTransitionAnimation {
  /// Create a zoom animation controller
  static AnimationController createController(TickerProvider vsync) {
    return AnimationController(
      vsync: vsync,
      duration: const Duration(milliseconds: 300),
    );
  }

  /// Apply zoom out animation to a widget
  static Widget applyZoomOut({
    required Widget child,
    required Animation<double> animation,
    double scaleEffect = 0.05,
    double opacityEffect = 0.2,
  }) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Transform.scale(
          scale: 1.0 - (animation.value * scaleEffect),
          child: Opacity(
            opacity: 1.0 - (animation.value * opacityEffect),
            child: child,
          ),
        );
      },
      child: child,
    );
  }

  /// Apply fade in animation for components that appear during zoom out
  static Widget applyFadeIn({
    required Widget child,
    required Animation<double> animation,
  }) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Opacity(
          opacity: animation.value,
          child: child,
        );
      },
      child: child,
    );
  }

  /// Toggle zoom state with animations
  static void toggleZoom({
    required bool isZoomedOut,
    required AnimationController animationController,
    required AnimationController zoomTransitionController,
    required Function(bool) onZoomStateChanged,
  }) {
    final newZoomState = !isZoomedOut;
    onZoomStateChanged(newZoomState);
    
    if (newZoomState) {
      animationController.forward();
      zoomTransitionController.forward();
    } else {
      animationController.reverse();
      zoomTransitionController.reverse();
    }
  }
}