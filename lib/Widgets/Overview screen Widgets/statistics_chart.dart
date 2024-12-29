import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class StatisticsChart extends StatelessWidget {
  final List<int> chartData;

  const StatisticsChart({required this.chartData});

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceBetween, // Ensures spacing between groups
        barGroups: chartData
            .asMap()
            .entries
            .map((entry) => BarChartGroupData(
          x: entry.key,
          barRods: [
            BarChartRodData(
              toY: entry.value.toDouble(),
              color: _indexColor(entry.key),
              width: 14, // Bar width
              borderRadius: BorderRadius.circular(4),
            ),
          ],
        ))
            .toList(),
        groupsSpace: 8, // Adds spacing between groups (weekdays)
        titlesData: FlTitlesData(
          show: true,
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                return Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
                        .elementAt(value.toInt()),
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          rightTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
        ),
        gridData: FlGridData(show: false),
        borderData: FlBorderData(show: false),
      ),
    );
  }

  Color _indexColor(int index) {
    switch (index) {
      case 0:
        return Colors.purple;
      case 1:
        return Colors.yellow;
      case 2:
        return Colors.orange;
      default:
        return Colors.blue;
    }
  }
}
