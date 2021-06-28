import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Collect {
  String? name;
  int? rewardPoint;
  String? collectUnit;
  int? price;

  Collect({this.name, this.rewardPoint, this.price}) {
    rewardPoint = 0;
    price = 0;
  }


}