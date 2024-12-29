import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:frontendtask/controllers/OverView%20Controllers/overview_controller.dart';

class OverviewSlider extends StatelessWidget {
  final controller = Get.put(OverviewController());

  final List<Map<String, dynamic>> socialMediaData = [
    {
      'platform': 'Facebook',
      'username': 'mitchell.cooper',
      'followers': '353,49K',
      'growth': '1.43%',
      'icon': "assets/images/facebook.png",
      'iconColor': Colors.blue,
      'bgColor': Colors.blue.shade50,
      'growthColor': Colors.green,
      'growthIcon': Icons.arrow_upward,
    },
    {
      'platform': 'Instagram',
      'username': '@mitchell.cooper',
      'followers': '753,90K',
      'growth': '4.85%',
      'icon': "assets/images/instagram.webp",
      'iconColor': Colors.pink,
      'bgColor': Colors.pink.shade50,
      'growthColor': Colors.green,
      'growthIcon': Icons.arrow_upward,
    },
    {
      'platform': 'Twitter',
      'username': '@mitchell.cooper',
      'followers': '484,36K',
      'growth': '2.79%',
      'icon': "assets/images/twitter.png",
      'iconColor': Colors.lightBlue,
      'bgColor': Colors.lightBlue.shade600,
      'growthColor': Colors.red,
      'growthIcon': Icons.arrow_downward,
    }
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: screenHeight * 0.25,
      child: PageView.builder(
        controller: PageController(viewportFraction: 0.9),
        itemCount: socialMediaData.length,
        itemBuilder: (context, index) {
          final data = socialMediaData[index];
          return Container(
            margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
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
                // Top Row: Icon, Username, Platform Name
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(screenWidth * 0.02),
                      decoration: BoxDecoration(
                        color: data['bgColor'],
                        borderRadius: BorderRadius.circular(screenWidth * 0.03),
                      ),
                      child: Image.asset(
                        data['icon'],
                        width: screenWidth * 0.12,
                        height: screenWidth * 0.12,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.03),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['username'],
                          style: TextStyle(
                            fontSize: screenWidth * 0.04,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          data['platform'],
                          style: TextStyle(
                            fontSize: screenWidth * 0.035,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                  ],
                ),
                SizedBox(height: screenHeight * 0.02),

                // Followers Count and Growth
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['followers'],
                          style: TextStyle(
                            fontSize: screenWidth * 0.06,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.005),
                        Text(
                          'Followers',
                          style: TextStyle(
                            fontSize: screenWidth * 0.035,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.005,
                        horizontal: screenWidth * 0.03,
                      ),
                      decoration: BoxDecoration(
                        color: data['growthColor'].withOpacity(0.1),
                        borderRadius: BorderRadius.circular(screenWidth * 0.02),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            data['growthIcon'],
                            color: data['growthColor'],
                            size: screenWidth * 0.04,
                          ),
                          SizedBox(width: screenWidth * 0.01),
                          Text(
                            data['growth'],
                            style: TextStyle(
                              color: data['growthColor'],
                              fontWeight: FontWeight.bold,
                              fontSize: screenWidth * 0.035,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
