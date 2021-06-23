import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test_point_system/screen/login.dart';

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
      body: ElevatedButton(
        onPressed: () {
          Fluttertoast.showToast(
            msg: "ออกจากระบบเรียบร้อยแล้ว",
            gravity: ToastGravity.BOTTOM,
          );
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) {
              return LoginScreen();
            }),
          );
        },
        child: Text("ออกจากระบบ"),
      ),
    );
  }
}
