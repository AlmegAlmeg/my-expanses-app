import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myexpenessapp/config/colors.dart';
import 'package:myexpenessapp/config/font_sizes.dart';
import 'package:myexpenessapp/config/media_query_variables.dart';
import 'package:myexpenessapp/controllers/expanse_controller.dart';
import 'package:myexpenessapp/widgets/customs/custom_button.dart';
import 'package:myexpenessapp/widgets/customs/custom_text.dart';

class HomePageTop extends StatelessWidget {
  HomePageTop({super.key});

  final ExpanseController ec = Get.put(ExpanseController());

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: height(context) * 0.3,
          width: width(context),
          decoration: BoxDecoration(
            color: primary,
            borderRadius: const BorderRadius.vertical(bottom: Radius.circular(30)),
            boxShadow: [BoxShadow(color: grey, blurRadius: 30)],
            gradient: LinearGradient(
              colors: [primary, secondary],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomText(text: "מצב המאזן:", fontSize: FontSizes.text46, color: white),
              const SizedBox(height: 15),
              // Obx(() {
              CustomText(text: "₪${ec.getBalance()}", color: white, fontSize: FontSizes.text27),
              // }),
              const SizedBox(height: 40),
            ],
          ),
        ),
        Positioned(
          bottom: -20,
          left: 30,
          right: 30,
          child: CustomButton(
            func: () => {},
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomText(text: "הוספת הוצאה / הכנסה", fontSize: FontSizes.text18),
                Icon(Icons.add, color: grey),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
