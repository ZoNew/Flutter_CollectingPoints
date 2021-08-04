import 'dart:io';

import 'package:collecting_points/model/organization.dart';
import 'package:collecting_points/model/user.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class OrganizationDB {
  // บริการเกี่ยวกันฐานข้อมูล

  String? dbName;

  // ถูกสร้างแล้ว ? เปิด : สร้าง
  OrganizationDB({this.dbName});

  Future<Database> openDatabase() async {
    // หาตำแหน่งที่เก็บข้อมูล
    Directory appDirectory = await getApplicationDocumentsDirectory();
    String dbLocation = join(appDirectory.path, dbName);

    // create database
    DatabaseFactory dbFactory = databaseFactoryIo;
    Database db = await dbFactory.openDatabase(dbLocation);

    return db;
  }

  // บันทึกข้อมูล
  Future<int> insertData(Organization statement) async {
    // ฐานข้อมูล => Store
    // collecting.db => users
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store("organizations");

    //json
    var keyID = store.add(
      db,
      {
        "name": statement.ogName,
        "owner": statement.ownerId,
        "memberList": statement.memberId,
      },
    );
    db.close();
    return keyID; // 1,2,3,...
  }

// join ใช้ต่อ String
// Example
// appDirectory.path = C:users/Nitikarn
// dbName            = transaction.db
// dbLocation        = C:users/Nitikarn/transaction.db

  // ดึงข้อมูล
  Future<List<Organization>> loadAllData() async {
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store("organizations");
    var snapshot = await store.find(db,
        finder: Finder(sortOrders: [SortOrder(Field.key, false)]));
    List<Organization> organizationList = <Organization>[];

    // ดึงข้อมูลทีละ document
    for (var record in snapshot) {
      organizationList.add(
        Organization(
          ogName: record["name"] as String,
          ownerId: record["owner"] as String,
          memberId: record["memberList"] as   List<MemberId>,
        ),
      );
    }
    return organizationList;
  }
}
// sortOrders
// false = หลัง ไป หน้า
