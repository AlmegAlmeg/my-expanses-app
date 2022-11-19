import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myexpenessapp/config/colors.dart';
import 'package:myexpenessapp/config/font_sizes.dart';
import 'package:myexpenessapp/controllers/expanse_controller.dart';
import 'package:myexpenessapp/model/expanse.dart';
import 'package:myexpenessapp/pages/edit_item_page.dart';
import 'package:myexpenessapp/utils/format_number.dart';
import 'package:myexpenessapp/widgets/customs/custom_text.dart';
import 'package:myexpenessapp/widgets/customs/custom_icon_button.dart';
import 'package:myexpenessapp/widgets/shared/delete_dialog.dart';

class SingleExpanse extends StatelessWidget {
  SingleExpanse({required this.expanse, super.key});

  final Expanse expanse;
  final ExpanseController ec = Get.put(ExpanseController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.symmetric(vertical: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: white,
        boxShadow: [BoxShadow(color: veryLightGrey, blurRadius: 10)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(color: almostWhite, height: 30),
              const Positioned(
                top: 15,
                right: 10,
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: complementary1,
                  child: Icon(Icons.attach_money, color: white, size: 25),
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: CustomText(text: expanse.info),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: CustomText(text: "₪${formatNumber(expanse.price)}", fontSize: FontSizes.text16, color: lightGrey),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomIconButton(
                  icon: Icons.edit,
                  backgroundColor: complementary3,
                  func: () => Get.to(() => EditItemPage(id: expanse.id, isExpanse: true)),
                ),
                CustomIconButton(
                  icon: Icons.delete,
                  backgroundColor: complementary1,
                  func: () => showDialog(
                    context: context,
                    builder: ((ctx) {
                      return Dialog(child: DeleteDialog(deleteFunc: () => ec.deleteExpanse(expanse.id)));
                    }),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
