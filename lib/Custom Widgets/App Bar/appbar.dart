import 'package:flutter/material.dart';
import 'package:frontendtask/controllers/Side%20Bar%20Controller/sidebar_controller.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final SidebarController sidebarcontroller = Get.put(SidebarController());

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    bool isRtl = Directionality.of(context) == TextDirection.rtl;

    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: Image.asset(
          'assets/images/menu.png',
          width: screenWidth * 0.06, // Responsive icon size
          height: screenWidth * 0.06,
          fit: BoxFit.contain,
        ),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      ),
      actions: [
        IconButton(
          icon: Image.asset(
            'assets/images/search.png',
            width: screenWidth * 0.06, // Responsive icon size
            height: screenWidth * 0.06,
            fit: BoxFit.contain,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: Image.asset(
            'assets/images/setting.png',
            width: screenWidth * 0.06, // Responsive icon size
            height: screenWidth * 0.06,
            fit: BoxFit.contain,
          ),
          onPressed: () {},
        ),
        IconButton(
          icon: Image.asset(
            'assets/images/notification.png',
            width: screenWidth * 0.06, // Responsive icon size
            height: screenWidth * 0.06,
            fit: BoxFit.contain,
          ),
          onPressed: () {},
        ),
        CircleAvatar(
          radius: screenWidth * 0.06, // Responsive avatar size
          backgroundImage: AssetImage('assets/images/avatar2.png'),
          backgroundColor: Colors.transparent,
        ),
        SizedBox(width: screenWidth * 0.02), // Responsive spacing
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
