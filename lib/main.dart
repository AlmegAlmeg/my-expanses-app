import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myexpenessapp/controllers/expanse_controller.dart';
import 'package:myexpenessapp/controllers/income_controller.dart';
import 'package:myexpenessapp/home_page.dart';
import 'package:myexpenessapp/widgets/customs/custom_scroll_behavior.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final ExpanseController ec = Get.put(ExpanseController());
  final IncomeController ic = Get.put(IncomeController());

  @override
  Widget build(BuildContext context) {
    ec.getTotalExpanses();
    ic.getTotalIncome();
    return GetMaterialApp(
      title: "Almeg's Expanses",
      scrollBehavior: CustomScrollBehavior(),
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: HomePage(),
      ),
    );
  }
}
