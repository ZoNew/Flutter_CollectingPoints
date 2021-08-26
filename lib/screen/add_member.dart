import 'package:collecting_points/provider/user_provider.dart';
import 'package:collecting_points/screen/homeUsr.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:collecting_points/model/user.dart';
import 'package:provider/provider.dart';

import 'homeOg.dart';

class AddMemberScreen extends StatefulWidget {
  const AddMemberScreen({Key? key}) : super(key: key);

  @override
  _AddMemberScreenState createState() => _AddMemberScreenState();
}

class _AddMemberScreenState extends State<AddMemberScreen> {

  final formKey = GlobalKey<FormState>();
  User user = User();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
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
                    TextFormField(
                      autofocus: true,
                      decoration: InputDecoration(labelText: "ชื่อ"),
                      validator: MultiValidator([
                        RequiredValidator(errorText: "กรุณาป้อน ชื่อ"),
                      ]),
                      onSaved: (String? name) {
                        user.name = name;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: _pass,
                      decoration: InputDecoration(labelText: "รหัสผ่าน"),
                      validator: MultiValidator([
                        RequiredValidator(errorText: "กรุณาป้อน รหัสผ่าน"),
                      ]),
                      obscureText: true,
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: _confirmPass,
                      decoration: InputDecoration(labelText: "ยืนยันรหัสผ่าน"),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'กรุณาป้อน รหัสผ่าน';
                        }
                        if (value != _pass.text) {
                          return 'รหัสผ่านไม่ตรงกัน';
                        }
                        return null;
                      },
                      obscureText: true,
                      keyboardType: TextInputType.number,
                      onSaved: (String? password) {
                        user.password = password;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: "อีเมล"),
                      validator: MultiValidator([
                        RequiredValidator(errorText: "กรุณาป้อน อีเมล"),
                        EmailValidator(errorText: "รูปแบบอีเมลไม่ถูกต้อง"),
                      ]),
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (String? email) {
                        user.email = email;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: "เบอร์โทร"),
                      validator: MultiValidator([
                        RequiredValidator(errorText: "กรุณาป้อน เบอร์โทร"),
                      ]),
                      keyboardType: TextInputType.number,
                      onSaved: (String? tel) {
                        user.tel = tel;
                      },
                    ),
                    SizedBox(
                      height: 15,
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
                                Fluttertoast.showToast(msg: "ลงทะเบียนเรียบร้อย");
                                print(
                                    "${user.name}, ${user.password}, ${user.email}, ${user.tel}, ${user.role}, ${user.usrCollect}");



                                // เตรียมข้อมูล
                                User statement = user;

                                // เรียก Provider
                                /*UserProvider provider = Provider.of<UserProvider>(context,listen: false);
                                provider.addUser(statement);*///แก้ทีหลัง


                                Navigator.pop(context);
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (context) {
                                    return HomeScreenOg();
                                  }),
                                );
                              } catch (e) {
                                print(e.toString());
                                Fluttertoast.showToast(
                                  msg: e.toString(),
                                  gravity: ToastGravity.CENTER,
                                );
                              }
                            }
                          },
                          child:
                          Text("ลงทะเบียน", style: TextStyle(fontSize: 20)),
                        ),
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
