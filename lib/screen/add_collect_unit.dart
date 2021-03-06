import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:collecting_points/model/collect_unit.dart';

class AddCollectUnitScreen extends StatefulWidget {
  const AddCollectUnitScreen({Key? key}) : super(key: key);

  @override
  _AddCollectUnitScreenState createState() => _AddCollectUnitScreenState();
}

class _AddCollectUnitScreenState extends State<AddCollectUnitScreen> {
  final formKey = GlobalKey<FormState>();
  CollectUnit _unit = CollectUnit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("สร้างหน่วยคะแนนสะสม"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: "ชื่อหน่วยคะแนน"),
                    autofocus: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "กรุณาป้อนชื่อ";
                      }
                    },
                    onSaved: (value) {
                      _unit.name = value;
                    },
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
                                msg: "สร้างหน่วยคะแนนเรียบร้อย",
                                gravity: ToastGravity.TOP,
                              );

                              print("${_unit.name}");
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
                        child: Text("สร้างหน่วยคะแนน"),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
