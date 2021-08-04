import 'package:collecting_points/screen/member_test.dart';
import 'package:collecting_points/screen/promotion_test.dart';
import 'package:flutter/material.dart';
import 'package:collecting_points/screen/member.dart';
import 'package:collecting_points/screen/profile.dart';
import 'package:collecting_points/screen/promotion.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<BottomNavigationBarItem> _menuBar
  = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      label: 'โปรโมชัน',
      icon: Icon(Icons.store),
    ),
    BottomNavigationBarItem(
      label: 'สมาชิก',
      icon: Icon(Icons.people),
    ),
    BottomNavigationBarItem(
      label: 'โปรไฟล์',
      icon: Icon(Icons.account_circle),
    ),
  ];

  int _currentIndex = 1; // default page

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme
        .of(context)
        .colorScheme;
    final textTheme = Theme
        .of(context)
        .textTheme;
    final List<Widget> _children = [
      PromotionTestScreen(),
      MembersTestScreen(),
      ProfileScreen(),
    ];

    return Scaffold(
      body: _children[_currentIndex]
      ,
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
          items: _menuBar
      ),
    );
  }
}
