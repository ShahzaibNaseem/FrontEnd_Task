import 'package:flutter/material.dart';
import 'package:frontendtask/controllers/sidebar_controller.dart';
import 'package:frontendtask/pages/calendar_page.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(SidebarController()); // Global initialization of SidebarController
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalendarPage(),
    );
  }
}