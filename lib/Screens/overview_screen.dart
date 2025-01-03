import 'package:flutter/material.dart';
import 'package:frontendtask/Widgets/Overview%20screen%20Widgets/activitycard_widget.dart';
import 'package:frontendtask/Widgets/Overview%20screen%20Widgets/follower_Card.dart';
import 'package:frontendtask/Widgets/Overview%20screen%20Widgets/gendercard_widget.dart';
import 'package:frontendtask/Widgets/Overview%20screen%20Widgets/overviewHeader.dart';
import 'package:frontendtask/Widgets/Overview%20screen%20Widgets/statistics_page.dart';
import 'package:frontendtask/Custom%20Widgets/App%20Bar/appbar.dart';
import 'package:frontendtask/controllers/OverView%20Controllers/acitivitycard_controller.dart';
import 'package:frontendtask/controllers/OverView%20Controllers/overview_controller.dart';
import 'package:frontendtask/Custom%20Widgets/SideBar/sidebar.dart';
import 'package:get/get.dart';

class OverviewScreen extends StatelessWidget {
  final OverviewController controller = Get.put(OverviewController());
  final ActivityController controller2 = Get.put(ActivityController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            OverviewHeader(),
            FollowersCard(),
            GenderCard(),
            ActivityCard(
              title: controller2.title.value,
              value: controller2.value.value,
              increasePercentage: controller2.increasePercentage.value,
            ),
            StatisticsPage()
          ],
        ),
      ),
      drawer: Sidebar(),

    );
  }
}
