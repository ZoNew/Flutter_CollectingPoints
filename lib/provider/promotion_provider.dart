import 'package:collecting_points/database/promotion_db.dart';
import 'package:collecting_points/model/promotion.dart';
import 'package:flutter/foundation.dart';

class PromotionProvider with ChangeNotifier {
  List<Promotion> promotions = [
    // Promotion(name: "ร้าน dmi",ownerId: ,memberId: [])
  ];

  // ดึงข้อมูล
  List<Promotion> getPromotion(){
    return promotions;
  }

  void initData() async{
    var db = PromotionDB(dbName: "collecting.db");
    // ดึงข้อมูลมาแสดงผล
    promotions = await db.loadAllData();
    notifyListeners();
  }

  // เพิ่มข้อมูล
  Future<void> addPromotion(Promotion statement) async {
    var db = PromotionDB(dbName: "collecting.db");

    // บันทึกข้อมูล
    await db.insertData(statement);

    // ดึงข้อมูลมาแสดงผล
    promotions = await db.loadAllData();

    // บันทึกข้อมูล provider
    // users.add(statement);

    // แจ้งเตือน Consumer
    notifyListeners();
  }



}