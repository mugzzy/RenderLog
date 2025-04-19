import 'package:flutter/material.dart';

class CustomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      backgroundColor: const Color(0xFF1E1E1E), // Dark gray (soft black)
      selectedItemColor: const Color(0xFFFFB74D), // Soft orange (#FFB74D)
      unselectedItemColor: const Color(0xFFBDBDBD), // Light gray (#BDBDBD)
      type: BottomNavigationBarType.fixed, // ensures all labels are shown
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.edit), label: 'Log Work'),
        BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today), label: 'My Logs'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}
