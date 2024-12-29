import 'package:flutter/material.dart';
import 'package:frontendtask/Widgets/Overview%20screen%20Widgets/OverviewSlider.dart';
import 'package:frontendtask/controllers/OverView%20Controllers/overview_controller.dart';
import 'package:get/get.dart';

class OverviewHeader extends StatelessWidget {
  final OverviewController controller = Get.put(OverviewController());

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.04,
        vertical: screenHeight * 0.02,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title and Settings Icon
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Overview',
                style: TextStyle(
                  fontSize: screenWidth * 0.06,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(screenWidth * 0.02),
                child: Image.asset(
                  'assets/images/overview.png',
                  width: screenWidth * 0.12,
                  height: screenWidth * 0.12,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.02),

          // Dropdown and Download Icon
          Row(
            children: [
              Container(
                width: screenWidth * 0.1,
                height: screenWidth * 0.1,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(screenWidth * 0.02),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      blurRadius: 5,
                      spreadRadius: 1,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Icon(Icons.download, color: Colors.black54),
              ),
              SizedBox(width: screenWidth * 0.03),
              Expanded(
                child: Container(
                  height: screenHeight * 0.06,
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(screenWidth * 0.02),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        blurRadius: 5,
                        spreadRadius: 1,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Obx(() => DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: controller.selectedTimeRange.value,
                      isExpanded: true,
                      dropdownColor: Colors.white,
                      borderRadius: BorderRadius.circular(screenWidth * 0.02),
                      icon: Icon(Icons.arrow_drop_down, color: Colors.grey),
                      items: ['This Week', 'This Month', 'This Year']
                          .map((String range) {
                        return DropdownMenuItem<String>(
                          value: range,
                          child: Text(
                            range,
                            style: TextStyle(
                              fontSize: screenWidth * 0.035,
                              color: Colors.black87,
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        controller.selectedTimeRange.value = value!;
                      },
                    ),
                  )),
                ),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.02),

          // Overview Slider
          OverviewSlider(),
        ],
      ),
    );
  }
}
