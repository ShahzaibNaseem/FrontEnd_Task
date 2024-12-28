import 'package:flutter/material.dart';
import 'package:frontendtask/appbar.dart';
import 'package:get/get.dart';
import '../controllers/chat_controller.dart';

class ChatScreen extends StatelessWidget {
  final ChatController controller = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            _buildSearchBar(),
            SizedBox(height: 10),
            _buildSectionTitle('PINNED'),
            Obx(() => _buildMessageList(controller.pinnedMessages)),
            SizedBox(height: 20),
            _buildSectionTitle('ALL MESSAGES'),
            Obx(() => _buildMessageList(controller.allMessages)),
          ],
        ),
      ),
    );
  }

  // Search Bar
  Widget _buildSearchBar() {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        onChanged: controller.updateSearchQuery,
        decoration: InputDecoration(
          hintText: 'Search...',
          hintStyle: TextStyle(color: Colors.grey),
          border: InputBorder.none,
          prefixIcon: Icon(Icons.search, color: Colors.grey),
        ),
      ),
    );
  }

  // Section Title
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.grey.shade700,
        ),
      ),
    );
  }

  // Message List
  Widget _buildMessageList(RxList<Map<String, dynamic>> messages) {
    return Column(
      children: messages.map((message) {
        return _buildChatItem(
          title: message['title'],
          subtitle: message['subtitle'],
          avatarColor: Color(message['avatarColor']),
          initials: message['initials'],
          showBadge: message['badge'] ?? false,
        );
      }).toList(),
    );
  }

  // Chat Item
  Widget _buildChatItem({
    required String title,
    required String subtitle,
    required Color avatarColor,
    required String initials,
    bool showBadge = false,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      padding: EdgeInsets.all(12),
      width: double.infinity,
      height: 96,
      decoration: BoxDecoration(
        color: Color(0xFFF5F7FA), // Background color from the image
        borderRadius: BorderRadius.circular(14), // Rounded corners
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
          // Avatar Section
          CircleAvatar(
            backgroundColor: avatarColor,
            radius: 24, // Slightly larger avatar
            child: Text(
              initials,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          SizedBox(width: 12),

          // Message Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ],
            ),
          ),

          // Badge (if applicable)
          if (showBadge)
            Container(
              margin: EdgeInsets.only(left: 8),
              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                '3',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ],
      ),
    );
  }

}
