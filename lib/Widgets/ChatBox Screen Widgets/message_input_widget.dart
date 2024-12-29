import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/Chat Box Controllers/chatbox_controller.dart';

class MessageInputWidget extends StatelessWidget {
  final ChatBoxController controller;

  MessageInputWidget({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(hintText: 'Type a message...'),
              onSubmitted: (value) => controller.sendMessage(value),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send, color: Colors.blue),
            onPressed: () => controller.sendMessage(controller.messageInput.value),
          ),
        ],
      ),
    );
  }
}
