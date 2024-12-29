import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ActivityCard extends StatelessWidget {
  final String title;
  final String value;
  final String increasePercentage;

  const ActivityCard({
    Key? key,
    required this.title,
    required this.value,
    required this.increasePercentage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth * 0.9,
      height: screenHeight * 0.5,
      margin: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.05,
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
          // **Title and Options Menu**
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: screenWidth * 0.045,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(Icons.more_horiz, color: Colors.grey, size: screenWidth * 0.06),
            ],
          ),
          SizedBox(height: screenHeight * 0.015),

          // **Value and Growth Percentage**
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                value,
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
                      increasePercentage,
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

          // **Line Chart**
          Expanded(
            child: SizedBox(
              height: screenHeight * 0.3,
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: true),
                  titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, _) {
                          switch (value.toInt()) {
                            case 0:
                              return Text('M', style: TextStyle(fontSize: screenWidth * 0.03));
                            case 1:
                              return Text('T', style: TextStyle(fontSize: screenWidth * 0.03));
                            case 2:
                              return Text('W', style: TextStyle(fontSize: screenWidth * 0.03));
                            case 3:
                              return Text('T', style: TextStyle(fontSize: screenWidth * 0.03));
                            case 4:
                              return Text('F', style: TextStyle(fontSize: screenWidth * 0.03));
                            case 5:
                              return Text('S', style: TextStyle(fontSize: screenWidth * 0.03));
                            case 6:
                              return Text('S', style: TextStyle(fontSize: screenWidth * 0.03));
                            default:
                              return Text('');
                          }
                        },
                        reservedSize: screenHeight * 0.04,
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: screenWidth * 0.08,
                        interval: 10,
                      ),
                    ),
                    topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border: Border(
                      left: BorderSide(color: Colors.grey.shade300, width: 1),
                      bottom: BorderSide(color: Colors.grey.shade300, width: 1),
                    ),
                  ),
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        FlSpot(0, 10),
                        FlSpot(1, 20),
                        FlSpot(2, 15),
                        FlSpot(3, 30),
                      ],
                      isCurved: true,
                      color: Colors.orange,
                      barWidth: screenWidth * 0.005,
                      belowBarData: BarAreaData(
                        show: true,
                        color: Colors.orange.withOpacity(0.2),
                      ),
                      dotData: FlDotData(show: true),
                    ),
                  ],
                ),
              ),
            ),
          ),

          SizedBox(height: screenHeight * 0.02),
        ],
      ),
    );
  }
}
