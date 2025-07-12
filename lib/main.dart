import 'package:flutter/material.dart';
import 'package:matchme_fe/screens/splash_screen.dart';
import 'pages/profile_page.dart';
import 'pages/info_page.dart';
import 'pages/match_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: const SplashScreen());
    //return const MaterialApp(home: BottomTabApp());
  }
}

class BottomTabApp extends StatefulWidget {
  const BottomTabApp({super.key});
  @override
  State<BottomTabApp> createState() => _BottomTabAppState();
}

class _BottomTabAppState extends State<BottomTabApp> {
  int _index = 0;

  final _pages = [
    ProfilePage(),
    MatchPage(),
    InfoPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _index, children: _pages),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,  // or shifting
        backgroundColor: Colors.black,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 14,
        unselectedFontSize: 12,
        iconSize: 30,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: '프로필'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: '매칭'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: '정보'),
        ],
      ),
    );
  }
}