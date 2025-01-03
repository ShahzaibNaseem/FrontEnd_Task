import 'package:flutter/material.dart';

class ChatItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color avatarColor;
  final String initials;
  final bool showBadge;
  final VoidCallback onTap;

  ChatItem({
    required this.title,
    required this.subtitle,
    required this.avatarColor,
    required this.initials,
    this.showBadge = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.04, // Dynamic horizontal margin
          vertical: screenHeight * 0.008, // Dynamic vertical margin
        ),
        padding: EdgeInsets.all(screenWidth * 0.04),
        width: double.infinity,
        height: screenHeight * 0.12, // 12% of screen height
        decoration: BoxDecoration(
          color: Color(0xFFF5F7FA),
          borderRadius: BorderRadius.circular(screenWidth * 0.035),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 5,
              spreadRadius: 1,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: avatarColor,
              radius: screenWidth * 0.07, // Dynamic avatar size
              child: Text(
                initials,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: screenWidth * 0.045, // Dynamic font size
                ),
              ),
            ),
            SizedBox(width: screenWidth * 0.03), // Dynamic spacing

            // **Title and Subtitle**
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.005),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: screenWidth * 0.035,
                      color: Colors.grey.shade600,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
            ),

            // **Badge (if shown)**
            if (showBadge)
              Container(
                margin: EdgeInsets.only(left: screenWidth * 0.02),
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.02,
                  vertical: screenHeight * 0.005,
                ),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(screenWidth * 0.03),
                ),
                child: Text(
                  '3',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth * 0.03,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
