import 'package:flutter/material.dart';
import 'package:frontendtask/appbar.dart';
import 'package:frontendtask/controllers/calendar_controller.dart';
import 'package:frontendtask/pages/sidebar.dart';
import 'package:get/get.dart';

import '../controllers/sidebar_controller.dart';

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
          _buildViewToggle(),
          _buildCalendar(),
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

  Widget _buildViewToggle() {
    return Obx(() => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: ['Month', 'Week', 'Day'].map((view) {
        return GestureDetector(
          onTap: () => controller.changeView(view),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
            decoration: BoxDecoration(
              color: controller.selectedView.value == view ? Colors.blue : Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              view,
              style: TextStyle(
                color: controller.selectedView.value == view ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      }).toList(),
    ));
  }

  Widget _buildCalendar() {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.arrow_left),
              Text('June 2021', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Icon(Icons.arrow_right),
            ],
          ),
          SizedBox(height: 10),
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              childAspectRatio: 1.5,
            ),
            itemCount: 30,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => controller.selectDate(DateTime(2021, 6, index + 1)),
                child: Obx(() {
                  bool isSelected = controller.selectedDate.value.day == index + 1;
                  return Container(
                    margin: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.blue : Colors.transparent,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        '${index + 1}',
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                }),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildUpcomingEvents() {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 16),
      children: [
        _buildTimeSlot(time: '07:00', isActive: false),
        _buildEventCard( title: 'Brandbook and Guidebook',  subtitle: 'Design',  time: '07:00', color: Colors.orange, avatars: [
            'assets/images/avatar1.png',
            'assets/images/avatar1.png',
            'assets/images/avatar1.png',
            'assets/images/avatar1.png'
          ],
        ),
        _buildTimeSlot(time: '08:00', isActive: true),
        _buildEventCard(
          title: 'App Development',
          subtitle: 'Coding',
          time: '08:30',
          color: Colors.green,
          avatars: [
            'assets/images/avatar1.png',
            'assets/images/avatar1.png',
            'assets/images/avatar1.png',
            'assets/images/avatar1.png'
          ],
        ),
        _buildTimeSlot(time: '09:00', isActive: false),
        _buildEventCard( title: 'Landing Page',  subtitle: 'Meeting',  time: '07:00', color: Colors.orange, avatars: [
          'assets/images/avatar1.png',
          'assets/images/avatar1.png',
          'assets/images/avatar1.png',
          'assets/images/avatar1.png'
        ],
        ),
        _buildTimeSlot(time: '09:00', isActive: false),
        _buildEventCard(
          title: 'Project "Rocket"',
          subtitle: 'Meeting',
          time: '11:30',
          color: Colors.yellow,
          avatars: [
            'assets/images/avatar1.png',
            'assets/images/avatar1.png',
            'assets/images/avatar1.png',
            'assets/images/avatar1.png',
          ],
        ),
        _buildTimeSlot(time: '12:00', isActive: false),

      ],
    );
  }

  Widget _buildEventCard({
    required String title,
    required String subtitle,
    required String time,
    required Color color,
    required List<String> avatars,
  }) {
    return Container(
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
            height: 60,
            decoration: BoxDecoration(
              color: color,
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
                  title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      subtitle,
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                    SizedBox(width: 8),
                    Icon(Icons.access_time, size: 14, color: Colors.grey),
                    SizedBox(width: 4),
                    Text(
                      time,
                      style: TextStyle(color: Colors.grey.shade600),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: avatars
                      .map((avatar) => Padding(
                    padding: const EdgeInsets.only(right: 4),
                    child: CircleAvatar(
                      backgroundImage: AssetImage(avatar),
                      radius: 12,
                    ),
                  ))
                      .toList(),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTimeSlot({required String time, required bool isActive}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Time Label
        Text(
          time,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isActive ? Colors.blue : Colors.grey,
            fontSize: 14,
          ),
        ),
        SizedBox(width: 12),

        // Time Indicator Line
        Expanded(
          child: CustomPaint(
            painter: isActive
                ? SolidLinePainter(color: Colors.blue)
                : DashedLinePainter(color: Colors.grey.shade300),
            child: SizedBox(height: 2),
          ),
        ),

        // Active Circle Marker
        if (isActive)
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
            ),
          ),
      ],
    );
  }

}

class SolidLinePainter extends CustomPainter {
  final Color color;

  SolidLinePainter({this.color = Colors.blue});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    canvas.drawLine(
      Offset(0, size.height / 2),
      Offset(size.width, size.height / 2),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class DashedLinePainter extends CustomPainter {
  final Color color;
  final double dashWidth;
  final double dashSpace;

  DashedLinePainter({
    this.color = Colors.grey,
    this.dashWidth = 5,
    this.dashSpace = 3,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    double startX = 0;
    final endX = size.width;

    while (startX < endX) {
      canvas.drawLine(
        Offset(startX, size.height / 2),
        Offset(startX + dashWidth, size.height / 2),
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
