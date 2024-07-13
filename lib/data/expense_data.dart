import 'package:flutter/material.dart';
import 'package:myapp/data/hive_database.dart';
import 'package:myapp/dateTime/date_time_healper.dart';
import 'package:myapp/models/expense_item.dart';

class ExpenseData extends ChangeNotifier {
  //List of all expenses
  List<ExpenseItem> overallExpenseList = [];

  //get expense list
  List<ExpenseItem> getAllExpenseList() {
    return overallExpenseList;
  }

//prepare to display data
  final db = HiveDataBase();
  void prepareData() {
    //if data exist in Hive database, get it
    if (db.readData().isNotEmpty) {
      overallExpenseList = db.readData();
    }
  }

  //delete all data from class and database
  void deleteAllData() {
    overallExpenseList.clear();
    db.deleteAllData();
    notifyListeners();
  }

  //add new expense
  void addExpense(ExpenseItem newExpense) {
    overallExpenseList.add(newExpense);
    notifyListeners();
    overallExpenseList.sort((a, b) => b.datetime.compareTo(a.datetime));
    db.saveDate(overallExpenseList);
  }

  //delete expense

  void deleteExpense(ExpenseItem expense) {
    overallExpenseList.remove(expense);
    notifyListeners();
    overallExpenseList.sort((a, b) => b.datetime.compareTo(a.datetime));
    db.saveDate(overallExpenseList);
  }

  // get day from datetime object

  String getDay(DateTime datetime) {
    return datetime.toString().split(" ")[0];
  }

  //date for the start of week

  DateTime startOfWeek() {
    DateTime now = DateTime.now();
    return now.subtract(Duration(days: now.weekday));
  }

  /*
   
    convert overall expenses into daily expense summary

    overallExpenseList = [
      [food, 12/12/2024, $150],
      [recharge, 13/12/2024, $190],
      [travel, 13/12/2024, $150],
      [food, 15/12/2024, $150],
      [recharge, 16/12/2024, $190],
      [travel, 19/12/2024, $150],

    ]
-> 
   dailyExpenseSummary = [
    [12 12 2024: $150]
    [13 12 2024: $340]
    [15 12 2024: $150]
    [16 12 2024: $190]
    [19 12 2024: $150]
    ] 
   */

  Map<String, double> calculateDailyExpenseSummary() {
    Map<String, double> dailyExpenseSummary = {};

    for (var expense in overallExpenseList) {
      String date = convertDateTimeToString(expense.datetime);
      double amount = double.parse(expense.amount); // Corrected typo

      // if (dailyExpenseSummary.containsKey(date)) {
      double currentAmount = dailyExpenseSummary[date] ?? 0;
      if (expense.type == "Expense") {
        currentAmount += amount;
        dailyExpenseSummary[date] = currentAmount;
      }
      // }
      // else {
      //   dailyExpenseSummary.addAll({date: amount});
      // }
    }

    return dailyExpenseSummary;
  }

  String getCrruntBalance() {
    double crruntBalance = 0;
    //Sum of the ammount of all expensed
    for (var expanse in overallExpenseList) {
      if (expanse.type == "Income") {
        crruntBalance += double.parse(expanse.amount);
      } else {
        crruntBalance -= double.parse(expanse.amount);
      }
    }
    return crruntBalance.toString();
  }
}
