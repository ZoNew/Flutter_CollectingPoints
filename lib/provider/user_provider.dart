import 'package:collecting_points/database/user_db.dart';
import 'package:collecting_points/model/user.dart';
import 'package:flutter/foundation.dart';

class UserProvider with ChangeNotifier {
  List<User> users = [/*
    User(
      name: "New01",
      password: "123456",
      email: "New@aaa.bbb",
      tel: "0801111222",
      role: "og",
      usrCollect: [],
    ),
    User(
      name: "New02",
      password: "123456",
      email: "New02@aaa.bbb",
      tel: "0802222222",
      role: "usr",
      usrCollect: [],
    ),
    User(
      name: "New03",
      password: "123456",
      email: "New03@aaa.bbb",
      tel: "0803333333",
      role: "usr",
      usrCollect: [],
    ),*/
  ];

  // ดึงข้อมูล
  List<User> getUser(){
    return users;
  }

  void initData() async{
    var db = UserDB(dbName: "collecting.db");
    // ดึงข้อมูลมาแสดงผล
    users = await db.loadAllData();
    notifyListeners();
  }

  // เพิ่มข้อมูล
  void addUser(User statement) async{
    var db = UserDB(dbName: "collecting.db");

    // บันทึกข้อมูล
    await db.insertData(statement);

    // ดึงข้อมูลมาแสดงผล
    users = await db.loadAllData();

    // บันทึกข้อมูล provider
    // users.add(statement);

    // แจ้งเตือน Consumer
    notifyListeners();
  }

}
