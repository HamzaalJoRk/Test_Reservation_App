import 'package:flutter/material.dart';
import 'package:reservation_app/view/main_screen.dart';
import 'package:reservation_app/view/profile/Home.dart';

class Bottombar extends StatefulWidget {
  const Bottombar({super.key});

  @override
  State<Bottombar> createState() => _BottombarState();
}

class _BottombarState extends State<Bottombar> {
  int currentIndex = 0;

  final List<Widget> pages = [
    MainScreen(),
    MainScreen(),
    MainScreen(),
    MainScreen(),
    HomeProfile()
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(
            () {
              currentIndex = index;
            },
          );
        },
        showSelectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'استكشف',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wallet),
            label: 'تذاكري',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'احجز',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.room),
            label: 'المناطق',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_2_outlined,
              size: 30,
            ),
            label: 'حسابي',
          ),
        ],
      ),
    );
  }
}