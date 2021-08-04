import 'package:collecting_points/model/user.dart';

/*class Organization {
  String? name;
  User? ownerId;
  List<User>? memberId;

  Organization({this.name,this.ownerId,this.memberId}){
    memberId = [];
}
}*/

// To parse this JSON data, do
//
//     final organization = organizationFromJson(jsonString);

import 'dart:convert';

List<Organization> organizationFromJson(String str) => List<Organization>.from(json.decode(str).map((x) => Organization.fromJson(x)));

String organizationToJson(List<Organization> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Organization {
  Organization({
    this.id,
    this.ogName,
    this.ownerId,
    this.memberId,
  });

  String? id;
  String? ogName;
  String? ownerId;
  List<MemberId>? memberId;

  factory Organization.fromJson(Map<String, dynamic> json) => Organization(
    id: json["_id"] == null ? null : json["_id"],
    ogName: json["og_name"] == null ? null : json["og_name"],
    ownerId: json["owner_ID"] == null ? null : json["owner_ID"],
    memberId: json["member_ID"] == null ? null : List<MemberId>.from(json["member_ID"].map((x) => MemberId.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "_id": id == null ? null : id,
    "og_name": ogName == null ? null : ogName,
    "owner_ID": ownerId == null ? null : ownerId,
    "member_ID": memberId == null ? null : List<dynamic>.from(memberId!.map((x) => x.toJson())),
  };
}

class MemberId {
  MemberId({
    this.tel,
    this.usrName,
    this.point,
  });

  String? tel;
  String? usrName;
  int? point;

  factory MemberId.fromJson(Map<String, dynamic> json) => MemberId(
    tel: json["tel"] == null ? null : json["tel"],
    usrName: json["usr_name"] == null ? null : json["usr_name"],
    point: json["point"] == null ? null : json["point"],
  );

  Map<String, dynamic> toJson() => {
    "tel": tel == null ? null : tel,
    "usr_name": usrName == null ? null : usrName,
    "point": point == null ? null : point,
  };
}


