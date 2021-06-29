import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PointListView extends StatelessWidget {
  int point;
  String unit;

  PointListView(this.point, this.unit){
    point = 0;
    unit = "none";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: Row(
        children: [
          Expanded(
            child: Text(
              point.toString(),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Text(
              unit,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
