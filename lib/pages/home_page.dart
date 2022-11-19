import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myexpenessapp/controllers/expanse_controller.dart';
import 'package:myexpenessapp/widgets/home_page_top.dart';
import 'package:myexpenessapp/widgets/expanse_list.dart';
import 'package:myexpenessapp/widgets/income_list.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final ExpanseController ec = Get.put(ExpanseController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomePageTop(),
            const SizedBox(height: 30),
            ExpanseList(),
            IncomesList(),
          ],
        ),
      ),
    );
  }
}
