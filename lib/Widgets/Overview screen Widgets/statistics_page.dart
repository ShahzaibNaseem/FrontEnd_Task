import 'package:flutter/material.dart';
import 'package:frontendtask/controllers/OverView%20Controllers/statistics_controller.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';

class StatisticsPage extends StatelessWidget {
  final StatisticsController controller = Get.put(StatisticsController());

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Statistics',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12),
          Obx(
                () => Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12), // Rounded corners
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 6,
                    spreadRadius: 1,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: controller.selectedPeriod.value,
                  isExpanded: true,
                  dropdownColor: Colors.white, // Ensures dropdown menu has a white background
                  borderRadius: BorderRadius.circular(12), // Rounded corners for dropdown
                  icon: Icon(Icons.arrow_drop_down, color: Colors.grey),
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                  items: ['This Week', 'Last Week', 'This Month']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    controller.updatePeriod(value!);
                  },
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Section 1: Statistics (Share, Likes, Comments)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Share Column
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Share',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          SizedBox(height: 4),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Obx(() => Text(
                                '${controller.shares.value}',
                                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                              )),
                              SizedBox(width: 8),
                              Obx(() => Row(
                                children: [
                                  Icon(Icons.arrow_upward, color: Colors.green, size: 18),
                                  SizedBox(width: 4),
                                  Text(
                                    '${controller.growthPercentage.value}%',
                                    style: TextStyle(color: Colors.green, fontSize: 16),
                                  ),
                                ],
                              )),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 110),

                    // Likes Column
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Likes',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          SizedBox(height: 4),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Obx(() => Text(
                                '${controller.likes.value}',
                                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                              )),
                              SizedBox(width: 8),
                              Obx(() => Row(
                                children: [
                                  Icon(Icons.arrow_downward, color: Colors.red, size: 18),
                                  SizedBox(width: 4),
                                  Text(
                                    '${controller.growthPercentagelikes.value}%',
                                    style: TextStyle(color: Colors.red, fontSize: 16),
                                  ),
                                ],
                              )),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 80),

                    // Comments Column
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Comments',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          SizedBox(height: 4),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Obx(() => Text(
                                '${controller.comments.value}',
                                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                              )),
                              SizedBox(width: 8),
                              Obx(() => Row(
                                children: [
                                  Icon(Icons.arrow_upward, color: Colors.green, size: 18),
                                  SizedBox(width: 4),
                                  Text(
                                    '${controller.growthPercentagecomments.value}%',
                                    style: TextStyle(color: Colors.green, fontSize: 16),
                                  ),
                                ],
                              )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(width: 50), // Space between statistics and BarChart

                // Section 2: BarChart
                SizedBox(
                  height: 300,
                  width: 600, // Fixed width for the BarChart
                  child: Obx(() => Padding(
                    padding: const EdgeInsets.only(left: 20.0), // Add padding on the left side
                    child: BarChart(
                      BarChartData(
                        barGroups: controller.chartData
                            .asMap()
                            .entries
                            .map(
                              (entry) {
                            final dayData = entry.value as Map<String, dynamic>;
                            final values = dayData['values'] as List<dynamic>;

                            return BarChartGroupData(
                              x: entry.key,
                              barRods: [
                                BarChartRodData(
                                  toY: (values[0] as num).toDouble(),
                                  color: Colors.purple,
                                  width: 10,
                                ),
                                BarChartRodData(
                                  toY: (values[1] as num).toDouble(),
                                  color: Colors.yellow,
                                  width: 10,
                                ),
                                BarChartRodData(
                                  toY: (values[2] as num).toDouble(),
                                  color: Colors.orange,
                                  width: 10,
                                ),
                              ],
                              barsSpace: 2, // Space between individual bars in a group
                            );
                          },
                        ).toList(),
                        titlesData: FlTitlesData(
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              interval: 10,
                              reservedSize: 40,
                            ),
                          ),
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (value, meta) {
                                if (value.toInt() >= 0 && value.toInt() < controller.chartData.length) {
                                  final day = controller.chartData[value.toInt()] as Map<String, dynamic>;
                                  return Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      day['day'] ?? '',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  );
                                }
                                return SizedBox.shrink();
                              },
                              reservedSize: 40, // Space for X-axis labels
                            ),
                          ),
                        ),
                        gridData: FlGridData(show: false),
                        borderData: FlBorderData(
                          show: true,
                          border: Border(
                            left: BorderSide(color: Colors.grey, width: 1),
                            bottom: BorderSide(color: Colors.grey, width: 1),
                          ),
                        ),
                        alignment: BarChartAlignment.spaceAround,
                        groupsSpace: 20, // Space between bar groups
                      ),
                    ),
                  )),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
