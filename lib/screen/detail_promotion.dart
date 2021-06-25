import 'package:flutter/material.dart';

class DetailPromotionScreen extends StatefulWidget {
  const DetailPromotionScreen({Key? key}) : super(key: key);

  @override
  _DetailPromotionScreenState createState() => _DetailPromotionScreenState();
}

class _DetailPromotionScreenState extends State<DetailPromotionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("รายละเอียดโปรโมชัน"),));
  }
}
