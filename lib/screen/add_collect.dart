import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:test_point_system/model/collect.dart';
import 'package:test_point_system/screen/login.dart';

class AddCollectScreen extends StatefulWidget {
  const AddCollectScreen({Key? key}) : super(key: key);

  @override
  _AddCollectScreenState createState() => _AddCollectScreenState();
}

class _AddCollectScreenState extends State<AddCollectScreen> {
  final formKey = GlobalKey<FormState>();
  Collect collect = Collect();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("วิธีรับคะแนน"),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "ชื่อวิธีรับคะแนน",
                      style: TextStyle(fontSize: _fontSize),
                    ),
                    TextFormField(
                      autofocus: true,
                      validator: RequiredValidator(errorText: "กรุณาป้อน ชื่อ"),
                      onSaved: (String? name) {
                        collect.name = name;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "คะแนนที่ได้รับ",
                      style: TextStyle(fontSize: _fontSize),
                    ),
                    TextFormField(
                      validator:
                          RequiredValidator(errorText: "กรุณาป้อน คะแนน"),
                      keyboardType: TextInputType.number,
                      onSaved: (String? rewardPoint) {
                        collect.rewardPoint = int.parse(rewardPoint!);
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        DropdownButton(
                          items: _unit,
                          hint: Text("เลือกหน่วย"),
                        ),
                        Text("หรือ",style: TextStyle(fontSize: _fontSize),),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return LoginScreen();
                            }));
                          },
                          child: Text("สร้างหน่วย",
                              style: TextStyle(fontSize: 20)),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            try {
                              Fluttertoast.showToast(
                                  msg: "เพิ่มวิธีรับคะแนนเรียบร้อย");
                              print("${collect.name}, ${collect.rewardPoint}");
                              /*Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return AddCollectScreen();
                                }),
                              );*/
                            } catch (e) {
                              print(e.toString());
                              Fluttertoast.showToast(
                                msg: e.toString(),
                                gravity: ToastGravity.CENTER,
                              );
                            }
                          }
                        },
                        child: Text("เพิ่มวิธีรับคะแนน",
                            style: TextStyle(fontSize: _fontSize)),
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}

final double _fontSize = 20;

List<DropdownMenuItem<String>> _unit = [
  "stamp",
  "point",
  "แต้ม",
  "ความดี",
].map<DropdownMenuItem<String>>((String value) {
  return DropdownMenuItem<String>(
    value: value,
    child: Text(
      value,
      style: TextStyle(color: Colors.black),
    ),
  );
}).toList();
