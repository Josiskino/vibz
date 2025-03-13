import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../utils/date_formatter.dart';

class TimelineView extends StatelessWidget {
  final List<DateTime> dates;
  final double currentDateIndex;
  final Function(double) onDateChanged;
  final Function(double, double) onTimelineWaveAnimation;

  const TimelineView({
    super.key,
    required this.dates,
    required this.currentDateIndex,
    required this.onDateChanged,
    required this.onTimelineWaveAnimation,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: GestureDetector(
        onVerticalDragStart: (details) {
          // Save initial position and pass to parent
          // Here we'd store the position locally if this was a stateful widget
        },
        onVerticalDragUpdate: (details) {
          // Update date index based on drag position, inverted direction
          final sensitivity = 0.015;
          final newIndex = currentDateIndex - details.delta.dy * sensitivity;
          onDateChanged(newIndex.clamp(0, dates.length - 1.0));
        },
        onVerticalDragEnd: (details) {
          // Calculate velocity direction and animate to nearest date
          final velocitySensitivity = 0.002;
          final targetIndex = currentDateIndex -
              details.velocity.pixelsPerSecond.dy * velocitySensitivity;
          
          // Correction: Utilisez une conversion explicite en double
          final double roundedIndex = targetIndex.roundToDouble().clamp(0, dates.length - 1.0);

          // Animate to target index with wave effect
          onTimelineWaveAnimation(roundedIndex, currentDateIndex);
        },
        child: Container(
          color: Colors.transparent,
          child: Stack(
            children: [
              // Timeline
              Positioned(
                top: 0,
                bottom: 0,
                right: 45,
                child: Container(
                  width: 1,
                  color: CupertinoColors.systemGrey5,
                ),
              ),

              // Date indicators
              ...List.generate(dates.length, (index) {
                final date = dates[index];
                final isSelected = (index - currentDateIndex).abs() < 0.5;

                // Calculate position based on index and current date index
                // This creates a "follow finger" effect during dragging
                final basePosition = MediaQuery.of(context).size.height / 2;
                final indexOffset = (index - currentDateIndex) * 50.0;
                final position = basePosition + indexOffset;

                // Calculate highlight intensity based on proximity to current index
                final distance = (index - currentDateIndex).abs();
                final opacity = (1.0 - distance * 0.3).clamp(0.0, 1.0);

                return Positioned(
                  top: position - 10, // Center text vertically
                  right: 0,
                  left: 0,
                  child: Transform.scale(
                    scale: 1.0 + (isSelected ? 0.1 : 0.0),
                    child: Opacity(
                      opacity: opacity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          // Date text
                          Text(
                            DateFormatter.formatChatDate(date),
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight:
                                  isSelected ? FontWeight.bold : FontWeight.normal,
                              color: isSelected
                                  ? CupertinoColors.black
                                  : CupertinoColors.systemGrey,
                            ),
                          ),
                          const SizedBox(width: 8),

                          // Animated pointer to timeline
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            width: isSelected ? 25 : 20,
                            height: 1,
                            color: isSelected
                                ? CupertinoColors.black
                                : CupertinoColors.systemGrey5,
                          ),

                          // Animated timeline dot
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            width: isSelected ? 8 : 6,
                            height: isSelected ? 8 : 6,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: isSelected
                                  ? CupertinoColors.black
                                  : CupertinoColors.systemGrey5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),

              // Current date indicator (center line)
              Positioned(
                top: MediaQuery.of(context).size.height / 2,
                left: 0,
                right: 0,
                child: Container(
                  height: 1,
                  color: CupertinoColors.systemGrey4.withOpacity(0.5),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}