import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myexpenessapp/config/colors.dart';
import 'package:myexpenessapp/config/font_sizes.dart';
import 'package:myexpenessapp/controllers/expanse_controller.dart';
import 'package:myexpenessapp/utils/format_number.dart';
import 'package:myexpenessapp/widgets/customs/custom_text.dart';
import 'package:myexpenessapp/widgets/shared/single_expanse.dart';

class ExpanseList extends StatelessWidget {
  ExpanseList({super.key});

  final ExpanseController ec = Get.put(ExpanseController());

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxHeight: 243),
      margin: const EdgeInsets.symmetric(vertical: 30),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: "ההוצאות שלי (₪${formatNumber(ec.getTotalExpanses())})",
                  fontSize: FontSizes.text18,
                ),
                GestureDetector(child: CustomText(text: "לכל ההוצאות", fontSize: FontSizes.text18, color: secondary)),
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: ec.expanses.length,
                itemBuilder: ((ctx, i) {
                  return SingleExpanse(expanse: ec.expanses[i]);
                }),
              );
            }),
          )
        ],
      ),
    );
  }
}
