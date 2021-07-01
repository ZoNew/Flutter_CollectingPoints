import 'package:collecting_points/screen/usr_home.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:collecting_points/model/profile.dart';
import 'package:collecting_points/screen/home.dart';
import 'package:collecting_points/screen/register.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  Profile profile = Profile();

  String role = 'usr';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(80.0),
          child: formLoginView(context),
        ),
      ),
    );
  }

  Form formLoginView(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            useridLabel(),
            useridTxtFmFld(),
            SizedBox(height: 20),
            passwordLabel(),
            passwordTxtFmFld(),
            SizedBox(height: 50),
            loginBtn(),
            SizedBox(height: 20),
            registerBtn()
          ],
        ),
      ),
    );
  }

  Text useridLabel() {
    return Text(
      "เบอร์โทร",
      style: TextStyle(fontSize: 20),
    );
  }

  TextFormField useridTxtFmFld() {
    return TextFormField(
      validator: RequiredValidator(errorText: "กรุณาป้อน เบอร์โทร"),
      keyboardType: TextInputType.number,
      onSaved: (String? tel) {
        profile.tel = tel;
      },
    );
  }

  Text passwordLabel() {
    return Text(
      "รหัสผ่าน",
      style: TextStyle(fontSize: 20),
    );
  }

  TextFormField passwordTxtFmFld() {
    return TextFormField(
      validator: RequiredValidator(errorText: "กรุณาป้อน รหัสผ่าน"),
      obscureText: true,
      onSaved: (String? password) {
        profile.password = password;
      },
    );
  }

  SizedBox loginBtn() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => login(),
        child: Text("เข้าสู่ระบบ", style: TextStyle(fontSize: 20)),
      ),
    );
  }

  Center registerBtn() {
    return Center(
      child: TextButton(
        onPressed: () {
          register();
        },
        child: Text("ลงทะเบียน", style: TextStyle(fontSize: 20)),
      ),
    );
  }

  void login() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      try {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) {
            if (role == 'usr')
              return UsrHomeScreen();
            else
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
  }

  void register() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return RegisterScreen();
      }),
    );
  }
}

// login Firebase
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
