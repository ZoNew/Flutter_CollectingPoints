import 'package:collecting_points/database/user_db.dart';
import 'package:collecting_points/model/user.dart';
import 'package:flutter/foundation.dart';

class UserProvider with ChangeNotifier {
  List<User> users = [/*
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

    //แปลง Obj to Json (1)
    // json = exchangeRateToJson(statement)

    //ส่งให้ api (2)
    // json
    // Url
    // http.pose(Url)

    //ดึงข้อมูลจาก api (3)
    //var response = await http.get(url);
    // _dataFromAPI = exchangeRateFromJson(response.body);

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
