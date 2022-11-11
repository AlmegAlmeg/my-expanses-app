import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myexpenessapp/config/colors.dart';
import 'package:myexpenessapp/config/font_sizes.dart';
import 'package:myexpenessapp/config/media_query_variables.dart';
import 'package:myexpenessapp/controllers/expanse_controller.dart';
import 'package:myexpenessapp/widgets/customs/custom_button.dart';
import 'package:myexpenessapp/widgets/customs/custom_text.dart';

class AddInfoDialog extends StatefulWidget {
  const AddInfoDialog({super.key});

  @override
  State<AddInfoDialog> createState() => _AddInfoDialogState();
}

class _AddInfoDialogState extends State<AddInfoDialog> {
  bool _isExpanse = true;
  final TextEditingController _infoController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final ExpanseController ec = Get.put(ExpanseController());

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(color: grey),
        child: Form(
          child: Column(
            children: [
              const CustomText(text: "הוספת הוצאה / הכנסה", fontSize: FontSizes.text27),
              const SizedBox(height: 10),
              TextFormField(
                controller: _infoController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(label: CustomText(text: "תיאור")),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _priceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(label: CustomText(text: "סכום")),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: width(context) * 0.4,
                    child: ListTile(
                      leading: _isExpanse ? Icon(Icons.check, color: primary) : null,
                      title: const CustomText(text: "הוצאה"),
                      onTap: () => setState(() => _isExpanse = true),
                    ),
                  ),
                  SizedBox(
                    width: width(context) * 0.4,
                    child: ListTile(
                      leading: !_isExpanse ? Icon(Icons.check, color: primary) : null,
                      title: const CustomText(text: "הכנסה"),
                      onTap: () => setState(() => _isExpanse = false),
                    ),
                  ),
                ],
              ),
              CustomButton(
                backgroundColor: primary,
                func: () {
                  if (_isExpanse) {
                    ec.addExpanse(_infoController.text, double.parse(_priceController.text));
                  } else {
                    ec.addIncome(_infoController.text, double.parse(_priceController.text));
                  }
                  Get.back();
                },
                child: const CustomText(text: "הוספה"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
