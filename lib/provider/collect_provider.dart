import 'package:collecting_points/database/collect_db.dart';
import 'package:collecting_points/model/collect.dart';
import 'package:flutter/foundation.dart';

class CollectProvider with ChangeNotifier {
  List<Collect> collects = [
    // Collect(name: "ร้าน dmi",ownerId: ,memberId: [])
  ];

  // ดึงข้อมูล
  List<Collect> getCollect(){
    return collects;
  }

  void initData() async{
    var db = CollectDB(dbName: "collecting.db");
    // ดึงข้อมูลมาแสดงผล
    collects = await db.loadAllData();
    notifyListeners();
  }

  // เพิ่มข้อมูล
  Future<void> addCollect(Collect statement) async {
    var db = CollectDB(dbName: "collecting.db");

    // บันทึกข้อมูล
    await db.insertData(statement);

    // ดึงข้อมูลมาแสดงผล
    collects = await db.loadAllData();

    // บันทึกข้อมูล provider
    // users.add(statement);

    // แจ้งเตือน Consumer
    notifyListeners();
  }



}