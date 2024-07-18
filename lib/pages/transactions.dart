import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/main.dart';
import 'package:myapp/models/amount_healper.dart';
import '../data/expense_data.dart';
import 'package:provider/provider.dart';
import '../dateTime/date_time_healper.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

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
            children: [allTransactionBox()],
          ),
        ),
      ),
    );
  }
}

Widget allTransactionBox({int? maxTransactions}) {
  return Consumer<ExpenseData>(builder: (context, value, _) {
    int length = maxTransactions != null
        ? (maxTransactions > value.getAllExpenseList().length
            ? value.getAllExpenseList().length
            : maxTransactions)
        : value.getAllExpenseList().length;

    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) {
          // if (maxTransactions != null && index >= maxTransactions) {
          //   return const SizedBox.shrink();
          // }
          return Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: getTranactions(
              name: value.getAllExpenseList()[index].name.toString(),
              type: value.getAllExpenseList()[index].type,
              datetime: value.getAllExpenseList()[index].datetime,
              amount: value.getAllExpenseList()[index].amount,
              deleteTapped: (p0) =>
                  value.deleteExpense(value.getAllExpenseList()[index], context),
            ),
          );
        },
        itemCount: length,
      ),
    );
  });
}

// ignore: must_be_immutable
class getTranactions extends StatelessWidget {
  final String name;
  final String type;
  final DateTime datetime;
  final String amount;
  void Function(BuildContext)? deleteTapped;
  getTranactions({
    super.key,
    required this.name,
    required this.type,
    required this.datetime,
    required this.amount,
    required this.deleteTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(motion: const StretchMotion(), children: [
        //Edit button just use Need backend configrations
        // SlidableAction(
        //   borderRadius: BorderRadius.circular(5),
        //   onPressed: deleteTapped,
        //   icon: CupertinoIcons.create_solid,
        //   autoClose: true,
        //   // backgroundColor: redExpenseColor,
        //   label: "Edit",
        // ),
        SlidableAction(
          borderRadius: BorderRadius.circular(5),
          onPressed: deleteTapped,
          autoClose: true,
          icon: CupertinoIcons.trash,
          backgroundColor: redExpenseColor,
          // Color: Colors.red,
          label: "Delete",
        ),
      ]),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor:
              type == "Income" ? greenIncomeColor : redExpenseColor,
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
         formatAmount(amount),
          style: const TextStyle(fontSize: 18),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        tileColor: Color.fromARGB(172, 230, 230, 230),
      ),
    );
  }
}
