import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myexpenessapp/config/colors.dart';
import 'package:myexpenessapp/config/font_sizes.dart';
import 'package:myexpenessapp/controllers/income_controller.dart';
import 'package:myexpenessapp/utils/format_number.dart';
import 'package:myexpenessapp/widgets/customs/custom_text.dart';
import 'package:myexpenessapp/widgets/shared/single_income.dart';

class IncomesList extends StatelessWidget {
  IncomesList({super.key});

  final IncomeController ic = Get.put(IncomeController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        constraints: const BoxConstraints(maxHeight: 250),
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: ic.incomes.isEmpty
            ? const CustomText(text: "נראה שאין לך הכנסות עדיין...", fontSize: FontSizes.text32)
            : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(() {
                          return CustomText(
                            text: "ההכנסות שלי (₪${formatNumber(ic.total.value)})",
                            fontSize: FontSizes.text18,
                          );
                        }),
                        GestureDetector(
                          child: const CustomText(text: "לכל ההכנסות", fontSize: FontSizes.text18, color: keyColor2),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      scrollDirection: Axis.horizontal,
                      itemCount: ic.incomes.length,
                      separatorBuilder: (ctx, i) => const SizedBox(width: 15),
                      itemBuilder: ((ctx, i) {
                        return SingleIncome(income: ic.incomes[i]);
                      }),
                    ),
                  )
                ],
              ),
      );
    });
  }
}
