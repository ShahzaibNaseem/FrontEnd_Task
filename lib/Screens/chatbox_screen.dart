import 'package:flutter/material.dart';
import 'package:frontendtask/Custom%20Widgets/App%20Bar/appbar.dart';
import 'package:get/get.dart';

import '../Widgets/ChatBox Screen Widgets/chat_bubble_widget.dart';
import '../Widgets/ChatBox Screen Widgets/message_input_widget.dart';
import '../Widgets/ChatBox Screen Widgets/team_info_widget.dart';
import '../controllers/Chat Box Controllers/chatbox_controller.dart';

class ChatBoxScreen extends StatelessWidget {
  final ChatBoxController controller = Get.put(ChatBoxController());
  final String title;

  ChatBoxScreen({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(),
      body: Column(
        children: [
          TeamInfoWidget(title: title),
          Expanded(
            child: Obx(() => ListView.builder(
              reverse: true,
              itemCount: controller.messages.length,
              itemBuilder: (context, index) {
                final message = controller.messages.reversed.toList()[index];
                return ChatBubbleWidget(
                  sender: message['sender'] as String? ?? 'Unknown Sender',
                  time: message['time'] as String? ?? 'Unknown Time',
                  message: message['message'] as String? ?? '',
                  avatar: message['avatar'] as String? ?? 'assets/default_avatar.png',
                  isMe: message['isMe'] as bool? ?? false,
                );
              },
            )),
          ),
          MessageInputWidget(controller: controller),
        ],
      ),
    );
  }
}
