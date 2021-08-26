import 'package:flutter/material.dart';

import 'profile.dart';
import 'usr_collect_point.dart';

class HomeScreenUsr extends StatefulWidget {
  const HomeScreenUsr({Key? key}) : super(key: key);

  @override
  _HomeScreenUsrState createState() => _HomeScreenUsrState();
}

class _HomeScreenUsrState extends State<HomeScreenUsr> {
  List<BottomNavigationBarItem> _menuBar = <BottomNavigationBarItem>[
    BottomNavigationBarItem(label: 'แต้มสะสม', icon: Icon(Icons.article)),
    BottomNavigationBarItem(label: 'โปรไฟล์', icon: Icon(Icons.account_circle)),
  ];

  int _currentIndex = 0; // default page

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final List<Widget> _children = [
      UsrCollectPointScreen(),
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
