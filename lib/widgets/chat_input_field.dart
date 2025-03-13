import 'package:flutter/cupertino.dart';
import 'voice_button.dart';

class ChatInputField extends StatelessWidget {
  final TextEditingController messageController;
  final FocusNode focusNode;
  final bool showSendButton;
  final bool isRecording;
  final Animation<double> cameraFadeAnimation;
  final Animation<double> micToSendAnimation;
  final Animation<double> voiceButtonAnimation;
  final VoidCallback onSendMessage;
  final Function(LongPressStartDetails)? onRecordingStart;
  final Function(LongPressEndDetails)? onRecordingEnd;

  const ChatInputField({
    super.key,
    required this.messageController,
    required this.focusNode,
    required this.showSendButton,
    required this.isRecording,
    required this.cameraFadeAnimation,
    required this.micToSendAnimation,
    required this.voiceButtonAnimation,
    required this.onSendMessage,
    this.onRecordingStart,
    this.onRecordingEnd,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 8.0,
      ),
      color: CupertinoColors.white,
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            // Message input field
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: CupertinoColors.systemGrey6,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    // Emoji button
                    CupertinoButton(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      onPressed: () {},
                      child: const Icon(
                        CupertinoIcons.smiley,
                        color: CupertinoColors.systemGrey,
                        size: 22,
                      ),
                    ),

                    // Text field
                    Expanded(
                      child: CupertinoTextField(
                        controller: messageController,
                        focusNode: focusNode,
                        placeholder: 'Message',
                        placeholderStyle: const TextStyle(
                          color: CupertinoColors.systemGrey,
                        ),
                        decoration: null,
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),

                    // Attachment button
                    CupertinoButton(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      onPressed: () {},
                      child: const Icon(
                        CupertinoIcons.paperclip,
                        color: CupertinoColors.systemGrey,
                        size: 22,
                      ),
                    ),

                    // Camera button with fade animation
                    AnimatedBuilder(
                      animation: cameraFadeAnimation,
                      builder: (context, child) {
                        return Opacity(
                          opacity: cameraFadeAnimation.value,
                          child: SizedBox(
                            width: cameraFadeAnimation.value * 40,
                            child: cameraFadeAnimation.value > 0.1
                                ? CupertinoButton(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    onPressed: () {},
                                    child: const Icon(
                                      CupertinoIcons.camera,
                                      color: CupertinoColors.systemGrey,
                                      size: 22,
                                    ),
                                  )
                                : null,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(width: 8),

            // Voice/Send button
            VoiceButton(
              showSendButton: showSendButton,
              isRecording: isRecording,
              micToSendAnimation: micToSendAnimation,
              voiceButtonAnimation: voiceButtonAnimation,
              onTap: showSendButton ? onSendMessage : null,
              onLongPressStart: onRecordingStart,
              onLongPressEnd: onRecordingEnd,
            ),
          ],
        ),
      ),
    );
  }
}