import 'package:collecting_points/model/collect.dart';
import 'package:collecting_points/model/organization.dart';

class Promotion{
  Organization? ogId;
  String? name;
  int? targetPoint;
  List<Collect>? collectList;

  Promotion({this.ogId,this.name,this.targetPoint,this.collectList});

}