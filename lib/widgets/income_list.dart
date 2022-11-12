import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myexpenessapp/config/colors.dart';
import 'package:myexpenessapp/config/font_sizes.dart';
import 'package:myexpenessapp/config/media_query_variables.dart';
import 'package:myexpenessapp/controllers/expanse_controller.dart';
import 'package:myexpenessapp/utils/format_number.dart';
import 'package:myexpenessapp/widgets/customs/custom_text.dart';

class IncomeList extends StatelessWidget {
  IncomeList({super.key});

  final ExpanseController ec = Get.put(ExpanseController());

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      height: height(context) * 0.4,
      width: width(context),
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [BoxShadow(color: veryLightGrey, blurRadius: 20)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: CustomText(text: "ההוצאות שלי", fontSize: FontSizes.text25),
          ),
          Expanded(
            child: Obx(() {
              return Scrollbar(
                child: ListView.builder(
                  // physics: const ClampingScrollPhysics(),
                  itemCount: ec.expanses.length,
                  shrinkWrap: true,
                  itemBuilder: ((ctx, i) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: expanseColor,
                        child: const Icon(Icons.attach_money, color: white),
                      ),
                      title: CustomText(text: ec.expanses[i].info, textAlign: TextAlign.right),
                      subtitle: CustomText(
                        text: "₪${fromatNumber(ec.expanses[i].price)}",
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
