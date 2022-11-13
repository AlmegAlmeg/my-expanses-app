import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myexpenessapp/config/colors.dart';
import 'package:myexpenessapp/config/font_sizes.dart';
import 'package:myexpenessapp/config/media_query_variables.dart';
import 'package:myexpenessapp/controllers/income_controller.dart';
import 'package:myexpenessapp/utils/format_number.dart';
import 'package:myexpenessapp/widgets/customs/custom_text.dart';

class IncomeList extends StatelessWidget {
  IncomeList({super.key});

  final IncomeController ic = Get.put(IncomeController());

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      height: height(context) * 0.4,
      width: width(context),
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [BoxShadow(color: veryLightGrey, blurRadius: 20)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomText(text: "ההכנסות שלי", fontSize: FontSizes.text25),
                CustomText(text: "₪${ic.getTotalIncome()}")
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              return Scrollbar(
                child: ListView.builder(
                  itemCount: ic.incomes.length,
                  shrinkWrap: true,
                  itemBuilder: ((ctx, i) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: incomeColor,
                        child: const Icon(Icons.money_off, color: white),
                      ),
                      title: CustomText(text: ic.incomes[i].info, textAlign: TextAlign.right),
                      subtitle: CustomText(
                        text: "₪${formatNumber(ic.incomes[i].price)}",
                        textAlign: TextAlign.right,
                        color: lightGrey,
                        fontSize: FontSizes.text18,
                      ),
                    );
                  }),
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}
