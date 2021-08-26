import 'package:flutter/material.dart';
import 'package:collecting_points/screen/profile.dart';
import 'package:collecting_points/screen/promotion.dart';

import 'member.dart';

class HomeScreenOg extends StatefulWidget {
  const HomeScreenOg({Key? key}) : super(key: key);

  @override
  _HomeScreenOgState createState() => _HomeScreenOgState();
}

class _HomeScreenOgState extends State<HomeScreenOg> {
  List<BottomNavigationBarItem> _menuBar = <BottomNavigationBarItem>[
    BottomNavigationBarItem(label: 'โปรโมชัน', icon: Icon(Icons.store)),
    BottomNavigationBarItem(label: 'สมาชิก', icon: Icon(Icons.people)),
    BottomNavigationBarItem(label: 'โปรไฟล์', icon: Icon(Icons.account_circle)),
  ];

  int _currentIndex = 1; // default page

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final List<Widget> _children = [
      PromotionScreen(),
      MembersScreen(),
      ProfileScreen(),
    ];

    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          backgroundColor: colorScheme.surface,
          selectedItemColor: colorScheme.onSurface,
          unselectedItemColor: colorScheme.onSurface.withOpacity(.50),
          selectedLabelStyle: textTheme.caption,
          unselectedLabelStyle: textTheme.caption,
          onTap: (value) {
            // Respond to item press.
            setState(() => _currentIndex = value);
          },
          items: _menuBar),
    );
  }
}
