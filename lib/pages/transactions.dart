import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/main.dart';
import '../data/expense_data.dart';
import 'package:provider/provider.dart';
import '../dateTime/date_time_healper.dart';

class allTransactions extends StatefulWidget {
  const allTransactions({super.key});

  @override
  State<allTransactions> createState() => _allTransactionsState();
}

class _allTransactionsState extends State<allTransactions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "All Transactions",
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [_allTransactionBox()],
          ),
        ),
      ),
    );
  }
}

Widget _allTransactionBox() {
  return Consumer<ExpenseData>(builder: (context, value, _) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: getTranactions(
              name: value.getAllExpenseList()[index].name.toString(),
              type: value.getAllExpenseList()[index].type,
              datetime: value.getAllExpenseList()[index].datetime,
              amount: value.getAllExpenseList()[index].amount,
            )),
        itemCount: value.getAllExpenseList().length,
      ),
    );
  });
}

class getTranactions extends StatelessWidget {
  final String name;
  final String type;
  final DateTime datetime;
  final String amount;
  // void Function(BuildContext)? deleteTapped;
  // final int maxTransactions;
  getTranactions({
    super.key,
    required this.name,
    required this.type,
    required this.datetime,
    required this.amount,
    // required this.deleteTapped,
  });
  @override
  Widget build(BuildContext context) {
    return
        // Slidable(
        //   endActionPane: ActionPane(
        //     motion: const StretchMotion(),
        //     children: [
        //       onPressed:deleteTapped,
        //       icon: Icons.delete,
        //       color: Colors.red,
        //       label: "Delete",
        //     ]
        //     ),
        //   child:
        ListTile(
      leading: CircleAvatar(
        backgroundColor: type == "Income"
            ? greenIncomeColor
            : redExpenseColor,
        child: Icon(
          type == "Income"
              ? CupertinoIcons.arrow_down_left
              : CupertinoIcons.arrow_up_right,
          color: Colors.white,
        ),
      ),
      title: Text(name),
      subtitle: Text(dateToMMDD(datetime).toString() + " - " + type),
      trailing: Text(
        amount,
        style: const TextStyle(fontSize: 18),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      tileColor: Color.fromARGB(172, 230, 230, 230),
      // ),
    );
  }
}
