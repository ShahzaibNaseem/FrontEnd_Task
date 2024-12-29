import 'package:flutter/material.dart';

class ChatSearchBar extends StatelessWidget {
  final Function(String) onSearch;

  ChatSearchBar({required this.onSearch});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: screenHeight * 0.06, // Dynamic height based on screen size
      margin: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.04, // Horizontal margin scaled dynamically
        vertical: screenHeight * 0.01, // Vertical margin scaled dynamically
      ),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(screenWidth * 0.05), // Dynamic border radius
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 5,
            spreadRadius: 1,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        onChanged: onSearch,
        decoration: InputDecoration(
          hintText: 'Search...',
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: screenWidth * 0.04, // Dynamic font size
          ),
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey,
            size: screenWidth * 0.06, // Dynamic icon size
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: screenHeight * 0.012, // Dynamic padding inside the text field
          ),
        ),
        style: TextStyle(
          fontSize: screenWidth * 0.04, // Dynamic font size for input text
        ),
      ),
    );
  }
}
