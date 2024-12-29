import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/Calender Controllers/calendar_controller.dart';

class CalendarGrid extends StatelessWidget {
  final CalendarController controller = Get.find();

  String _monthName(int month) {
    const List<String> monthNames = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    return monthNames[month - 1];
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
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
              IconButton(
                icon: Icon(Icons.arrow_left),
                onPressed: () => controller.changeMonth(-1),
              ),
              Text(
                '${_monthName(controller.selectedDate.value.month)} ${controller.selectedDate.value.year}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: Icon(Icons.arrow_right),
                onPressed: () => controller.changeMonth(1),
              ),
            ],
          ),
          SizedBox(height: 10),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              childAspectRatio: 1.5,
            ),
            itemCount: DateTime(
                controller.selectedDate.value.year,
                controller.selectedDate.value.month + 1,
                0)
                .day,
            itemBuilder: (context, index) {
              final date = DateTime(
                controller.selectedDate.value.year,
                controller.selectedDate.value.month,
                index + 1,
              );

              bool isSelected = controller.isSelectedDate(date);

              return GestureDetector(
                onTap: () => controller.selectDate(date),
                child: Container(
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
                ),
              );
            },
          ),
        ],
      ),
    ));
  }
}
