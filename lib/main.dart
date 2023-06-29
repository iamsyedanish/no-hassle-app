// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:ffi';

import 'package:flutter/material.dart';

import 'components/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'No Hassle',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'No Hassle'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  bool isBold = false;

  void changeToBold(bool val) => {
        setState(
          () => {isBold = val},
        )
      };

  bool get boldStatus => isBold;

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = <Widget>[
      Home(changeToBold, boldStatus),
      Text(
        'Index 1: Business',
      ),
      Text(
        'Index 2: School',
      ),
      Text(
        'Index 3: Settings',
      ),
    ];

    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle: isBold
            ? const TextStyle(
                fontWeight: FontWeight.bold, fontFamily: 'Poppins')
            : const TextStyle(
                fontWeight: FontWeight.normal, fontFamily: 'Poppins'),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('lib/assets/img/home.png')),
            label: 'Home',
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('lib/assets/img/favorite.png')),
            label: 'Favorite',
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('lib/assets/img/activity.png')),
            label: 'Recent Activity',
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage('lib/assets/img/profile.png')),
            label: 'Profile',
            backgroundColor: Colors.purple,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
