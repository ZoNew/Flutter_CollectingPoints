import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'login.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("โปรไฟล์"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            height: 50,
            child: ElevatedButton(
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
          ),
        ),
      ),
    );
  }
}
