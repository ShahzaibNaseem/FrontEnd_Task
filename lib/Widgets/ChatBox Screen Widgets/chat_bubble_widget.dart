import 'package:flutter/material.dart';

class ChatBubbleWidget extends StatelessWidget {
  final String sender;
  final String time;
  final String message;
  final bool isMe;
  final String avatar;
  final bool isFile;

  ChatBubbleWidget({
    required this.sender,
    required this.time,
    required this.message,
    required this.isMe,
    required this.avatar,
    this.isFile = false,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isMe)
            CircleAvatar(
              backgroundImage: avatar.startsWith('http')
                  ? NetworkImage(avatar)
                  : AssetImage(avatar) as ImageProvider,
              radius: 20,
            ),
          if (!isMe) SizedBox(width: 8),
          Flexible(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 4),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isMe ? Colors.blue.shade500 : Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                  bottomLeft: isMe ? Radius.circular(12) : Radius.zero,
                  bottomRight: isMe ? Radius.zero : Radius.circular(12),
                ),
              ),
              child: Column(
                crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: [
                  if (!isMe)
                    Text(
                      sender,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  SizedBox(height: 4),
                  Text(
                    message,
                    style: TextStyle(
                      fontSize: 14,
                      color: isMe ? Colors.white : Colors.black87,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    time,
                    style: TextStyle(
                      fontSize: 10,
                      color: isMe ? Colors.white70 : Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (isMe) SizedBox(width: 8),
          if (isMe)
            CircleAvatar(
              backgroundImage: avatar.startsWith('http')
                  ? NetworkImage(avatar)
                  : AssetImage(avatar) as ImageProvider,
              radius: 20,
            ),
        ],
      ),
    );
  }
}
