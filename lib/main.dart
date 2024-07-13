import 'package:flutter/material.dart';
import 'data/expense_data.dart';
// import 'package:myapp/data/navigation.dart';
import 'package:provider/provider.dart';
import 'pages/dashboard.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  //initialize hide
  await Hive.initFlutter();
  //open a hive box
  await Hive.openBox("expense_database");

  runApp(const StartHome());
}

class StartHome extends StatelessWidget {
  const StartHome({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ExpenseData(),
      builder: (context, child) => MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.blue[900],
          scaffoldBackgroundColor:
              Color(const Color.fromARGB(255, 243, 243, 243).value),
        ),
        debugShowCheckedModeBanner: false,
        home: Dashboard(),
        // home: NavigationMenu(),
      ),
    );
  }
}
