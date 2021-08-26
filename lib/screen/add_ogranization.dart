import 'package:collecting_points/model/organization.dart';
import 'package:collecting_points/model/user.dart';
import 'package:collecting_points/provider/organization_provider.dart';
import 'package:collecting_points/screen/homeOg.dart';
import 'package:collecting_points/screen/login.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';

class AddOrganizationScreen extends StatefulWidget {
  const AddOrganizationScreen({Key? key}) : super(key: key);

  @override
  _AddOrganizationScreenState createState() => _AddOrganizationScreenState();
}

class _AddOrganizationScreenState extends State<AddOrganizationScreen> {
  final formKey = GlobalKey<FormState>();
  User user = User(
      name: "sadf",
      tel: "ZXC",
      email: "A@A.X",
      password: "123456",
      usrCollect: [],
      role: "og");
  Organization og = Organization();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("สร้างองค์กร"),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextFormField(
                      autofocus: true,
                      decoration: InputDecoration(labelText: "ชื่อองค์กร"),
                      validator: MultiValidator([
                        RequiredValidator(errorText: "กรุณาป้อน ชื่อองค์กร"),
                      ]),
                      onSaved: (String? name) {
                        og.ogName = name;
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
                                Fluttertoast.showToast(
                                    msg: "สร้างองค์กรเรียบร้อย");
                                print("${og.ownerId}");

                                // เตรียมข้อมูล
                                // Organization statement = og;

                                // เรียก Provider
                                /*OrganizationProvider provider = Provider.of<OrganizationProvider>(context,listen: false);
                                provider.addOrganization(statement);*/

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
