import 'package:hive_flutter/hive_flutter.dart';
import 'package:myapp/models/expense_item.dart';

class HiveDataBase{
  //reference our box
   final _myBox = Hive.box("expense_database");
  //delete all data from database

  void deleteAllData(){
    _myBox.clear();
  }
   //write data
  void saveDate(List<ExpenseItem> allExpenses) {
    List<List<dynamic>> allExpensesFormated = [];
    for (var expense in allExpenses){
       List<dynamic> ExpensesFormated=[
        expense.name,
        expense.amount,
        expense.type,
        expense.datetime,
       ];
       allExpensesFormated.add(ExpensesFormated);
    }

    _myBox.put("All_EXPENSES", allExpensesFormated);
  }



   //read data 

   List<ExpenseItem> readData(){
     List savedExpenses = _myBox.get("All_EXPENSES") ?? [];
     List<ExpenseItem> allExpenses = [];
    for(int i=0; i<savedExpenses.length; i++){
      String name = savedExpenses[i][0];
      String amount = savedExpenses[i][1];
      String type = savedExpenses[i][2];
      DateTime datetime = savedExpenses[i][3];
      ExpenseItem expense = ExpenseItem(name: name, amount: amount, type: type, datetime: datetime);
      allExpenses.add(expense); 
    }
    return allExpenses;
   }
}