import 'package:flutter/cupertino.dart';

import '../entity/chat_mesage.dart';

class MessageBubble extends StatelessWidget {
  final ChatMessage message;
  final bool isZoomedOut;

  const MessageBubble({
    super.key,
    required this.message,
    required this.isZoomedOut,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: isZoomedOut ? 2 : 4,
        bottom: isZoomedOut ? 2 : 4,
        left: message.isMe ? (isZoomedOut ? 40 : 80) : 0,
        right: message.isMe ? 0 : (isZoomedOut ? 40 : 80),
      ),
      alignment: message.isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: isZoomedOut ? 8 : 12,
          vertical: isZoomedOut ? 4 : 8,
        ),
        decoration: BoxDecoration(
          color:
              message.isMe ? CupertinoColors.systemBlue : CupertinoColors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            if (!isZoomedOut)
              BoxShadow(
                color: CupertinoColors.systemGrey.withOpacity(0.1),
                blurRadius: 2,
                offset: const Offset(0, 1),
              ),
          ],
        ),
        child: Text(
          message.text,
          style: TextStyle(
            color: message.isMe ? CupertinoColors.white : CupertinoColors.black,
            fontSize: isZoomedOut ? 10 : 16,
          ),
        ),
      ),
    );
  }
}
