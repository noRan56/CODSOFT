import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:tracker/constants/Colors.dart';
import 'package:tracker/dataLogic/model/expense_model.dart';
import 'package:tracker/presentation/Widgets/fund_widget.dart';
import 'package:tracker/presentation/Widgets/item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePage();
}

List items = [
  ExpenseModel(
      item: "LapTop", amount: 1000, date: DateTime.now(), isIncome: true)
];
List<String> Choice = ['expense', 'income'];

class _HomePage extends State<HomePage> {
  final itemController = TextEditingController();
  final amountController = TextEditingController();
  final dataController = TextEditingController();
  String initialOptions = Choice[0];
  DateTime? pickedDate;
  int deposit = 0;
  int spentMoney = 0;
  int income = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense Tracker"),
        backgroundColor: MyColor.myRed,
        centerTitle: true,
        elevation: 0,
      ),
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        foregroundColor: MyColor.myWhite,
        backgroundColor: MyColor.myRed,
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return SizedBox(
                  height: 500,
                  child: AlertDialog(
                    title: Text(
                      "ADD Transaction",
                      style: TextStyle(
                          color: MyColor.myRed,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            int conAmount = int.parse(amountController.text);
                            final expenseModel = ExpenseModel(
                                item: itemController.text,
                                amount: conAmount,
                                date: pickedDate!,
                                isIncome: initialOptions == 'income');
                            items.add(expenseModel);
                            if (expenseModel.isIncome) {
                              income += expenseModel.amount;
                              deposit += expenseModel.amount;
                            } else {
                              spentMoney += expenseModel.amount;
                              deposit -= expenseModel.amount;
                            }
                            setState(() {});
                            Navigator.pop(context);
                            itemController.clear();
                            amountController.clear();
                            dataController.clear();
                          },
                          child: Text(
                            'ADD',
                            style: TextStyle(color: MyColor.myRed),
                          )),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'CANCEL',
                          style: TextStyle(color: MyColor.myRed),
                        ),
                      ),
                    ],
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          controller: itemController,
                          decoration: InputDecoration(
                            hintText: "Enter the Item",
                            focusedBorder: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(color: MyColor.myRed)),
                          ),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          cursorColor: MyColor.myRed,
                          controller: amountController,
                          decoration: InputDecoration(
                              hintText: "Enter the Amount",
                              focusedBorder: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              )),
                        ),
                        SizedBox(height: 10),
                        TextField(
                          onTap: () async {
                            pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2100));
                            String convertedDate =
                                DateFormat.yMMMMd().format(pickedDate!);
                            dataController.text = convertedDate;
                            setState(() {});
                          },
                          controller: dataController,
                          readOnly: true,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.calendar_today),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                color: MyColor.myGrey,
                                style: BorderStyle.solid,
                              )),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      BorderSide(color: MyColor.myRed))),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            RadioMenuButton(
                                value: Choice[0],
                                groupValue: initialOptions,
                                onChanged: (expense) {
                                  setState(() {
                                    initialOptions = expense.toString();
                                  });
                                },
                                child: Text("Expense")),
                            RadioMenuButton(
                                value: Choice[1],
                                groupValue: initialOptions,
                                onChanged: (income) {
                                  setState(() {
                                    initialOptions = income.toString();
                                  });
                                },
                                child: Text("Income"))
                          ],
                        )
                      ],
                    ),
                  ),
                );
              });
        },
        child: Icon(Icons.add),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SingleChildScrollView(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.only(left: 2, right: 2),
                      child: FundCondition(
                          type: "DEPOSIT", amount: "$deposit", icon: "blue"),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.only(left: 2),
                      child: FundCondition(
                          type: "EXPENSE",
                          amount: "$spentMoney",
                          icon: "orange"),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.only(left: 4, right: 2),
                      child: FundCondition(
                          type: "INCOME", amount: "$income", icon: "grey"),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Confirm to Delete the Item?"),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      ExpenseModel eM = items[index];
                                      if (eM.isIncome) {
                                        income -= eM.amount;
                                        deposit -= eM.amount;
                                      } else {
                                        spentMoney -= eM.amount;
                                        deposit += eM.amount;
                                      }
                                      setState(() {
                                        items.removeAt(index);
                                      });
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      "DELETE",
                                      style: TextStyle(color: MyColor.myRed),
                                    )),
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      "CANCEL",
                                      style: TextStyle(color: MyColor.myRed),
                                    ))
                              ],
                            );
                          });
                    },
                    child: SingleChildScrollView(
                        child: Items(expenseModel: items[index])),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
