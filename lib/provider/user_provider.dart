import 'package:collecting_points/model/user.dart';
import 'package:flutter/foundation.dart';

class UserProvider with ChangeNotifier {
  List<User> _users = [
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
    ),
  ];

  // ดึงข้อมูล
  List<User> getTransaction(){
    return _users;
  }

  // เพิ่มข้อมูล
  void addUser(User user){
    _users.add(user);
  }

}
