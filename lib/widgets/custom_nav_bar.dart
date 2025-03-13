import 'package:flutter/cupertino.dart';

class CustomNavBar extends StatelessWidget implements ObstructingPreferredSizeWidget {
  final VoidCallback? onBackPressed;
  final VoidCallback? onVideoPressed;

  const CustomNavBar({
    super.key,
    this.onBackPressed,
    this.onVideoPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoNavigationBar(
      backgroundColor: CupertinoColors.white,
      border: const Border(
        bottom: BorderSide(
          color: CupertinoColors.systemGrey5,
          width: 0.5,
        ),
      ),
      middle: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: const BoxDecoration(
              color: CupertinoColors.systemOrange,
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Text(
                "🐶",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          const SizedBox(width: 8),
          const Text(
            "Chat App",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
      leading: GestureDetector(
        onTap: onBackPressed,
        child: const Icon(
          CupertinoIcons.back,
          color: CupertinoColors.systemGrey,
          size: 22,
        ),
      ),
      trailing: GestureDetector(
        onTap: onVideoPressed,
        child: const Icon(
          CupertinoIcons.video_camera,
          color: CupertinoColors.systemBlue,
          size: 24,
        ),
      ),
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(44.0);
  
  @override
  bool shouldFullyObstruct(BuildContext context) => true;
}