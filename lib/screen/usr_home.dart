import 'package:collecting_points/screen/profile.dart';
import 'package:flutter/material.dart';

class UsrHomeScreen extends StatefulWidget {
  const UsrHomeScreen({Key? key}) : super(key: key);

  @override
  _UsrHomeScreenState createState() => _UsrHomeScreenState();
}

class _UsrHomeScreenState extends State<UsrHomeScreen> {

  List<BottomNavigationBarItem> _menuBar
  = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      label: 'แต้มสะสม',
      icon: Icon(Icons.article),
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
      UsrHomeScreen(),
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
