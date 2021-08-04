import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:collecting_points/model/user_collect.dart';

class AddPointScreen extends StatefulWidget {
  const AddPointScreen({Key? key}) : super(key: key);

  @override
  _AddPointScreenState createState() => _AddPointScreenState();
}

class _AddPointScreenState extends State<AddPointScreen> {
  final formKey = GlobalKey<FormState>();
  final amountTxtFmFld = TextEditingController();
  UserCollect collect = UserCollect();
  String? _dropdownValue;
  bool isEnable = false;

  List<DropdownMenuItem<String>> _unitList = [
    "point",
    /*"stamp",
    "แต้ม",
    "ความดี",*/
  ].map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(value),
    );
  }).toList();
  int _times = 1;
  double _amount = 0.0;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    amountTxtFmFld.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ThemeData theme = Theme.of(context);
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
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "คะแนน",
                              style: TextStyle(fontSize: _fontSize),
                            ),
                          ),
                          Container(
                            child: TextFormField(
                              autofocus: true,
                              /*validator: RequiredValidator(
                                  errorText: "กรุณาป้อน จำนวน"),*/
                              keyboardType: TextInputType.number,
                              onSaved: (String? times) {
                                if (times!.isNotEmpty) {
                                  _times = int.parse(times);
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "หน่วย",
                                  style: TextStyle(fontSize: _fontSize),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            child: DropdownButtonFormField<String>(
                              validator: (value) {
                                if (value == null) {
                                  return "กรุณาเลือกหน่วย";
                                }
                              },
                              value: _dropdownValue,
                              hint: Text("เลือกหน่วย"),
                              onChanged: (String? newValue) {
                                setState(
                                  () {
                                    _dropdownValue = newValue;
                                  },
                                );
                              },
                              items: _unitList,
                              /*onSaved: (val) {
                                    collect.collectUnit = val;
                                  },*/
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Checkbox(
                      value: isEnable,
                      onChanged: (value) {
                        setState(() {
                          isEnable = value!;
                          amountTxtFmFld.clear();
                        });
                      },
                    ),
                    Text(
                      "จำนวนเงิน",
                      style: TextStyle(fontSize: _fontSize),
                    )
                  ],
                ),
                TextFormField(
                  controller: amountTxtFmFld,
                  enabled: isEnable,
                  keyboardType: TextInputType.number,
                  onSaved: (String? price) {
                    if (price!.isNotEmpty) {
                      _amount = double.parse(price);
                      _times = _amount~/100;         // 100 is collect.price in DB
                      collect.point = _times;
                    }
                  },
                  decoration: InputDecoration(hintText: "จำนวนเงิน"),
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
                              msg: "เพิ่มคะแนนเรียบร้อย",
                              gravity: ToastGravity.TOP,
                            );

                            print(
                                "${collect.og}, ${collect.point}, ${collect.unit}");
                            print(
                                "$_times, ${collect.point}");

                            Navigator.pop(context);
                          } catch (e) {
                            print(e.toString());
                            Fluttertoast.showToast(
                              msg: e.toString(),
                              gravity: ToastGravity.TOP,
                            );
                          }
                        }
                      },
                      child: Text("เพิ่มคะแนน",
                          style: TextStyle(fontSize: _fontSize)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
