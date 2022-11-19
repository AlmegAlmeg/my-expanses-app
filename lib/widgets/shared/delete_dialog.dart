import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myexpenessapp/config/colors.dart';
import 'package:myexpenessapp/config/font_sizes.dart';
import 'package:myexpenessapp/config/media_query_variables.dart';
import 'package:myexpenessapp/widgets/customs/custom_button.dart';
import 'package:myexpenessapp/widgets/customs/custom_text.dart';

class DeleteDialog extends StatelessWidget {
  const DeleteDialog({required this.deleteFunc, super.key});

  final void Function() deleteFunc;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        const Positioned(
          top: -25,
          left: 0,
          right: 0,
          child: CircleAvatar(
            backgroundColor: complementary1,
            radius: 35,
            child: Icon(Icons.delete, color: white, size: 50),
          ),
        ),
        Container(
          height: 210,
          padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
          width: width(context) * 0.9,
          child: Column(
            children: [
              const CustomText(text: "בטוח שברצונך למחוק פריט זה?", fontSize: FontSizes.text27),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomButton(
                    func: () {
                      deleteFunc();
                      Get.back();
                    },
                    backgroundColor: keyColor2,
                    useShadow: true,
                    height: 45,
                    width: 100,
                    child: const CustomText(text: "אישור", color: white, fontSize: FontSizes.text21),
                  ),
                  CustomButton(
                    func: () => Get.back(),
                    backgroundColor: white,
                    useShadow: true,
                    height: 45,
                    width: 100,
                    child: const CustomText(text: "ביטול", fontSize: FontSizes.text21),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
