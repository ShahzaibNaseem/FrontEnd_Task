import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TeamInfoWidget extends StatelessWidget {
  final String title;

  TeamInfoWidget({required this.title});

  String getInitials(String title) {
    return title.isNotEmpty
        ? title
        .split(' ')
        .where((word) => word.isNotEmpty)
        .map((word) => word[0])
        .take(2)
        .join()
        .toUpperCase()
        : 'N/A';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(12),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Get.back();
            },
          ),
          SizedBox(width: 10),
          CircleAvatar(
            backgroundColor: Colors.orange,
            child: Text(
              getInitials(title),
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                '6 Members, 3 Online',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
          Spacer(),
          Icon(Icons.more_vert, color: Colors.black),
        ],
      ),
    );
  }
}
