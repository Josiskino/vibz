import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class VoiceButton extends StatefulWidget {
  final bool showSendButton;
  final bool isRecording;
  final VoidCallback? onTap;
  final Function(LongPressStartDetails)? onLongPressStart;
  final Function(LongPressEndDetails)? onLongPressEnd;
  final Animation<double> micToSendAnimation;
  final Animation<double> voiceButtonAnimation;

  const VoiceButton({
    super.key,
    required this.showSendButton,
    required this.isRecording,
    required this.micToSendAnimation,
    required this.voiceButtonAnimation,
    this.onTap,
    this.onLongPressStart,
    this.onLongPressEnd,
  });

  @override
  State<VoiceButton> createState() => _VoiceButtonState();
}

class _VoiceButtonState extends State<VoiceButton> {
  void _startRecording() {
    HapticFeedback.heavyImpact(); // Strong vibration
    Future.delayed(const Duration(milliseconds: 50), () {
      HapticFeedback.heavyImpact(); // Double vibration pour renforcer le feedback
    });
  }

  void _stopRecording() {
    HapticFeedback.heavyImpact(); // Plus forte vibration lors du relâchement
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPressStart: (details) {
        _startRecording();
        if (widget.onLongPressStart != null) {
          widget.onLongPressStart!(details);
        }
      },
      onLongPressEnd: (details) {
        _stopRecording();
        if (widget.onLongPressEnd != null) {
          widget.onLongPressEnd!(details);
        }
      },
      onTap: widget.onTap,
      child: AnimatedBuilder(
        animation: Listenable.merge([
          widget.micToSendAnimation,
          widget.voiceButtonAnimation
        ]),
        builder: (context, child) {
          // Calculate size based on both animations
          final baseSize = 40.0;
          // Augmente la taille du cercle lors de l'enregistrement
          final expandedSize = baseSize +
              (widget.voiceButtonAnimation.value * 20.0);

          return Container(
            width: expandedSize,
            height: expandedSize,
            decoration: BoxDecoration(
              color: widget.isRecording
                  ? CupertinoColors.systemRed
                  : (widget.showSendButton
                      ? CupertinoColors.systemBlue
                      : CupertinoColors.systemBlue),
              shape: BoxShape.circle,
              boxShadow: widget.isRecording
                  ? [
                      BoxShadow(
                        color: CupertinoColors.systemRed.withOpacity(0.4),
                        blurRadius: 10, // Plus de flou
                        spreadRadius: 3, // Plus d'étendue
                      )
                    ]
                  : null,
            ),
            child: Center(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                transitionBuilder: (child, animation) {
                  return ScaleTransition(
                    scale: animation,
                    child: child,
                  );
                },
                child: widget.showSendButton
                    ? const Icon(
                        CupertinoIcons.arrow_up,
                        key: ValueKey('send'),
                        color: CupertinoColors.white,
                        size: 20,
                      )
                    : Icon(
                        widget.isRecording
                            ? CupertinoIcons.stop_fill
                            : CupertinoIcons.mic,
                        key: const ValueKey('mic'),
                        color: CupertinoColors.white,
                        size: widget.isRecording
                            ? 24
                            : 20, // Augmentation de la taille lors de l'enregistrement
                      ),
              ),
            ),
          );
        },
      ),
    );
  }
}