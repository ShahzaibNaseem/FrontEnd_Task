import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/sidebar_controller.dart';

class Sidebar extends StatelessWidget {
  final SidebarController controller = Get.put(SidebarController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => AnimatedContainer(
      duration: Duration(milliseconds: 300),
      width: controller.isSidebarOpen.value ? 250 : 70,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          right: BorderSide(color: Colors.grey.shade300),
        ),
      ),
      child: Drawer(
      child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Logo Section
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(top: 32.0, left: 16.0, right: 16.0, bottom: 16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/Logo.png', // Replace with your logo asset
                    width: 79,
                    height: 29,
                    fit: BoxFit.contain,
                  ),
                  Text(
                    'alpha',
                    style: TextStyle(
                      fontFamily: 'Comfortaa', // Ensure the Comfortaa font is added in pubspec.yaml
                      fontWeight: FontWeight.w700, // Bold weight
                      fontSize: 26, // Font size
                      letterSpacing: 1.2, // Adjust letter spacing for similar design
                      color: Color(0xFF28263B), // Hex color from the design
                      height: 1.1, // Line height for proper alignment
                      decoration: TextDecoration.none, // No underline
                    ),
                  ),

                ],
              ),
            ),

            // Menu Items
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


            // Calendars Section
            if (controller.isSidebarOpen.value)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'CALENDARS',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade700,
                  ),
                ),
              ),
            _buildMenuItem(Icons.circle, 'Important', iconColor: Colors.red),
            _buildMenuItem(Icons.circle, 'Meeting', iconColor: Colors.orange),
            _buildMenuItem(Icons.circle, 'Event', iconColor: Colors.green),
            _buildMenuItem(Icons.circle, 'Work', iconColor: Colors.blue),

            Spacer(),

          ],
        ),
      )

    ));
  }

  Widget _buildMenuItem(IconData icon, String title,
      {int? badge, Color iconColor = Colors.black}) {
    return Obx(() {
      bool isSelected = controller.selectedMenu.value == title;

      return InkWell(
        onTap: () => controller.selectMenu(title),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? Colors.blue.shade50 : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Icon(icon, color: iconColor, size: 15),
              if (controller.isSidebarOpen.value)
                SizedBox(width: 10),
              if (controller.isSidebarOpen.value)
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      color: isSelected
                          ? Colors.blue
                          : Colors.grey.shade700,
                      fontWeight:
                      isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ),
              if (badge != null && controller.isSidebarOpen.value)
                Container(
                  margin: EdgeInsets.only(left: 8),
                  padding:
                  EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    badge.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
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
