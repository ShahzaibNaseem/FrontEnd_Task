import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Screens/calendar_page.dart';
import '../../Screens/chat_screen.dart';
import '../../Screens/overview_screen.dart';
import '../../controllers/Side Bar Controller/sidebar_controller.dart';

class Sidebar extends StatelessWidget {
  final SidebarController controller = Get.put(SidebarController());

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Obx(
          () => AnimatedContainer(
        duration: Duration(milliseconds: 300),
        width: controller.isSidebarOpen.value
            ? screenWidth * 0.65
            : screenWidth * 0.2,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            right: BorderSide(color: Colors.grey.shade300),
          ),
        ),
        child: Drawer(
          child: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.04,
                  vertical: screenHeight * 0.02,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 📌 **Logo Section**
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/Logo.png',
                          width: screenWidth * 0.15,
                          height: screenHeight * 0.05,
                          fit: BoxFit.contain,
                        ),
                        if (controller.isSidebarOpen.value)
                          SizedBox(width: screenWidth * 0.02),
                        if (controller.isSidebarOpen.value)
                          Text(
                            'alpha',
                            style: TextStyle(
                              fontFamily: 'Comfortaa',
                              fontWeight: FontWeight.w700,
                              fontSize: screenWidth * 0.05,
                              letterSpacing: 1.2,
                              color: Color(0xFF28263B),
                            ),
                          ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.03),

                    // 📌 **Menu Items**
                    _buildMenuItem(Icons.dashboard, 'Overview'),
                    _buildMenuItem(Icons.shopping_cart, 'E-Commerce'),
                    _buildMenuItem(Icons.calendar_today, 'Calendar'),
                    _buildMenuItem(Icons.email, 'Mail', badge: 8),
                    _buildMenuItem(Icons.chat, 'Chat'),
                    _buildMenuItem(Icons.check_box, 'Tasks'),
                    _buildMenuItem(Icons.folder, 'Projects'),
                    _buildMenuItem(Icons.insert_drive_file, 'File Manager'),
                    _buildMenuItem(Icons.note, 'Notes'),
                    _buildMenuItem(Icons.contacts, 'Contacts'),

                    SizedBox(height: screenHeight * 0.03),

                    // 📅 **Calendars Section**
                    if (controller.isSidebarOpen.value)
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.02,
                          vertical: screenHeight * 0.01,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'CALENDARS',
                              style: TextStyle(
                                fontSize: screenWidth * 0.04,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade700,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                // Add Calendar Event
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: screenWidth * 0.05,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                    // 📊 **Calendar Types**
                    _buildMenuItem(Icons.circle, 'Important', iconColor: Colors.red),
                    _buildMenuItem(Icons.circle, 'Meeting', iconColor: Colors.orange),
                    _buildMenuItem(Icons.circle, 'Event', iconColor: Colors.green),
                    _buildMenuItem(Icons.circle, 'Work', iconColor: Colors.blue),

                    SizedBox(height: screenHeight * 0.05),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// 📌 **Reusable Menu Item Widget**
  Widget _buildMenuItem(IconData icon, String title,
      {int? badge, Color iconColor = Colors.black}) {
    final screenWidth = MediaQuery.of(Get.context!).size.width;
    final screenHeight = MediaQuery.of(Get.context!).size.height;

    return Obx(() {
      bool isSelected = controller.selectedMenu.value == title;

      return InkWell(
        onTap: () {
          controller.selectMenu(title);

          switch (title) {
            case 'Overview':
              Navigator.push(
                Get.context!,
                MaterialPageRoute(builder: (context) => OverviewScreen()),
              );
              break;
            case 'Calendar':
              Navigator.push(
                Get.context!,
                MaterialPageRoute(builder: (context) => CalendarPage()),
              );
              break;
            case 'Chat':
              Navigator.push(
                Get.context!,
                MaterialPageRoute(builder: (context) => ChatScreen()),
              );
              break;
            default:
              print('No route defined for $title');
          }
        },
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.02,
            vertical: screenHeight * 0.005,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.03,
            vertical: screenHeight * 0.015,
          ),
          decoration: BoxDecoration(
            color: isSelected ? Colors.blue.shade50 : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Icon(icon, color: iconColor, size: screenWidth * 0.05),
              if (controller.isSidebarOpen.value) SizedBox(width: screenWidth * 0.02),
              if (controller.isSidebarOpen.value)
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      color: isSelected ? Colors.blue : Colors.grey.shade700,
                      fontWeight:
                      isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ),
              if (badge != null && controller.isSidebarOpen.value)
                Container(
                  margin: EdgeInsets.only(left: 8),
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    badge.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 0.025,
                    ),
                  ),
                ),
            ],
          ),
        ),
      );
    });
  }
}
