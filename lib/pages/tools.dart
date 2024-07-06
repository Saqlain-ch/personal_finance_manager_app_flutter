import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:myapp/data/expense_data.dart';
import 'package:provider/provider.dart';

class Tools extends StatelessWidget {
  const Tools({super.key});

  void deleteData(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Delete all data"),
              content: Text("Are you sure you want to delete all data?"),
              actions: [
                CupertinoButton(
                  onPressed: () => delete(context),
                  child: const Text(
                    "Delete",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                CupertinoButton(
                  onPressed: () => cancel(context),
                  child: const Text("Cancel"),
                )
              ],
            ));
  }

  void cancel(BuildContext context) {
    Navigator.of(context).pop();
  }

  void delete(BuildContext context) {
    Provider.of<ExpenseData>(context, listen: false).deleteAllData();
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('All data deleted permanently.'),
        duration: Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tools",
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ListTile(
              onTap: () {
                deleteData(context);
              },
              leading: Icon(CupertinoIcons.delete),
              title: Text(
                "Delete all data.",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              tileColor: Color.fromARGB(172, 230, 230, 230),
            ),
          ],
        ),
      ),
    );
  }
}
