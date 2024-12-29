import 'package:flutter/material.dart';
import 'package:frontendtask/Widgets/Calender%20Page%20Widgets/calendar_grid.dart';
import 'package:frontendtask/Widgets/Calender%20Page%20Widgets/calendar_view_toggle.dart';
import 'package:frontendtask/Custom%20Widgets/App%20Bar/appbar.dart';
import 'package:frontendtask/controllers/Calender%20Controllers/calendar_controller.dart';
import 'package:frontendtask/Custom%20Widgets/SideBar/sidebar.dart';
import 'package:get/get.dart';

import '../Custom Widgets/Dashed Line/dashed_line_painter.dart';
import '../Custom Widgets/Solid Line/solid_line_painter.dart';
import '../controllers/Side Bar Controller/sidebar_controller.dart';

class CalendarPage extends StatelessWidget {
  final CalendarController controller = Get.put(CalendarController());
  final SidebarController sidebarcontroller = Get.put(SidebarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: CustomAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          CalendarViewToggle(),
          CalendarGrid(),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text('Upcoming', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: 10),
          Expanded(child: _buildUpcomingEvents()),
          SizedBox(height: 30),
        ],
      ),
      drawer: Sidebar(),
    );
  }




  Widget _buildUpcomingEvents() {
    final List<Map<String, dynamic>> events = [
      {
        'starttime': '07:00',
        'middletime': '07:30',
        'endtime': '08:00',
        'isActive': false,
        'title': 'Brandbook and Guidebook',
        'category': 'Design',
        'eventTime': '07:00',
        'avatars': ['assets/images/avatar1.png', 'assets/images/avatar1.png']
      },
      {
        'starttime': '09:00',
        'middletime': '09:30',
        'endtime': '10:30',
        'isActive': false,
        'title': 'App Development',
        'category': 'Coding',
        'eventTime': '09:00',
        'avatars': [
          'assets/images/avatar1.png',
          'assets/images/avatar1.png',
          'assets/images/avatar1.png'
        ]
      },
      {
        'starttime': '10:30',
        'middletime': '11:00',
        'endtime': '11:30',
        'isActive': false,
        'title': 'Landing Page',
        'category': 'Meeting',
        'eventTime': '10:30',
        'avatars': [
          'assets/images/avatar1.png',
          'assets/images/avatar1.png',
          'assets/images/avatar1.png'
        ]
      },
      {
        'starttime': '11:30',
        'middletime': '12:00',
        'endtime': '12:30',
        'isActive': false,
        'title': 'Project Rocket',
        'category': 'Meeting',
        'eventTime': '11:30',
        'avatars': ['assets/images/avatar1.png', 'assets/images/avatar1.png']
      },

    ];

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: events.map((event) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Time Column
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildTimeSlot(
                      time: event['starttime'],
                      isActive: event['isActive'],
                    ),
                    SizedBox(height: 40),
                    _buildTimeSlot(
                      time: event['middletime'],
                      isActive: event['isActive'],
                    ),
                    SizedBox(height: 40),
                    _buildTimeSlot(
                      time: event['endtime'],
                      isActive: event['isActive'],
                    ),
                    SizedBox(height: 40),
                  ],
                ),
                SizedBox(width: 20),

                // Event Card
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade200,
                          blurRadius: 5,
                          spreadRadius: 1,
                          offset: Offset(0, 2),
                        )
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Vertical Color Bar
                        Container(
                          width: 4,
                          height: 90,
                          decoration: BoxDecoration(
                            color: event['isActive'] ? Colors.blue : Colors.orange,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                        SizedBox(width: 12),

                        // Event Details
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                event['title'],
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Row(
                                children: [
                                  Text(
                                    event['category'],
                                    style: TextStyle(color: Colors.grey.shade600),
                                  ),
                                  SizedBox(width: 20),
                                  Icon(Icons.access_time, size: 14, color: Colors.grey),
                                  SizedBox(width: 4),
                                  Text(
                                    event['eventTime'],
                                    style: TextStyle(color: Colors.grey.shade600),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: (event['avatars'] as List<String>).map((avatar) {
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 4.0),
                                    child: CircleAvatar(
                                      backgroundImage: AssetImage(avatar),
                                      radius: 12,
                                    ),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }


  Widget _buildTimeSlot({required String time, required bool isActive}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min, // Prevent Row from stretching infinitely
      children: [
        // Time Label
        SizedBox(
          width: 50, // Ensure a finite width for the time
          child: Text(
            time,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isActive ? Colors.blue : Colors.grey,
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(width: 8),

        // Time Indicator Line
        Flexible(
          fit: FlexFit.loose,
          child: SizedBox(
            height: 2,
            child: CustomPaint(
              painter: isActive
                  ? SolidLinePainter(color: Colors.blue)
                  : DashedLinePainter(color: Colors.grey.shade300),
            ),
          ),
        ),

        // Active Circle Marker
        if (isActive)
          Container(
            width: 16,
            height: 16,
            margin: EdgeInsets.only(left: 8),
            decoration: BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
            ),
          ),
      ],
    );
  }


}
