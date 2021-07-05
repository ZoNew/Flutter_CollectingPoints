import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:collecting_points/model/collect.dart';
import 'package:collecting_points/screen/add_collect_unit.dart';
import 'package:collecting_points/screen/detail_promotion.dart';

class AddCollectScreen extends StatefulWidget {
  const AddCollectScreen({Key? key}) : super(key: key);

  @override
  _AddCollectScreenState createState() => _AddCollectScreenState();
}

class _AddCollectScreenState extends State<AddCollectScreen> {
  final formKey = GlobalKey<FormState>();
  Collect collect = Collect();
  String? _dropdownValue;
  bool isEnable = false;
  final textFormFieldPrice = TextEditingController();

  List<DropdownMenuItem<String>> _unitList = [
    "stamp",
    "point",
    "แต้ม",
    "ความดี",
  ].map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(value),
    );
  }).toList();

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    double _fontSize = 18.0;
    return Scaffold(
      appBar: AppBar(
        title: Text("วิธีรับคะแนน"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    autofocus: true,
                    decoration: InputDecoration(labelText: "ชื่อวิธีรับคะแนน"),
                    validator: RequiredValidator(errorText: "กรุณาป้อน ชื่อ"),
                    onSaved: (String? name) {
                      collect.name = name;
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: "คะแนนที่ได้รับ"),
                    validator:
                        RequiredValidator(errorText: "กรุณาป้อน คะแนน"),
                    keyboardType: TextInputType.number,
                    onSaved: (String? rewardPoint) {
                      collect.rewardPoint = int.parse(rewardPoint!);
                    },
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "หน่วยคะแนน",
                            style: TextStyle(fontSize: _fontSize),
                          ),

                          Container(
                            width: 120,
                            child: DropdownButtonFormField<String>(
                              validator: (value) {
                                if (value == null) {
                                  return "กรุณาเลือกหน่วย";
                                }
                              },
                              value: _dropdownValue,
                              hint: Text("เลือกหน่วย"),
                              onChanged: (String? newValue) {
                                setState(() {
                                  _dropdownValue = newValue;
                                });
                              },
                              items: _unitList,
                              onSaved: (val) {
                                collect.collectUnit = val;
                              },
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "หรือ",
                        style: TextStyle(fontSize: _fontSize),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return AddCollectUnitScreen();
                          }));
                        },
                        child: Text("สร้างหน่วย",
                            style: TextStyle(fontSize: _fontSize)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: isEnable,
                        onChanged: (value) {
                          setState(() {
                            isEnable = value!;
                            textFormFieldPrice.clear();
                          });
                        },
                      ),
                      Text(
                        "จำนวนเงินที่จะได้แต้ม",
                        style: TextStyle(fontSize: _fontSize),
                      )
                    ],
                  ),
                  TextFormField(
                    controller: textFormFieldPrice,
                    enabled: isEnable,
                    keyboardType: TextInputType.number,
                    onSaved: (String? price) {
                      if (price!.isNotEmpty) {
                        collect.price = int.parse(price);
                      }
                    },
                    decoration:
                        InputDecoration(labelText: "ราคาที่ได้รับคะแนน"),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: SizedBox(
                      width: 180,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            try {
                              Fluttertoast.showToast(
                                msg: "เพิ่มวิธีรับคะแนนเรียบร้อย",
                                gravity: ToastGravity.TOP,
                              );

                              print(
                                  "${collect.name}, ${collect.rewardPoint}, ${collect.collectUnit}, ${collect.price}");
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return DetailPromotionScreen();
                                }),
                              );
                            } catch (e) {
                              print(e.toString());
                              Fluttertoast.showToast(
                                msg: e.toString(),
                                gravity: ToastGravity.TOP,
                              );
                            }
                          }
                        },
                        child: Text("เพิ่มวิธีรับคะแนน",
                            style: TextStyle(fontSize: _fontSize)),
                      ),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}

void onChanged() {}
