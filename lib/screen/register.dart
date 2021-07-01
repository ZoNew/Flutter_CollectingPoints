import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:collecting_points/model/user.dart';

import 'home.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
                    Text(
                      "ชื่อ",
                      style: TextStyle(fontSize: 20),
                    ),
                    TextFormField(
                      autofocus: true,
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
                    Text(
                      "รหัสผ่าน",
                      style: TextStyle(fontSize: 20),
                    ),
                    TextFormField(
                      controller: _pass,
                      validator: MultiValidator([
                        RequiredValidator(errorText: "กรุณาป้อน รหัสผ่าน"),
                      ]),
                      obscureText: true,
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "รหัสผ่าน",
                      style: TextStyle(fontSize: 20),
                    ),
                    TextFormField(
                      controller: _confirmPass,
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
                    Text(
                      "อีเมล",
                      style: TextStyle(fontSize: 20),
                    ),
                    TextFormField(
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
                    Text(
                      "เบอร์โทร",
                      style: TextStyle(fontSize: 20),
                    ),
                    TextFormField(
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
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            try {
                              Fluttertoast.showToast(msg: "ลงทะเบียนเรีนยร้อย");
                              print(
                                  "${user.name}, ${user.password}, ${user.email}, ${user.tel}, ${user.role}, ${user.usrCollect}");
                              Navigator.pop(context);
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return HomeScreen();
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
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
