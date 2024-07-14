//expense summary for a week in graph
import 'package:flutter/cupertino.dart';
import 'package:myapp/bar%20graph/bar_graph.dart';
import 'package:myapp/data/expense_data.dart';
import 'package:myapp/dateTime/date_time_healper.dart';
import 'package:provider/provider.dart';

class ExpenseSummary extends StatelessWidget {
  final DateTime StartOfWeek;
  const ExpenseSummary({super.key, required this.StartOfWeek});
  // Calculate max ammount in this week
  double CalculatedMax(
    ExpenseData value,
    String sunday,
    String monday,
    String tuesday,
    String wednesday,
    String thursday,
    String friday,
    String saturday,
  ) {
    double? max = 100;
    List<double> values = [
      value.calculateDailyExpenseSummary()[sunday] ?? 0,
      value.calculateDailyExpenseSummary()[monday] ?? 0,
      value.calculateDailyExpenseSummary()[tuesday] ?? 0,
      value.calculateDailyExpenseSummary()[wednesday] ?? 0,
      value.calculateDailyExpenseSummary()[thursday] ?? 0,
      value.calculateDailyExpenseSummary()[friday] ?? 0,
      value.calculateDailyExpenseSummary()[saturday] ?? 0,
    ];
    values.sort();
    max = values.last * 1.0;

    return max == 0 ? 100 : max;
  }

  @override
  Widget build(BuildContext context) {
    //week days to string
    String sunday = convertDateTimeToString(StartOfWeek.add(Duration(days: 0)));
    String monday = convertDateTimeToString(StartOfWeek.add(Duration(days: 1)));
    String tuesday =
        convertDateTimeToString(StartOfWeek.add(Duration(days: 2)));
    String wednesday =
        convertDateTimeToString(StartOfWeek.add(Duration(days: 3)));
    String thursday =
        convertDateTimeToString(StartOfWeek.add(Duration(days: 4)));
    String friday = convertDateTimeToString(StartOfWeek.add(Duration(days: 5)));
    String saturday =
        convertDateTimeToString(StartOfWeek.add(Duration(days: 6)));

    return Consumer<ExpenseData>(
      builder: (context, value, chaild) => SizedBox(
        height: 200,
        child: MyBarGraph(
          maxY: CalculatedMax(value, sunday, monday, tuesday, wednesday,
              thursday, friday, saturday),
          sunAmount: value.calculateDailyExpenseSummary()[sunday] ?? 0,
          monAmount: value.calculateDailyExpenseSummary()[monday] ?? 0,
          tueAmount: value.calculateDailyExpenseSummary()[tuesday] ?? 0,
          wedAmount: value.calculateDailyExpenseSummary()[wednesday] ?? 0,
          thuAmount: value.calculateDailyExpenseSummary()[thursday] ?? 0,
          friAmount: value.calculateDailyExpenseSummary()[friday] ?? 0,
          satAmount: value.calculateDailyExpenseSummary()[saturday] ?? 0,
        ),
      ),
    );
  }
}
