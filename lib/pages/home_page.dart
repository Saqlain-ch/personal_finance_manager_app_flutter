import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/data/expense_data.dart';
import 'package:myapp/main.dart';
import 'package:myapp/models/expense_item.dart';
import 'package:provider/provider.dart';
import 'transactions.dart';

class myHomePage extends StatefulWidget {
  const myHomePage({super.key});

  @override
  State<myHomePage> createState() => _myHomePageState();
}

class _myHomePageState extends State<myHomePage> {
  //text controllers
  final newExpenseNameController = TextEditingController();
  final newExpenseAmmountController = TextEditingController();
  final newExpenseDateController = TextEditingController();
  final newIncomeNameController = TextEditingController();
  final newIncomeAmmountController = TextEditingController();
  final newIncomeDateController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  // add expense
  void addNewExpense(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text(
                "Add New Expense",
                style: TextStyle(fontSize: 14),
              ),
              content: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    //expense Name
                    TextFormField(
                      controller: newExpenseAmmountController,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 24),
                      decoration: const InputDecoration(
                        hintText: "Enter Amount",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Error: Amount is required';
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: 20),
                    //Expense date selector
                    TextFormField(
                      readOnly: true,
                      controller: newExpenseDateController,
                      onTap: () async {
                        // Show the date picker dialog
                        final selectedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime.now(),
                        );

                        if (selectedDate != null) {
                          // Update the text controller with the selected date
                          newExpenseDateController.text =
                              selectedDate.toString().split(" ")[0];
                        }
                      },
                      decoration: InputDecoration(
                        labelText: 'Date',
                        icon: Icon(Icons.calendar_today),
                      ),
                    ),

//Expense date selector

                    //expense Amount
                    TextFormField(
                      controller: newExpenseNameController,
                      decoration: const InputDecoration(
                        hintText: "Note",
                      ),
                      // validator: (value) {
                      //   if (value == null || value.isEmpty) {
                      //     return 'Error: Note is required';
                      //   }
                      //   return null;
                      // },
                    ),
                  ],
                ),
              ),
              actions: [
                CupertinoButton(
                  onPressed: cancel,
                  child: const Text("Cancel"),
                ),
                CupertinoButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      saveExpanse();
                    }
                  },
                  child: const Text("Save"),
                ),
              ],
            ));
  }

  //save data
  void saveExpanse() {
    ExpenseItem newExpense = ExpenseItem(
      name: newExpenseNameController.text,
      amount: newExpenseAmmountController.text,
      type: "Expense",
      datetime: newExpenseDateController.text.isEmpty
          ? DateTime.now()
          : DateTime.parse(newExpenseDateController.text),
    );
    Provider.of<ExpenseData>(context, listen: false).addExpense(newExpense);
    Navigator.of(context).pop();
    clearControler();
  }

  void addNewIncome(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text(
                "Add New Income",
                style: TextStyle(fontSize: 14),
              ),
              content: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    //income Amount
                    TextFormField(
                      controller: newIncomeAmmountController,
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 24),
                      decoration: const InputDecoration(
                        hintText: "Enter Amount",
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Error: Amount is required';
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: 20),
                    TextFormField(
                      readOnly: true,
                      controller: newIncomeDateController,
                      onTap: () async {
                        // Show the date picker dialog
                        final selectedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime.now(),
                        );

                        if (selectedDate != null) {
                          // Update the text controller with the selected date
                          newIncomeDateController.text =
                              selectedDate.toString().split(" ")[0];
                        }
                      },
                      decoration: InputDecoration(
                        labelText: 'Date',
                        icon: Icon(Icons.calendar_today),
                      ),
                    ),
                    //income Note
                    TextFormField(
                      controller: newIncomeNameController,
                      decoration: const InputDecoration(
                        hintText: "Note",
                      ),
                      // validator: (value) {
                      //   if (value == null || value.isEmpty) {
                      //     return 'Error: Note is required';
                      //   }
                      //   return null;
                      // },
                    ),
                  ],
                ),
              ),
              actions: [
                CupertinoButton(
                  onPressed: cancel,
                  child: const Text("Cancel"),
                ),
                CupertinoButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      saveIncome();
                    }
                  },
                  child: const Text("Save"),
                ),
              ],
            ));
  }

  void cancel() {
    clearControler();
    Navigator.of(context).pop();
  }

  void deleteExpense(ExpenseItem expense) {
    Provider.of<ExpenseData>(context, listen: false).deleteExpense(expense);
  }

  //save data
  void saveIncome() {
    ExpenseItem newIncome = ExpenseItem(
      name: newIncomeNameController.text,
      amount: newIncomeAmmountController.text,
      type: "Income",
      datetime: newIncomeDateController.text.isEmpty
          ? DateTime.now()
          : DateTime.parse(newIncomeDateController.text),
    );
    Provider.of<ExpenseData>(context, listen: false).addExpense(newIncome);
    Navigator.of(context).pop();
    clearControler();
  }

  void clearControler() {
    newExpenseNameController.clear();
    newExpenseAmmountController.clear();
    newExpenseDateController.clear();
    newIncomeNameController.clear();
    newIncomeAmmountController.clear();
    newIncomeDateController.clear();
  }

  @override
  void initState() {
    super.initState();
    Provider.of<ExpenseData>(context, listen: false).prepareData();
  }

  //prepare data on startup
  Widget build(BuildContext context) {
    return Consumer<ExpenseData>(
        builder: (context, value, child) => Scaffold(
              body: SafeArea(
                  child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _homeBalnceBox(context),
                    SizedBox(height: 15),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              CustomButton(
                                onPressed: () {
                                  addNewExpense(context);
                                },
                                text: 'Expense',
                                icon: Icons.arrow_upward,
                                backgroundColor: redExpenseColor,
                                width: MediaQuery.of(context).size.width / 2.4,
                              ),
                              CustomButton(
                                onPressed: () => addNewIncome(context),
                                text: 'Income',
                                icon: Icons.arrow_downward,
                                backgroundColor: greenIncomeColor,
                                width: MediaQuery.of(context).size.width / 2.4,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    Text("Recent Transactions",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400)),
                    // _transactionBox(),
                    allTransactionBox(maxTransactions: 35)
                    // SizedBox(height: 15),
                    // const Text("Here we are!"),
                  ],
                ),
              )),
            ));
  }
}

//______________________ BALANCE BOX ______________________

Widget _homeBalnceBox(context) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).primaryColor),
    child: Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Balance",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Icon(
                    Icons.arrow_forward_rounded,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 15),
            child: Align(
              alignment: Alignment.centerRight,
              child: Consumer<ExpenseData>(builder: (context, data, _) {
                return Text("Rs.${data.getCrruntBalance()}",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w700));
              }),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text("Savings not includded",
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                )),
          ),
        ],
      ),
    ),
  );
}

//_________________________BUTTONS___________________________

class CustomButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color backgroundColor;
  final Function() onPressed;
  final double width;

  const CustomButton({
    super.key,
    required this.text,
    required this.icon,
    required this.backgroundColor,
    required this.onPressed,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 60,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: Colors.white,
        ),
        label: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(backgroundColor),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
      ),
    );
  }
}
