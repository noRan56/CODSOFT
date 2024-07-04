import 'package:flutter/material.dart';
import 'package:tracker/constants/Colors.dart';

class FundCondition extends StatelessWidget {
  final String type;
  final String amount;
  final String icon;

  const FundCondition(
      {super.key,
      required this.type,
      required this.amount,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(blurRadius: 2.5, color: MyColor.myblue),
          ],
          color: MyColor.myWhite,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Row(
        children: [
          SizedBox(
            height: 25,
            width: 25,
            child: Image.asset("assets/icon/$icon.png"),
          ),
          SizedBox(
            width: 13,
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              type,
              style: TextStyle(
                  color: MyColor.myGrey,
                  fontWeight: FontWeight.bold,
                  fontSize: 12),
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: 4,
            ),
            Padding(
              padding: EdgeInsets.only(left: 0.5),
              child: Text(
                "\$$amount",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: MyColor.myGreen),
                overflow: TextOverflow.ellipsis,
              ),
            )
          ])
        ],
      ),
    );
  }
}
