import 'package:flutter/material.dart';
import 'data/expense_data.dart';
// import 'package:myapp/data/navigation.dart';
import 'package:provider/provider.dart';
import 'pages/dashboard.dart';
import 'package:hive_flutter/hive_flutter.dart';

const Color redExpenseColor = Color(0xFFFF8585);
const Color greenIncomeColor = Color(0xFF4E9B51);
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
          primaryColor: Color(0xff6A78FA),
          scaffoldBackgroundColor: Color(0xFFF3F3F3),
        ),

        debugShowCheckedModeBanner: false,
        home: Dashboard(),
        // home: NavigationMenu(),
      ),
    );
  }
}
