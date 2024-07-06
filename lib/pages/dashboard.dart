import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/pages/analytics.dart';
import 'package:myapp/pages/home_page.dart';
import 'package:myapp/pages/tools.dart';
import 'package:myapp/pages/transactions.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});
// int val;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationControler());

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          elevation: 0,
          selectedIndex: controller.slectedIndex.value,
          onDestinationSelected: (int index) =>
              controller.slectedIndex.value = index,
          destinations: [
            NavigationDestination(
                icon: Icon(CupertinoIcons.home), label: 'Home'),
            NavigationDestination(
                icon: Icon(CupertinoIcons.arrow_right_arrow_left),
                label: 'Transactions'),
            NavigationDestination(
                icon: Icon(CupertinoIcons.chart_pie), label: 'Analytics'),
            NavigationDestination(
                icon: Icon(CupertinoIcons.layers), label: 'Tools'),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.slectedIndex.value]),
    );
  }
}

class NavigationControler extends GetxController {
  final Rx<int> slectedIndex = 0.obs;
  final screens = [
    myHomePage(),
    allTransactions(),
    Analytics(),
    Tools(),
  ];
}
