import 'package:collecting_points/model/user_collect.dart';

class User {
  String? name;
  String? password;
  String? email;
  String? tel;
  String? role;
  List<UserCollect>? usrCollect;
  User({this.name,this.password,this.email,this.tel,this.role,this.usrCollect});
}