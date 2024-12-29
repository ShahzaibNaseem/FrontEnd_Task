import 'package:flutter/material.dart';
import 'package:frontendtask/Screens/chatbox_screen.dart';
import 'package:get/get.dart';

class ChatMessageList extends StatelessWidget {
  final List<Map<String, dynamic>> messages;

  ChatMessageList({required this.messages});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: messages.map((message) {
        return GestureDetector(
          onTap: () {
            Get.to(() => ChatBoxScreen(
              title: message['title'] ?? 'No Title',
            ));
          },
          child: _buildChatItem(
            context: context,
            title: message['title'],
            subtitle: message['subtitle'],
            avatarColor: Color(message['avatarColor']),
            initials: message['initials'],
            showBadge: message['badge'] ?? false,
          ),
        );
      }).toList(),
    );
  }

  Widget _buildChatItem({
    required BuildContext context,
    required String title,
    required String subtitle,
    required Color avatarColor,
    required String initials,
    bool showBadge = false,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.04, // Dynamic horizontal margin
        vertical: screenHeight * 0.01, // Dynamic vertical margin
      ),
      padding: EdgeInsets.all(screenWidth * 0.04), // Dynamic padding
      width: double.infinity,
      height: screenHeight * 0.12, // Dynamic height
      decoration: BoxDecoration(
        color: Color(0xFFF5F7FA),
        borderRadius: BorderRadius.circular(screenWidth * 0.035),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 5,
            spreadRadius: 1,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: avatarColor,
            radius: screenWidth * 0.07, // Dynamic avatar size
            child: Text(
              initials,
              style: TextStyle(
                color: Colors.white,
                fontSize: screenWidth * 0.045, // Dynamic font size
              ),
            ),
          ),
          SizedBox(width: screenWidth * 0.03), // Dynamic spacing

          // **Title and Subtitle**
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: screenWidth * 0.04,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: screenHeight * 0.005),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: screenWidth * 0.035,
                    color: Colors.grey.shade600,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ],
            ),
          ),

          // **Badge (if shown)**
          if (showBadge)
            Container(
              margin: EdgeInsets.only(left: screenWidth * 0.02),
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.02,
                vertical: screenHeight * 0.005,
              ),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(screenWidth * 0.03),
              ),
              child: Text(
                '3',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenWidth * 0.03,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
