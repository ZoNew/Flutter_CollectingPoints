import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test_point_system/screen/login.dart';
import 'package:test_point_system/screen/member.dart';
import 'package:test_point_system/screen/profile.dart';
import 'package:test_point_system/screen/promotion.dart';

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
      PromotionScreen(),
      MembersScreen(),
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
