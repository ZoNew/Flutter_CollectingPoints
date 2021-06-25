import 'package:flutter/material.dart';

class AddCollectUnit extends StatefulWidget {
  const AddCollectUnit({Key? key}) : super(key: key);

  @override
  _AddCollectUnitState createState() => _AddCollectUnitState();
}

class _AddCollectUnitState extends State<AddCollectUnit> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("สร้างหน่วยคะแนนสะสม"),
      ),
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(key:formKey,child: SingleChildScrollView()),
      )
    );
  }
}
