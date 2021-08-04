import 'package:flutter/material.dart';

class RedeemScreen extends StatefulWidget {
  const RedeemScreen({Key? key}) : super(key: key);

  @override
  _RedeemScreenState createState() => _RedeemScreenState();
}

class _RedeemScreenState extends State<RedeemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("รางวัล"),
      ),
      body: SafeArea(
        child: Align(
          alignment: Alignment.center,
          child: Text("แลกรางวัล"),
        ),
      ),
    );
  }
}
