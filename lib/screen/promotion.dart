import 'package:flutter/material.dart';

import 'login.dart';

class PromotionScreen extends StatefulWidget {
  const PromotionScreen({Key? key}) : super(key: key);

  @override
  _PromotionScreenState createState() => _PromotionScreenState();
}

class _PromotionScreenState extends State<PromotionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Promotions"),
        actions: [
          IconButton(
            onPressed: _pushSaved,
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 15,horizontal: 10),
              title: Text("10 Free $index"),
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
    );
  }

  void _pushSaved() {}
}
