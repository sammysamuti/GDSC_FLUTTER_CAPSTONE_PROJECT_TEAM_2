import 'package:shine/pages/HomeScreen/HomeScreen.dart';
import 'package:flutter/material.dart';

class General_Screen extends StatefulWidget {
  const General_Screen({super.key});

  @override
  State<General_Screen> createState() => _General_ScreenState();
}

class _General_ScreenState extends State<General_Screen> {
  int _selectedScreen = 0;

  List<Widget> AllScreens = [
    HomeScreen(),
  ];

  void _currentScreen(int index) {
  setState(() {
    _selectedScreen = index;
  });
}
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AllScreens[_selectedScreen],
        bottomNavigationBar: BottomNavigationBar(
          onTap: _currentScreen,
          currentIndex: _selectedScreen,
          selectedItemColor: const Color(0xFF6055D8),
          unselectedItemColor: Colors.grey,
          iconSize: 30,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "",
            ),
          ],
        ));
  }
}
