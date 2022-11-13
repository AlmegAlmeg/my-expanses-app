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
      constraints: const BoxConstraints(maxHeight: 200),
      margin: const EdgeInsets.fromLTRB(30, 30, 30, 30),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: "ההוצאות שלי (₪${formatNumber(ec.getTotalExpanses())})",
                fontSize: FontSizes.text18,
              ),
              GestureDetector(child: CustomText(text: "לכל ההוצאות", fontSize: FontSizes.text18, color: secondary)),
            ],
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              // shrinkWrap: true,
              itemCount: ec.expanses.length,
              itemBuilder: ((ctx, i) {
                return SingleExpanse(expanse: ec.expanses[i]);
              }),
            ),
          )
        ],
      ),
      // child: ,
    );
    //   return Container(
    //     clipBehavior: Clip.hardEdge,
    //     height: height(context) * 0.4,
    //     width: width(context),
    //     margin: const EdgeInsets.all(20),
    //     decoration: BoxDecoration(
    //       color: white,
    //       borderRadius: BorderRadius.circular(30),
    //       boxShadow: [BoxShadow(color: veryLightGrey, blurRadius: 20)],
    //     ),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Padding(
    //           padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    //           child: Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //             children: [
    //               const CustomText(text: "ההוצאות שלי", fontSize: FontSizes.text25),
    //               CustomText(text: "₪${formatNumber(ec.getTotalExpanses())}")
    //             ],
    //           ),
    //         ),
    //         Expanded(
    //           child: Obx(() {
    //             return Scrollbar(
    //               child: ListView.builder(
    //                 itemCount: ec.expanses.length,
    //                 shrinkWrap: true,
    //                 itemBuilder: ((ctx, i) {
    //                   return ListTile(
    //                     leading: CircleAvatar(
    //                       backgroundColor: expanseColor,
    //                       child: const Icon(Icons.attach_money, color: white),
    //                     ),
    //                     title: CustomText(text: ec.expanses[i].info, textAlign: TextAlign.right),
    //                     subtitle: CustomText(
    //                       text: "₪${formatNumber(ec.expanses[i].price)}",
    //                       textAlign: TextAlign.right,
    //                       color: lightGrey,
    //                       fontSize: FontSizes.text18,
    //                     ),
    //                   );
    //                 }),
    //               ),
    //             );
    //           }),
    //         )
    //       ],
    //     ),
    //   );
  }
}
