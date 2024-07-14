import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/data/expense_data.dart';
import 'package:myapp/main.dart';
import 'package:myapp/pages/expense_summary.dart';
import 'package:provider/provider.dart';

class Analytics extends StatelessWidget {
  const Analytics({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ExpenseData>(
        builder: (context, value, child) => Scaffold(
            appBar: AppBar(
              title: Text(
                "Analytics",
                style: TextStyle(fontSize: 20),
              ),
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  children: [
                    // thisMonthIncomeAndExpense(),
                    Text(
                      "Last Week Expenses",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.black87),
                    ),
                    SizedBox(height: 15),
                    SizedBox(
                        height: 200,
                        child:
                            ExpenseSummary(StartOfWeek: value.startOfWeek())),
                    SizedBox(height: 15),
                  ],
                ),
              ),
            )));
  }
}

String income = ExpenseData().getThisMonthIncome();
String expense = "500";
//widget to get to display this month total expense
Widget thisMonthIncomeAndExpense() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "This month so far ",
        textAlign: TextAlign.left,
        style: TextStyle(fontSize: 24),
      ),
      ListTile(
        leading: CircleAvatar(
          backgroundColor: greenIncomeColor,
          child: Icon(
            CupertinoIcons.arrow_down_left,
            color: Colors.white,
          ),
        ),
        title: Text("Income"),
        // subtitle: Text(dateToMMDD(datetime).toString() + " - " + type),
        trailing: Text(
          "Rs. ${income}",
          style: const TextStyle(fontSize: 18),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        tileColor: Color.fromARGB(172, 230, 230, 230),
        // ),
      )
    ],
  );
}
