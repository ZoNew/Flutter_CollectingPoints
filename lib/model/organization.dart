import 'package:collecting_points/model/user.dart';

class Organization {
  String? name;
  User? ownerId;
  List<User>? memberId;

  Organization({this.name,this.ownerId,this.memberId}){
    memberId = [];
}
}