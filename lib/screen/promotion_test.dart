import 'package:collecting_points/model/promotion.dart';
import 'package:flutter/material.dart';
import 'package:collecting_points/screen/add_promotion.dart';
import 'package:collecting_points/screen/detail_promotion.dart';
import 'package:http/http.dart' as http;

class PromotionTestScreen extends StatefulWidget {
  const PromotionTestScreen({Key? key}) : super(key: key);

  @override
  _PromotionTestScreenState createState() => _PromotionTestScreenState();
}

class _PromotionTestScreenState extends State<PromotionTestScreen> {
  late List<Promotion> _dataFromAPI;

  @override
  void initState() {
    super.initState();
    getPromotionFormAPI();
  }

  Future<List<Promotion>> getPromotionFormAPI() async {
    var url = Uri.parse("http://192.168.1.2:3000/promotions");
    var response = await http.get(url);
    _dataFromAPI = promotionFromJson(response.body);
    return _dataFromAPI;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("โปรโมชัน"),
        actions: [IconButton(onPressed: _pushSaved, icon: Icon(Icons.add))],
      ),
      body: body(),
    );
  }

  Widget body() {
    return FutureBuilder(
      future: getPromotionFormAPI(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        // ดึงข้อมูลจาก API มาครบเรียบร้อย
        if (snapshot.connectionState == ConnectionState.done) {
          var result = snapshot.data;
          return ListView.builder(
            itemCount: _dataFromAPI.length,
            itemBuilder: (context, index) {
              Promotion ojData = result[index];
              return buildCard(index, context, ojData);
            },
          );
        }
        return LinearProgressIndicator();
      },
    );
  }

  Card buildCard(int index, BuildContext context, Promotion promotion) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        title: Text(promotion.proName.toString()),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return DetailPromotionScreen();
            }),
          );
        },
      ),
    );
  }

  void _pushSaved() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return AddPromotionScreen();
        },
      ),
    );
  }
}
