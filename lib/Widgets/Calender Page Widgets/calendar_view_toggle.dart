import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/Calender Controllers/calendar_controller.dart';

class CalendarViewToggle extends StatelessWidget {
  final CalendarController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: screenWidth * 0.05),
          child: Text(
            'Calendar',
            style: TextStyle(
              fontSize: screenWidth * 0.06,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: screenHeight * 0.02),

        Row(
          children: [
            SizedBox(width: screenWidth * 0.05),
            Center(
              child: SizedBox(
                width: screenWidth * 0.7,
                child: Container(
                  height: screenHeight * 0.06,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
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
                  child: Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: ['Month', 'Week', 'Day'].map((view) {
                      return Expanded(
                        child: GestureDetector(
                          onTap: () {
                            controller.changeView(view);
                          },
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 200),
                            margin: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.005),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: controller.selectedView.value == view
                                  ? Colors.white
                                  : Colors.transparent,
                              borderRadius:
                              BorderRadius.circular(screenWidth * 0.01),
                            ),
                            child: Text(
                              view,
                              style: TextStyle(
                                fontSize: screenWidth * 0.04,
                                color: controller.selectedView.value == view
                                    ? Colors.black
                                    : Colors.grey.shade600,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  )),
                ),
              ),
            ),
            SizedBox(width: screenWidth * 0.05),

            // ➕ Add Button
            GestureDetector(
              onTap: () {
                print('Add Event');
              },
              child: Container(
                width: screenWidth * 0.1,
                height: screenWidth * 0.1,
                margin: EdgeInsets.only(left: screenWidth * 0.02),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(screenWidth * 0.02),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.3),
                      blurRadius: 5,
                      spreadRadius: 1,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: screenWidth * 0.07,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
