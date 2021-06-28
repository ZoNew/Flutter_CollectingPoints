import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:test_point_system/screen/add_collect.dart';
import 'package:test_point_system/widget/collect_box.dart';

class DetailMemberScreen extends StatefulWidget {
  const DetailMemberScreen({Key? key}) : super(key: key);

  @override
  _DetailMemberScreenState createState() => _DetailMemberScreenState();
}

class _DetailMemberScreenState extends State<DetailMemberScreen> {
  List<CollectBox> listCollectBox = [
    new CollectBox("ขวดพลาสติก", 3, "point"),
    new CollectBox("ขวดแก้ว", 2, "point"),
    new CollectBox("กระป๋อง", 1, "point"),
    new CollectBox("ขวดพลาสติก", 5, "point"),
    new CollectBox("ขวดแก้ว", 2, "point"),
    new CollectBox("กระป๋อง", 4, "point"),
    new CollectBox("ขวดพลาสติก", 3, "point"),
    new CollectBox("ขวดแก้ว", 2, "point"),
    new CollectBox("กระป๋อง", 1, "point"),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                //promotion.name
                "0801210880",
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                //promotion.targetPoint
                "สมเกียรติ วังเนินผา",
                style: TextStyle(fontSize: 25),
              ),
              SizedBox(
                height: 50,
              ),
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                      width: 150,
                      child: ElevatedButton(
                        onPressed: () {
                          Fluttertoast.showToast(
                            msg: "<ทดสอบเพิ่มคะแนน>",
                            gravity: ToastGravity.BOTTOM,
                          );
                        },
                        child: Text(
                          "เพิ่มคะแนน",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 50,
                      width: 150,
                      child: ElevatedButton(
                        onPressed: () {
                          Fluttertoast.showToast(
                            msg: "<ทดสอบแลกรางวัล>",
                            gravity: ToastGravity.BOTTOM,
                          );
                        },
                        child: Text(
                          "แลกรางวัล",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      children: [
                        Text(
                          "คะแนน",
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          width: 60,
                        ),
                        Text(
                          "เป้าหมาย",
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: ListView.builder(
                        physics: ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: listCollectBox.length,
                        itemBuilder: (context, index) {
                          return CollectBox(
                              listCollectBox[index].name,
                              listCollectBox[index].rewardPoint,
                              listCollectBox[index].collectUnit);
                        },
                      ),
                    )
                  ],
                ),
              )
              /*Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: listCollectBox.length,
                  itemBuilder: (context, index) {
                    return CollectBox(listCollectBox[index].name, listCollectBox[index].rewardPoint, listCollectBox[index].collectUnit);
                  },
                ),
              )*/
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
