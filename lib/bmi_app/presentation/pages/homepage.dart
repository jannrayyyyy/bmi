import 'package:bmi_app/bmi_app/presentation/pages/firstpage.dart';
import 'package:bmi_app/bmi_app/presentation/pages/secondpage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedindex = 0;
  final List<Widget> _screen = [const FirstPage(), SecondPage()];

  void onTapNav(int index) {
    setState(() {
      _selectedindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screen[_selectedindex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: ''),
        ],
        currentIndex: _selectedindex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 14.0,
        unselectedFontSize: 14.0,
        onTap: onTapNav,
      ),
    );
  }
}
