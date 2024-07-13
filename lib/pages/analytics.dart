import 'package:flutter/material.dart';
import 'package:myapp/data/expense_data.dart';
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
                    Text(
                      "Last Week Expenses",
                      style: TextStyle(fontSize: 20),
                    ),
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
