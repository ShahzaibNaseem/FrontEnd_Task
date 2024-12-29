import 'package:flutter/material.dart';

class MetricCard extends StatelessWidget {
  final String title;
  final String value;
  final String increase;
  final Color backgroundColor;
  final Widget icon;

  MetricCard({
    required this.title,
    required this.value,
    required this.increase,
    required this.backgroundColor,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.symmetric(
        vertical: screenHeight * 0.01,
        horizontal: screenWidth * 0.04,
      ),
      padding: EdgeInsets.all(screenWidth * 0.04),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(screenWidth * 0.03),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: screenWidth * 0.02,
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
              SizedBox(
                width: screenWidth * 0.1,
                height: screenWidth * 0.1,
                child: icon,
              ),
              Icon(
                Icons.more_vert,
                color: Colors.grey,
                size: screenWidth * 0.06,
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.01),
          Text(
            title,
            style: TextStyle(
              fontSize: screenWidth * 0.035,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: screenHeight * 0.01),
          Text(
            value,
            style: TextStyle(
              fontSize: screenWidth * 0.06,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: screenHeight * 0.005),
          Text(
            '+$increase%',
            style: TextStyle(
              fontSize: screenWidth * 0.03,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
