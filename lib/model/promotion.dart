import 'package:collecting_points/model/collect.dart';
import 'package:collecting_points/model/organization.dart';

// To parse this JSON data, do
//
//     final promotion = promotionFromJson(jsonString);

import 'dart:convert';

List<Promotion> promotionFromJson(String str) => List<Promotion>.from(json.decode(str).map((x) => Promotion.fromJson(x)));

String promotionToJson(List<Promotion> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Promotion {
  Promotion({
    this.id,
    this.collectId,
    this.proName,
    this.targetPoint,
    this.ogId,
  });

  String? id;
  List<String>? collectId;
  String? proName;
  int? targetPoint;
  String? ogId;

  factory Promotion.fromJson(Map<String, dynamic> json) => Promotion(
    id: json["_id"] == null ? null : json["_id"],
    collectId: json["collect_ID"] == null ? null : List<String>.from(json["collect_ID"].map((x) => x)),
    proName: json["pro_name"] == null ? null : json["pro_name"],
    targetPoint: json["target_point"] == null ? null : json["target_point"],
    ogId: json["og_ID"] == null ? null : json["og_ID"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id == null ? null : id,
    "collect_ID": collectId == null ? null : List<dynamic>.from(collectId!.map((x) => x)),
    "pro_name": proName == null ? null : proName,
    "target_point": targetPoint == null ? null : targetPoint,
    "og_ID": ogId == null ? null : ogId,
  };
}
