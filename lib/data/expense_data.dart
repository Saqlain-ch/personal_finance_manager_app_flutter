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

  void deleteExpense(ExpenseItem expense, context) {
    overallExpenseList.remove(expense);
    overallExpenseList.sort((a, b) => b.datetime.compareTo(a.datetime));
    db.saveDate(overallExpenseList);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Transaction deleted.'),
        duration: Duration(seconds: 3),
      ),
    );
    notifyListeners();
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

  // calculate all this month expense which are with expense.type =="Expense"
  String getThisMothExpense() {
    double thisMonthExpense = 0;
    for (var expanse in overallExpenseList) {
      if (expanse.type == "Expense" &&
          expanse.datetime.month == DateTime.now().month) {
        thisMonthExpense += double.parse(expanse.amount);
      }
    }
    // convert thisMonthExpense to two desimals only
    thisMonthExpense = double.parse(thisMonthExpense.toStringAsFixed(2));
    return thisMonthExpense.toString();
  }

  // calculate all this month Income which are with expense.type =="Inocome"
  String getThisMonthIncome() {
    double thisMonthIncome = 0;
    for (var expanse in overallExpenseList) {
      print("for run for ${expanse.amount}");
      if (expanse.type == "Income" &&
          expanse.datetime.month == DateTime.now().month) {
        thisMonthIncome += double.parse(expanse.amount);
        print("if run for ${expanse.amount}");
      }
    }
    //convert this month income to two desimals only
    thisMonthIncome = double.parse(thisMonthIncome.toStringAsFixed(2));

    return thisMonthIncome.toString();
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
    //convert crrunt balance to two desimals only
    crruntBalance = double.parse(crruntBalance.toStringAsFixed(2));
    return crruntBalance.toString();
  }
}
