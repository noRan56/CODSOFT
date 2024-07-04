import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tracker/constants/Colors.dart';
import 'package:tracker/dataLogic/model/expense_model.dart';

class Items extends StatelessWidget {
  final ExpenseModel expenseModel;
  const Items({super.key, required this.expenseModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, bottom: 3.3),
      child: Container(
          decoration: BoxDecoration(
              color: MyColor.myWhite,
              borderRadius: BorderRadius.all(Radius.circular(14)),
              boxShadow: [
                BoxShadow(
                  blurRadius: 4.1,
                )
              ]),
          child: Card(
            child: Row(
              children: [
                SizedBox(
                  height: 26,
                  width: 26,
                  child: Image.asset(
                    expenseModel.isIncome
                        ? "assets/img/income.png"
                        : "assets/img/expense.png",
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    Text(
                      expenseModel.item,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      DateFormat.yMMMMd().format(expenseModel.date),
                      style: TextStyle(
                        color: MyColor.myblue,
                      ),
                    )
                  ],
                ),
                Spacer(),
                Text(
                  "\$${expenseModel.amount}",
                  style: TextStyle(
                      color: expenseModel.isIncome
                          ? MyColor.myGreen
                          : MyColor.myRed,
                      fontSize: 22),
                )
              ],
            ),
          )),
    );
  }
}
