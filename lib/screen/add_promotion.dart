import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:collecting_points/model/promotion.dart';

import 'add_collect.dart';
import 'home.dart';

class AddPromotionScreen extends StatefulWidget {
  const AddPromotionScreen({Key? key}) : super(key: key);

  @override
  _AddPromotionScreenState createState() => _AddPromotionScreenState();
}

class _AddPromotionScreenState extends State<AddPromotionScreen> {
  final formKey = GlobalKey<FormState>();
  Promotion promotion = Promotion();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("สร้างโปรโมชัน"),
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
                      "ชื่อโปรโมชัน",
                      style: TextStyle(fontSize: 20),
                    ),
                    TextFormField(
                      autofocus: true,
                      validator: RequiredValidator(
                          errorText: "กรุณาป้อน ชื่อ"),
                      onSaved: (String? name) {
                        promotion.name = name;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "คะแนนเป้าหมาย",
                      style: TextStyle(fontSize: 20),
                    ),
                    TextFormField(
                      validator:
                          RequiredValidator(errorText: "กรุณาป้อน คะแนน"),
                      keyboardType: TextInputType.number,
                      onSaved: (String? targetPoint) {
                        promotion.targetPoint = int.parse(targetPoint!) ;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            try {
                              Fluttertoast.showToast(msg: "สร้างโปรโมชันเรียบร้อย");
                              print(
                                  "${promotion.name}, ${promotion.targetPoint}");
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return AddCollectScreen();
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
                        child:
                            Text("สร้างโปรโมชัน", style: TextStyle(fontSize: 20)),
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
