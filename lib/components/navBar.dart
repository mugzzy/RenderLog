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
      backgroundColor: Color(0xFFFFFFFF),
      selectedItemColor: Color(0xFF9333EA),
      unselectedItemColor: Color(0xFFBDBDBD),
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
