import 'package:datacollection/pages/Homepage.dart';
import 'package:datacollection/pages/Profilepage.dart';
import 'package:datacollection/pages/datapage.dart';
import 'package:flutter/material.dart';

class BottomPage extends StatefulWidget {
  const BottomPage({super.key});

  @override
  State<BottomPage> createState() => _BottomPageState();
}

class _BottomPageState extends State<BottomPage> {
  int index = 0;
  final screen = [
    const Homepage(),
    const DataPage(),
    const ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: Colors.green[400],
          labelTextStyle: MaterialStateProperty.all(
              const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
        ),
        child: NavigationBar(
            height: 60,
            selectedIndex: index,
            onDestinationSelected: (index) =>
                setState(() => this.index = index),
            destinations: const [
              NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
              NavigationDestination(
                  icon: Icon(Icons.collections_rounded), label: 'Datas'),
              NavigationDestination(
                  icon: Icon(Icons.person_pin_circle_outlined),
                  label: 'Profile'),
            ]),
      ),
    );
  }
}
