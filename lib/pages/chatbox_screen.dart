import 'package:flutter/material.dart';
import 'package:frontendtask/appbar.dart';
import 'package:frontendtask/controllers/sidebar_controller.dart';
import 'package:get/get.dart';
import '../controllers/chatbox_controller.dart';

class ChatBoxScreen extends StatelessWidget {
  final ChatBoxController controller = Get.put(ChatBoxController());
  final SidebarController sidebarcontroller = Get.put(SidebarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: CustomAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTeamInfo(),
          Divider(color: Colors.grey.shade300, height: 1),
          Expanded(
            child: Obx(() => ListView.builder(
              reverse: true,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              itemCount: controller.messages.length,
              itemBuilder: (context, index) {
                final message = controller.messages.reversed.toList()[index] as Map<String, dynamic>;
                switch (message['type']) {
                  case 'text':
                    return _buildChatBubble(
                      sender: message['sender'],
                      time: message['time'],
                      message: message['message'],
                      avatar: message['avatar'],
                      isMe: message['isMe'],
                    );
                  case 'file':
                    return _buildFileBubble(
                      sender: message['sender'],
                      time: message['time'],
                      fileInfo: message['message'],
                      avatar: message['avatar'],
                      isMe: message['isMe'],
                    );
                  default:
                    return SizedBox.shrink();
                }
              },
            )),
          ),
          _buildMessageInput(),
        ],
      ),
    );
  }

  Widget _buildTeamInfo() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(12),
      child: Row(
        children: [
          Icon(Icons.arrow_back, color: Colors.black),
          SizedBox(width: 10),
          CircleAvatar(backgroundColor: Colors.orange, child: Text('DT')),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Design Team', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              Text('6 Members, 3 Online', style: TextStyle(fontSize: 12, color: Colors.grey)),
            ],
          ),
          Spacer(),
          Icon(Icons.more_vert, color: Colors.black),
        ],
      ),
    );
  }

  Widget _buildChatBubble({
    required String sender,
    required String time,
    required String message,
    required bool isMe,
    bool isFile = false,
    required String avatar,
  }) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isMe) // Show avatar for incoming messages on the left
            CircleAvatar(
              backgroundImage: avatar.startsWith('http')
                  ? NetworkImage(avatar) // Load from URL
                  : AssetImage(avatar) as ImageProvider, // Load from assets
              radius: 20,
            ),

          if (!isMe) SizedBox(width: 8), // Space between avatar and message bubble

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
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    blurRadius: 4,
                    spreadRadius: 1,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment:
                isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
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
                  if (isFile)
                    Column(
                      crossAxisAlignment:
                      isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.insert_drive_file, color: Colors.grey.shade700),
                        Text(
                          message,
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    )
                  else
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

          if (isMe) SizedBox(width: 8), // Space between message bubble and avatar

          if (isMe) // Show avatar for outgoing messages on the right
            CircleAvatar(
              backgroundImage: avatar.startsWith('http')
                  ? NetworkImage(avatar) // Load from URL
                  : AssetImage(avatar) as ImageProvider, // Load from assets
              radius: 20,
            ),
        ],
      ),
    );
  }



  Widget _buildFileBubble({
    required String sender,
    required String time,
    required String fileInfo,
    required String avatar,
    required bool isMe,
  }) {
    return _buildChatBubble(
      sender: sender,
      time: time,
      message: '📄 $fileInfo',
      avatar: avatar,
      isMe: isMe,
    );
  }

  Widget _buildMessageInput() {
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
