import 'package:collecting_points/database/collect_unit_db.dart';
import 'package:collecting_points/model/collect_unit.dart';
import 'package:flutter/foundation.dart';

class CollectUnitProvider with ChangeNotifier {
  List<CollectUnit> collectUnits = [
    // Collect(name: "ร้าน dmi",ownerId: ,memberId: [])
  ];

  // ดึงข้อมูล
  List<CollectUnit> getCollectUnit(){
    return collectUnits;
  }

  void initData() async{
    var db = CollectUnitDB(dbName: "collecting.db");
    // ดึงข้อมูลมาแสดงผล
    collectUnits = await db.loadAllData();
    notifyListeners();
  }

  // เพิ่มข้อมูล
  Future<void> addCollectUnit(CollectUnit statement) async {
    var db = CollectUnitDB(dbName: "collecting.db");

    // บันทึกข้อมูล
    await db.insertData(statement);

    // ดึงข้อมูลมาแสดงผล
    collectUnits = await db.loadAllData();

    // บันทึกข้อมูล provider
    // users.add(statement);

    // แจ้งเตือน Consumer
    notifyListeners();
  }



}