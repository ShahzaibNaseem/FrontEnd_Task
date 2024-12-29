import 'package:flutter/material.dart';
import 'package:frontendtask/Custom%20Widgets/App%20Bar/appbar.dart';
import 'package:frontendtask/Custom%20Widgets/SideBar/sidebar.dart';
import 'package:get/get.dart';
import '../Widgets/Chat Screen Widgets/chat_message_list.dart';
import '../Widgets/Chat Screen Widgets/chat_search_bar.dart';
import '../Widgets/Chat Screen Widgets/chat_section_title.dart';
import '../controllers/Chat Controller/chat_controller.dart';

class ChatScreen extends StatelessWidget {
  final ChatController controller = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: CustomAppBar(),
      drawer: Sidebar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.05,
            vertical: screenHeight * 0.02,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.02),

              // 📱 Search Bar
              SizedBox(
                height: screenHeight * 0.06,
                child: ChatSearchBar(
                  onSearch: controller.updateSearchQuery,
                ),
              ),

              SizedBox(height: screenHeight * 0.02),

              // 📌 Section Title: Pinned
              ChatSectionTitle(
                title: 'PINNED',
              ),

              SizedBox(height: screenHeight * 0.01),

              // 📩 Pinned Messages
              SizedBox(
                height: screenHeight * 0.3,
                child: Obx(() => ChatMessageList(
                  messages: controller.pinnedMessages.value,
                )),
              ),

              SizedBox(height: screenHeight * 0.03),

              // 📌 Section Title: All Messages
              ChatSectionTitle(
                title: 'ALL MESSAGES',
              ),

              SizedBox(height: screenHeight * 0.01),

              // 📩 All Messages
              SizedBox(
                height: screenHeight * 0.5,
                child: Obx(() => ChatMessageList(
                  messages: controller.allMessages.value,
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
