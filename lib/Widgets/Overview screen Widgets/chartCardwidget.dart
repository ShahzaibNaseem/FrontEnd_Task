import 'package:flutter/material.dart';

class ChartCard extends StatelessWidget {
  final String title;
  final Widget chart;
  final Widget? footer;

  ChartCard({required this.title, required this.chart, this.footer});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 5,
            spreadRadius: 1,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(Icons.more_vert, color: Colors.grey),
            ],
          ),
          SizedBox(height: 8),
          chart,
          if (footer != null) SizedBox(height: 8),
          if (footer != null) footer!,
        ],
      ),
    );
  }
}
