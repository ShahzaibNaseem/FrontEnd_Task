import 'package:flutter/material.dart';
import 'package:frontendtask/controllers/sidebar_controller.dart';
import 'package:frontendtask/pages/sidebar.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final SidebarController sidebarcontroller = Get.put(SidebarController());


  @override
  Widget build(BuildContext context) {
    bool isRtl = Directionality.of(context) == TextDirection.rtl;

    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      actions: [
        IconButton(
          icon: Image.asset(
            'assets/images/search.png', // Replace with your local image asset path
            width: 24,
            height: 24,
            fit: BoxFit.contain,
          ),
          onPressed: () {
          },
        ),
        IconButton(
          icon: Image.asset(
            'assets/images/setting.png', // Replace with your local image asset path
            width: 24,
            height: 24,
            fit: BoxFit.contain,
          ),
          onPressed: () {
            // Notification action
          },
        ),
        IconButton(
          icon: Image.asset(
            'assets/images/notification.png', // Replace with your local image asset path
            width: 24,
            height: 24,
            fit: BoxFit.contain,
          ),
          onPressed: () {
            // Notification action
          },
        ),
        CircleAvatar(
          radius: 20, // Adjust the size if needed
          backgroundImage: AssetImage('assets/images/avatar2.png'), // Replace with your local image
          backgroundColor: Colors.transparent, // Optional: To prevent color overlay
        ),
        SizedBox(width: 10),
      ],

      leading: IconButton(
        icon: Image.asset(
          'assets/images/menu.png', // Replace with your local image asset path
          width: 24, // Adjust width if needed
          height: 24, // Adjust height if needed
          fit: BoxFit.contain,
        ),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      ),
    );
  }


  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}