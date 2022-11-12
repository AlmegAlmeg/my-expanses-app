import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myexpenessapp/config/colors.dart';
import 'package:myexpenessapp/config/font_sizes.dart';
import 'package:myexpenessapp/controllers/expanse_controller.dart';
import 'package:myexpenessapp/widgets/customs/custom_text.dart';
import 'package:myexpenessapp/widgets/home_page_top.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final ExpanseController ec = Get.put(ExpanseController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        elevation: 0,
        // title: const CustomText(text: "ההוצאות שלי"),
        // centerTitle: true,
        // leading: CustomButton(
        //   child: const Icon(Icons.add),
        //   func: () => Get.bottomSheet(const AddInfoDialog()),
        // ),
      ),
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomePageTop(),
            Obx(() {
              return ListView.builder(
                itemCount: ec.expanses.length,
                shrinkWrap: true,
                itemBuilder: ((context, i) {
                  return ListTile(
                    title: CustomText(text: ec.expanses[i].info, fontSize: FontSizes.text18),
                    trailing: CustomText(text: "₪${ec.expanses[i].price}", fontSize: FontSizes.text18),
                    leading: CircleAvatar(
                      backgroundColor: primary,
                      child: const Icon(Icons.money_off, color: white),
                    ),
                  );
                }),
              );
            }),
          ],
        ),
      ),
    );
  }
}
