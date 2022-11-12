import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myexpenessapp/config/colors.dart';
import 'package:myexpenessapp/config/font_sizes.dart';
import 'package:myexpenessapp/controllers/expanse_controller.dart';
import 'package:myexpenessapp/widgets/customs/custom_text.dart';
import 'package:myexpenessapp/widgets/home_page_top.dart';
import 'package:myexpenessapp/widgets/income_list.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final ExpanseController ec = Get.put(ExpanseController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: primary, elevation: 0),
      backgroundColor: white,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomePageTop(),
            IncomeList(),
          ],
        ),
      ),
    );
  }
}
