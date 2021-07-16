import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class CollectBox extends StatelessWidget {
  String name;
  int rewardPoint;
  String unitName;

  CollectBox(this.name, this.rewardPoint, this.unitName);

  @override
  Widget build(BuildContext context) {
    String _rewardPoint = NumberFormat("#,###").format(rewardPoint);

    return GestureDetector(
      onTap: (){
        Fluttertoast.showToast(msg: "Disable");
      },
      child: Container(
        margin: const EdgeInsets.only(bottom:10),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        height: 80,
        child: Row(
          children: [
            Text(
              name,
              style: TextStyle(
                fontSize: 25,
                // color: Colors.white,
                // fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    _rewardPoint,
                    //'$numberDisplay / $numberDisplay',
                    //'${NumberFormat("#,###").format(amount)} / ${NumberFormat("#,###").format(amount)}',
                    style: TextStyle(
                        fontSize: 50,
                        // color: Colors.white,
                        // fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(unitName,textAlign: TextAlign.end),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}