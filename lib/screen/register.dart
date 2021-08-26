import 'package:collecting_points/screen/homeUsr.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:collecting_points/model/user.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _pass        = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();
  User  user    = User()                ;

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
            child: buildSingleChildScrollView(context),
          ),
        ),
      ),
    );
  }

  SingleChildScrollView buildSingleChildScrollView(BuildContext context) {
    return SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  nameTxtFmFld(),
                  sizedBox(15),
                  passTxtFmFld(),
                  sizedBox(15),
                  confirmPassTxtFmFld(),
                  sizedBox(15),
                  emailTxtFmFld(),
                  sizedBox(15),
                  telTxtFmFld(),
                  sizedBox(15),
                  Center(
                    child: SizedBox(
                      width: 180,
                      height: 50,
                      child: registerBtn(context),
                    ),
                  ),
                ]),
          );
  }

  ElevatedButton registerBtn(BuildContext context) {
    return ElevatedButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          try {
                            Fluttertoast.showToast(msg: "ลงทะเบียนเรียบร้อย");
                            print("${user.name}, ${user.password}, ${user.email}, ${user.tel}, ${user.role}, ${user.usrCollect}");

                            //TODO : POST to API
                            // เตรียมข้อมูล
                            //User statement = user;

                            Navigator.pop(context);
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return HomeScreenUsr();
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
                    );
  }

  TextFormField telTxtFmFld() {
    return TextFormField(
                    decoration: InputDecoration(labelText: "เบอร์โทร"),
                    validator: MultiValidator([
                      RequiredValidator(errorText: "กรุณาป้อน เบอร์โทร"),
                    ]),
                    keyboardType: TextInputType.number,
                    onSaved: (String? tel) {
                      user.tel = tel;
                    },
                  );
  }

  TextFormField emailTxtFmFld() {
    return TextFormField(
                    decoration: InputDecoration(labelText: "อีเมล"),
                    validator: MultiValidator([
                      RequiredValidator(errorText: "กรุณาป้อน อีเมล"),
                      EmailValidator(errorText: "รูปแบบอีเมลไม่ถูกต้อง"),
                    ]),
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (String? email) {
                      user.email = email;
                    },
                  );
  }

  TextFormField passTxtFmFld() {
    return TextFormField(
                    controller: _pass,
                    decoration: InputDecoration(labelText: "รหัสผ่าน"),
                    validator: MultiValidator([
                      RequiredValidator(errorText: "กรุณาป้อน รหัสผ่าน"),
                    ]),
                    obscureText: true,
                    keyboardType: TextInputType.number,
                  );
  }

  SizedBox sizedBox(double height) {
    return SizedBox(
                    height: height,
                  );
  }

  TextFormField confirmPassTxtFmFld() {
    return TextFormField(
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
    );
  }

  TextFormField nameTxtFmFld() {
    return TextFormField(
                    autofocus: true,
                    decoration: InputDecoration(labelText: "ชื่อ"),
                    validator: MultiValidator([
                      RequiredValidator(errorText: "กรุณาป้อนชื่อ"),
                    ]),
                    onSaved: (String? name) {
                      user.name = name;
                    },
                  );
  }
}
