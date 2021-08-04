import 'package:flutter/material.dart';
import 'package:collecting_points/screen/add_promotion.dart';
import 'package:collecting_points/screen/detail_promotion.dart';


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
        title: Text("โปรโมชัน"),
        actions: [
          IconButton(
            onPressed: _pushSaved,
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            child: ListTile(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              title: Text("10 Free ${index+1}"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return DetailPromotionScreen();
                  }),
                );
              },
            ),
          );
        },
      ),
    );
  }

  void _pushSaved() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return AddPromotionScreen();
        },
      ),
    );
  }
}
