import 'package:collecting_points/database/organization_db.dart';
import 'package:collecting_points/model/organization.dart';
import 'package:flutter/foundation.dart';

class OrganizationProvider with ChangeNotifier {
  List<Organization> organizations = [
    // Organization(name: "ร้าน dmi",ownerId: ,memberId: [])
  ];

  // ดึงข้อมูล
  List<Organization> getOrganization(){
    return organizations;
  }

  void initData() async{
    var db = OrganizationDB(dbName: "collecting.db");
    // ดึงข้อมูลมาแสดงผล
    organizations = await db.loadAllData();
    notifyListeners();
  }

  // เพิ่มข้อมูล
  Future<void> addOrganization(Organization statement) async {
    var db = OrganizationDB(dbName: "collecting.db");

    // บันทึกข้อมูล
    await db.insertData(statement);

    // ดึงข้อมูลมาแสดงผล
    organizations = await db.loadAllData();

    // บันทึกข้อมูล provider
    // users.add(statement);

    // แจ้งเตือน Consumer
    notifyListeners();
  }



}