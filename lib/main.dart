import 'package:flutter/material.dart';
import 'package:frontendtask/Screens/calendar_page.dart';
import 'package:frontendtask/controllers/Calender%20Controllers/calendar_controller.dart';
import 'package:frontendtask/controllers/Side%20Bar%20Controller/sidebar_controller.dart';
import 'package:frontendtask/controllers/OverView%20Controllers/statistics_controller.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(SidebarController());
  Get.put(StatisticsController());
  Get.lazyPut(() => CalendarController());

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