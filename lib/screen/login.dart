import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:test_point_system/model/profile.dart';
import 'package:test_point_system/screen/home.dart';
import 'package:test_point_system/screen/register.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  Profile profile = Profile();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text("Login"),
      ),*/
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(80.0),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Phone No
                  Text(
                    "เบอร์โทร",
                    style: TextStyle(fontSize: 20),
                  ),
                  TextFormField(
                    validator:
                        RequiredValidator(errorText: "กรุณาป้อน เบอร์โทร"),
                    keyboardType: TextInputType.number,
                    onSaved: (String? tel) {
                      profile.tel = tel;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // Password
                  Text(
                    "รหัสผ่าน",
                    style: TextStyle(fontSize: 20),
                  ),
                  TextFormField(
                    validator:
                        RequiredValidator(errorText: "กรุณาป้อน รหัสผ่าน"),
                    obscureText: true,
                    onSaved: (String? password) {
                      profile.password = password;
                    },
                  ),
                  // Button Login
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          try {
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
                          Text("ลงชื่อเข้าใช้", style: TextStyle(fontSize: 20)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return RegisterScreen();
                          }),
                        );
                      },
                      child:
                          Text("ลงทะเบียน", style: TextStyle(fontSize: 20)),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// login btn
/*ElevatedButton
(
onPressed: (
)
async {
if (formKey.currentState!.validate()) {
formKey.currentState!.save();
try {
await FirebaseAuth.instance
    .signInWithEmailAndPassword(
email: profile.email!,
password: profile.password!)
    .then((value) {
formKey.currentState!.reset();
Navigator.pushReplacement(
context,
MaterialPageRoute(builder: (context) {
return WelcomeScreen();
}),
);
});
} on FirebaseAuthException catch (e) {
print(e.message);
Fluttertoast.showToast(
msg: e.message!,
gravity: ToastGravity.CENTER,
);
}
}
},
child: Text
("ลงชื่อเข้าใช้
"
,
style: TextStyle
(
fontSize: 20
)
)
,
)
,*/
