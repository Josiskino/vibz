import 'package:flutter/cupertino.dart';

class ZoomInstructionOverlay extends StatelessWidget {
  final bool isZoomedOut;

  const ZoomInstructionOverlay({super.key, required this.isZoomedOut});

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 300),
      top: 16,
      right: 16,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: 0.8,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 6,
          ),
          decoration: BoxDecoration(
            color: CupertinoColors.systemGrey6,
            borderRadius: BorderRadius.circular(16),
          ),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: Text(
              isZoomedOut ? "Pinch to zoom in" : "Pinch to zoom out",
              key: ValueKey<bool>(isZoomedOut),
              style: const TextStyle(
                fontSize: 12,
                color: CupertinoColors.systemGrey,
              ),
            ),
          ),
        ),
      ),
    );
  }
}