import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:collecting_points/screen/add_collect.dart';
import 'package:collecting_points/screen/add_point.dart';
import 'package:collecting_points/screen/redeem.dart';
import 'package:collecting_points/widget/point_list_view.dart';

class DetailMemberScreen extends StatefulWidget {
  const DetailMemberScreen({Key? key}) : super(key: key);

  @override
  _DetailMemberScreenState createState() => _DetailMemberScreenState();
}

class _DetailMemberScreenState extends State<DetailMemberScreen> {
  List<PointListView> listCollectBox = [
    // new CollectBox(name: "ขวดพลาสติก",rewardPoint:  3,collectUnit: "point"),
    PointListView(50, "point"),
/*    PointListView(1000, "ความดี"),
    PointListView(4, "stamp"),
    PointListView(1, "แก้วหมี"),
    PointListView(8, "มูมู่"),
    PointListView(4, "กล้าหาญ"),*/
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("รายละเอียด"),
        /*actions: [
          IconButton(
            onPressed: _pushSaved,
            icon: Icon(Icons.control_point),
          )
        ],*/
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                //promotion.name
                "0801234567",
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                //promotion.targetPoint
                "สมชาย",
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
                          /*Fluttertoast.showToast(
                            msg: "ทดสอบเพิ่มคะแนน",
                            gravity: ToastGravity.BOTTOM,
                          );*/
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return AddPointScreen();
                            }),
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
                            msg: "ทดสอบแลกรางวัล",
                            gravity: ToastGravity.BOTTOM,
                          );
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return RedeemScreen();
                            }),
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
                        Expanded(
                          child: Text(
                            "คะแนน",
                            style: TextStyle(fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        /*Expanded(
                          child: Text(
                            "หน่วย",
                            style: TextStyle(fontSize: 20),
                            textAlign: TextAlign.center,
                          ),
                        ),*/
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
                          return PointListView(
                            listCollectBox[index].point,
                            listCollectBox[index].unit,
                          );
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
