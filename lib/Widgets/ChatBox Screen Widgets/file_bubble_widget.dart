import 'package:flutter/material.dart';
import 'chat_bubble_widget.dart';

class FileBubbleWidget extends StatelessWidget {
  final String sender;
  final String time;
  final String fileInfo;
  final bool isMe;
  final String avatar;

  FileBubbleWidget({
    required this.sender,
    required this.time,
    required this.fileInfo,
    required this.isMe,
    required this.avatar,
  });

  @override
  Widget build(BuildContext context) {
    return ChatBubbleWidget(
      sender: sender,
      time: time,
      message: '📄 $fileInfo',
      isMe: isMe,
      avatar: avatar,
      isFile: true,
    );
  }
}
