import 'package:flutter/material.dart';
import 'package:test_point_system/screen/add_collect.dart';

import 'login.dart';

class DetailPromotionScreen extends StatefulWidget {
  const DetailPromotionScreen({Key? key}) : super(key: key);

  @override
  _DetailPromotionScreenState createState() => _DetailPromotionScreenState();
}

class _DetailPromotionScreenState extends State<DetailPromotionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("รายละเอียด"),
        actions: [
          IconButton(
            onPressed: _pushSaved,
            icon: Icon(Icons.control_point),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              //promotion.name
              "ขยะแลก 50 บาท",
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              //promotion.targetPoint
              "500 point",
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(
              height: 20,
            ),
            ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: ListTile(
                    title: Text("0801111222 #$index"),
                    subtitle: Text("นิติ บอย "),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return LoginScreen();
                        }),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _pushSaved() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return AddCollectScreen();
        },
      ),
    );
  }
}
