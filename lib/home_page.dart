import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myexpenessapp/config/colors.dart';
import 'package:myexpenessapp/config/font_sizes.dart';
import 'package:myexpenessapp/controllers/expanse_controller.dart';
import 'package:myexpenessapp/widgets/add_info_dialog.dart';
import 'package:myexpenessapp/widgets/customs/custom_button.dart';
import 'package:myexpenessapp/widgets/customs/custom_text.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final ExpanseController ec = Get.put(ExpanseController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: grey,
        elevation: 0,
        title: const CustomText(text: "ההוצאות שלי"),
        centerTitle: true,
        leading: CustomButton(
          child: const Icon(Icons.add),
          func: () => Get.bottomSheet(const AddInfoDialog()),
        ),
      ),
      backgroundColor: grey,
      body: Obx(() {
        return ListView.builder(
          itemCount: ec.expanses.length,
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
    );
  }
}
