import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0; // default page

  @override
  Widget build(BuildContext context) {
/*    final List<Widget> _children = [
      StorePage(),
      RewardPage(),
      AccountPage(),

    ];*/

    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
    );
  }
}
