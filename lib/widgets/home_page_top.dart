import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myexpenessapp/config/colors.dart';
import 'package:myexpenessapp/config/font_sizes.dart';
import 'package:myexpenessapp/config/media_query_variables.dart';
import 'package:myexpenessapp/controllers/expanse_controller.dart';
import 'package:myexpenessapp/controllers/income_controller.dart';
import 'package:myexpenessapp/pages/edit_item_page.dart';
import 'package:myexpenessapp/utils/get_balance.dart';
import 'package:myexpenessapp/widgets/customs/custom_button.dart';
import 'package:myexpenessapp/widgets/customs/custom_text.dart';

class HomePageTop extends StatelessWidget {
  HomePageTop({super.key});

  final ExpanseController ec = Get.put(ExpanseController());
  final IncomeController ic = Get.put(IncomeController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final bool isNegative = ec.total.value > ic.total.value;
      return Stack(
        clipBehavior: Clip.none,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: height(context) * 0.34,
            width: width(context),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(bottom: Radius.circular(30)),
              boxShadow: const [BoxShadow(color: grey, blurRadius: 30)],
              gradient: LinearGradient(
                colors: isNegative ? [complementary1, complementary2] : [keyColor1, keyColor2],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomText(text: "מצב המאזן:", fontSize: FontSizes.text46, color: white),
                const SizedBox(height: 15),
                CustomText(
                  text: "₪${getBalance()}",
                  color: white,
                  fontSize: FontSizes.text27,
                  textDirection: TextDirection.ltr,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: -20,
            left: 30,
            right: 30,
            child: CustomButton(
              func: () => Get.to(() => const EditItemPage(id: "", isExpanse: false)),
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  CustomText(text: "הוספת הוצאה / הכנסה", fontSize: FontSizes.text18),
                  Icon(Icons.add, color: grey),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }
}
