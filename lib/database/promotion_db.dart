import 'dart:io';

import 'package:collecting_points/model/collect.dart';
import 'package:collecting_points/model/organization.dart';
import 'package:collecting_points/model/promotion.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class PromotionDB {
  // บริการเกี่ยวกันฐานข้อมูล

  String? dbName;

  // ถูกสร้างแล้ว ? เปิด : สร้าง
  PromotionDB({this.dbName});

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
  Future<int> insertData(Promotion statement) async {
    // ฐานข้อมูล => Store
    // collecting.db => users
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store("promotions");

    //json
    var keyID = store.add(
      db,
      {
        "ogId": statement.ogId,
        "name": statement.proName,
        "targetPoint": statement.targetPoint,
        "collectList": statement.collectId,
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
  Future<List<Promotion>> loadAllData() async {
    var db = await this.openDatabase();
    var store = intMapStoreFactory.store("promotions");
    var snapshot = await store.find(db,
        finder: Finder(sortOrders: [SortOrder(Field.key, false)]));
    List<Promotion> promotionList = <Promotion>[];

    // ดึงข้อมูลทีละ document
    for (var record in snapshot) {
      promotionList.add(
        Promotion(
          ogId: record["ogId"] as String,
          proName: record["name"] as String,
          targetPoint: record["targetPoint"] as int,
          collectId: record["collectLost"] as List<String>?,
        ),
      );
    }
    return promotionList;
  }
}
// sortOrders
// false = หลัง ไป หน้า
