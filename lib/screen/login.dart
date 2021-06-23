import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:test_point_system/model/profile.dart';

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
      body: Form(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "เบอร์โทร",
                style: TextStyle(fontSize: 20),
              ),
              TextFormField(
                validator: MultiValidator([
                  RequiredValidator(errorText: "กรุณาป้อน อีเมล"),
                ]),
                keyboardType: TextInputType.number,
                onSaved: (String? tel) {
                  profile.tel = tel;
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
                  RequiredValidator(errorText: "กรุณาป้อน อีเมล"),
                ]),
                keyboardType: TextInputType.number,
                onSaved: (String? tel) {
                  profile.tel = tel;
                },
              ),
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
                  child: Text("ลงชื่อเข้าใช้",
                      style: TextStyle(fontSize: 20)),
                ),
              ),
            ],
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
