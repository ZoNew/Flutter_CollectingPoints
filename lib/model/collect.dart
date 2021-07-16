
import 'package:collecting_points/model/collect_unit.dart';
import 'package:collecting_points/model/organization.dart';

class Collect {
  String? name;
  Organization? ogId;
  int? rewardPoint;
  CollectUnit? collectUnitId;
  String? unitName;
  int? price;

  Collect({this.name,this.ogId, this.rewardPoint,this.collectUnitId,this.unitName, this.price}) {
    rewardPoint = 0;
    price = 0;
  }


}