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
    return Obx(() {
      return Container(
        constraints: const BoxConstraints(maxHeight: 250),
        margin: const EdgeInsets.symmetric(vertical: 20),
        child: ec.expanses.isEmpty
            ? const CustomText(text: "נהדר! אין לך הוצאות", fontSize: FontSizes.text32)
            : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(() {
                          return CustomText(
                            text: "ההוצאות שלי (₪${formatNumber(ec.total.value)})",
                            fontSize: FontSizes.text18,
                          );
                        }),
                        GestureDetector(
                          child: CustomText(text: "לכל ההוצאות", fontSize: FontSizes.text18, color: keyColor2),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      scrollDirection: Axis.horizontal,
                      itemCount: ec.expanses.length,
                      separatorBuilder: (ctx, i) => const SizedBox(width: 15),
                      itemBuilder: ((ctx, i) {
                        return SingleExpanse(expanse: ec.expanses[i]);
                      }),
                    ),
                  )
                ],
              ),
      );
    });
  }
}
