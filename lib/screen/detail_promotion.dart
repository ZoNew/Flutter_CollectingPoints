import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:collecting_points/screen/add_collect.dart';
import 'package:collecting_points/widget/collect_box.dart';

class DetailPromotionScreen extends StatefulWidget {
  const DetailPromotionScreen({Key? key}) : super(key: key);

  @override
  _DetailPromotionScreenState createState() => _DetailPromotionScreenState();
}

class _DetailPromotionScreenState extends State<DetailPromotionScreen> {
  List<CollectBox> listCollectBox = [
    new CollectBox("เก็บขวดพลาสติก", 5, "point"),
    new CollectBox("เก็บขวดแก้ว", 3, "point"),
    new CollectBox("เก็บกระป๋อง", 1, "point"),
    /*new CollectBox("ถุงก๊อปแก๊บ", 5, "point"),
    new CollectBox("ขวดแก้ว", 2, "point"),
    new CollectBox("กระป๋อง", 4, "point"),
    new CollectBox("ขวดพลาสติก", 3, "point"),
    new CollectBox("ขวดแก้ว", 2, "point"),
    new CollectBox("กระป๋อง", 1, "point"),*/
  ];

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
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
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
                "1,000 point",
                style: TextStyle(fontSize: 25),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                //promotion.targetPoint
                "วีธีรับคะแนน",
                style: TextStyle(fontSize: 15),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: listCollectBox.length,
                  itemBuilder: (context, index) {
                    return CollectBox(
                      listCollectBox[index].name,
                      listCollectBox[index].rewardPoint,
                      listCollectBox[index].unitName,
                    );
                  },
                ),
              ),
            ],
          ),
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
