import 'package:flutter/material.dart';
import 'package:renderlog/components/navBar.dart';
import 'package:renderlog/pages/HomePage.dart';
import 'package:renderlog/pages/LogWork.dart';
import 'package:renderlog/pages/MyLogs.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  void _onNavItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static final List<Widget> _pages = <Widget>[
    HomePage(),
    LogWorkPage(),
    MyLogsPage(),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: CustomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onNavItemTapped,
      ),
    );
  }
}
