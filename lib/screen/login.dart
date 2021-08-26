import '/screen/homeUsr.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import '/model/profile.dart';
import '/screen/homeOg.dart';
import '/screen/register.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  Profile profile = Profile();

  String role = 'og';

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
            useridTxtFmFld(),
            SizedBox(height: 20),
            passTxtFmFld(),
            SizedBox(height: 50),
            loginBtn(),
            SizedBox(height: 20),
            registerBtn()
          ],
        ),
      ),
    );
  }

  TextFormField useridTxtFmFld() {
    return TextFormField(
      decoration: new InputDecoration(labelText: "เบอร์โทร"),
      validator: RequiredValidator(errorText: "กรุณาป้อนเบอร์โทร"),
      keyboardType: TextInputType.number,
      onSaved: (String? tel) {
        profile.tel = tel;
      },
    );
  }

  TextFormField passTxtFmFld() {
    return TextFormField(
      decoration: InputDecoration(labelText: "รหัสผ่าน"),
      validator: RequiredValidator(errorText: "กรุณาป้อนรหัสผ่าน"),
      obscureText: true,
      onSaved: (String? pass) {
        profile.password = pass;
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
        onPressed: () => register(),
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
          MaterialPageRoute(
            builder: (context) =>
                role == 'usr' ? HomeScreenUsr() : HomeScreenOg(),
          ),
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
      MaterialPageRoute(builder: (context) => RegisterScreen()),
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
