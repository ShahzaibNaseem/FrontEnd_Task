import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:frontendtask/controllers/OverView%20Controllers/follower_controller.dart';

class FollowersCard extends StatelessWidget {
  final FollowersCardController controller = Get.put(FollowersCardController());

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
        borderRadius: BorderRadius.circular(screenWidth * 0.03),
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
          // **Header Section**
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Followers',
                style: TextStyle(
                  fontSize: screenWidth * 0.05,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(Icons.more_horiz, color: Colors.grey, size: screenWidth * 0.06),
            ],
          ),
          SizedBox(height: screenHeight * 0.015),

          // **Followers Count & Growth**
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '${(controller.followers.value / 1000).toStringAsFixed(2)}K',
                style: TextStyle(
                  fontSize: screenWidth * 0.08,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: screenWidth * 0.02),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.005,
                  horizontal: screenWidth * 0.02,
                ),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(screenWidth * 0.02),
                ),
                child: Row(
                  children: [
                    Icon(Icons.arrow_upward, color: Colors.green, size: screenWidth * 0.04),
                    SizedBox(width: screenWidth * 0.01),
                    Text(
                      '${controller.growthPercentage.value}%',
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth * 0.04,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.02),

          // **Weekly Data (Bar Chart Representation)**
          Obx(() => Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: controller.weeklyData.map((data) {
              bool isHighlighted = data['value'] == 100;
              return Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        height: screenHeight * 0.15,
                        width: screenWidth * 0.04,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(screenWidth * 0.015),
                        ),
                      ),
                      Container(
                        height: (data['value'] as int) * screenHeight * 0.001,
                        width: screenWidth * 0.04,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: isHighlighted
                                ? [Colors.orange.shade400, Colors.orange.shade600]
                                : [Colors.blue.shade600, Colors.blue.shade600],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(screenWidth * 0.02),
                            topRight: Radius.circular(screenWidth * 0.02),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.005),
                  Text(
                    data['day'].toString(),
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth * 0.035,
                    ),
                  ),
                ],
              );
            }).toList(),
          )),
          SizedBox(height: screenHeight * 0.02),

          // **Followers & Unfollowed Stats**
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    '${controller.followersGained.value}',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: screenWidth * 0.05,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Followers',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: screenWidth * 0.035,
                    ),
                  ),
                ],
              ),
              Container(
                height: screenHeight * 0.04,
                width: screenWidth * 0.002,
                color: Colors.grey.shade300,
              ),
              Column(
                children: [
                  Text(
                    '${controller.followersLost.value}',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: screenWidth * 0.05,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Unfollowed',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: screenWidth * 0.035,
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
