import 'package:flutter/material.dart';
import 'package:frontendtask/Custom%20Widgets/Gender%20Chart%20Painter/GenderChartPainter.dart';
import 'package:frontendtask/controllers/OverView%20Controllers/gendercard_controller.dart';
import 'package:get/get.dart';

class GenderCard extends StatelessWidget {
  final GenderCardController controller = Get.put(GenderCardController());

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.04,
        vertical: screenHeight * 0.02,
      ),
      padding: EdgeInsets.all(screenWidth * 0.04),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 5,
            spreadRadius: 1,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 📌 **Header Section**
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Gender',
                style: TextStyle(
                  fontSize: screenWidth * 0.05,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(Icons.more_horiz, color: Colors.grey),
            ],
          ),
          SizedBox(height: screenHeight * 0.02),

          // 🟡🟣 **Circular Chart**
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: screenHeight * 0.25,
                  width: screenHeight * 0.25,
                  child: CustomPaint(
                    painter: GenderChartPainter(
                      malePercentage: controller.malePercentage.value,
                      femalePercentage: controller.femalePercentage.value,
                    ),
                  ),
                ),

                // Emoji in Center
                CircleAvatar(
                  radius: screenWidth * 0.08,
                  backgroundColor: Colors.white,
                  child: Text(
                    '🙋‍♀️',
                    style: TextStyle(fontSize: screenWidth * 0.08),
                  ),
                ),

                // Percentage Labels
                Positioned(
                  left: screenWidth * 0.1,
                  top: screenHeight * 0.07,
                  child: CircleAvatar(
                    radius: screenWidth * 0.05,
                    backgroundColor: Colors.white,
                    child: Text(
                      '${controller.malePercentage.value}%',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth * 0.03,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: screenWidth * 0.1,
                  top: screenHeight * 0.07,
                  child: CircleAvatar(
                    radius: screenWidth * 0.05,
                    backgroundColor: Colors.white,
                    child: Text(
                      '${controller.femalePercentage.value}%',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth * 0.03,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight * 0.02),

          // 📊 **Legend Section**
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.circle, color: Colors.blue.shade500, size: screenWidth * 0.03),
                  SizedBox(width: screenWidth * 0.02),
                  Text(
                    'Male: ${controller.maleCount.value ~/ 1000}k',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: screenWidth * 0.035,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.circle, color: Colors.yellow, size: screenWidth * 0.03),
                  SizedBox(width: screenWidth * 0.02),
                  Text(
                    'Female: ${controller.femaleCount.value ~/ 1000}k',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: screenWidth * 0.035,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
