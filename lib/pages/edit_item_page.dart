import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myexpenessapp/config/colors.dart';
import 'package:myexpenessapp/config/font_sizes.dart';
import 'package:myexpenessapp/config/media_query_variables.dart';
import 'package:myexpenessapp/controllers/expanse_controller.dart';
import 'package:myexpenessapp/controllers/income_controller.dart';
import 'package:myexpenessapp/widgets/customs/custom_button.dart';
import 'package:myexpenessapp/widgets/customs/custom_form_field.dart';
import 'package:myexpenessapp/widgets/customs/custom_radio_button.dart';
import 'package:myexpenessapp/widgets/customs/custom_text.dart';

class EditItemPage extends StatefulWidget {
  const EditItemPage({required this.id, required this.isExpanse, super.key});

  final String id;
  final bool isExpanse;

  @override
  State<EditItemPage> createState() => _EditItemPageState();
}

class _EditItemPageState extends State<EditItemPage> {
  final ExpanseController ec = Get.put(ExpanseController());
  final IncomeController ic = Get.put(IncomeController());

  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  _ItemType _itemType = _ItemType.income;
  dynamic _item;

  @override
  void initState() {
    if (!mounted || widget.id.isEmpty) {
      setState(() {
        _item.info = "";
        _item.price = "";
      });
      return;
    }
    setState(() {
      if (widget.isExpanse) {
        _itemType = _ItemType.expanse;
        _item = ec.findExpanseById(widget.id);
      } else {
        _item = ic.findIncomeById(widget.id);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bool condition = _itemType == _ItemType.income;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: CustomText(text: condition ? "הוספת הכנסה" : "הוספת הוצאה", color: condition ? grey : white),
          centerTitle: true,
          backgroundColor: condition ? keyColor1 : complementary1,
          automaticallyImplyLeading: true,
          iconTheme: IconThemeData(color: condition ? grey : white),
        ),
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            padding: const EdgeInsets.all(20),
            width: width(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /* Form */
                Form(
                  key: _key,
                  child: SizedBox(
                    width: width(context),
                    child: Column(
                      children: [
                        CustomFormField(
                          label: "תיאור ההוצאה / הכנסה",
                          initialValue: _item.info ??= "",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "שדה זה הוא חובה";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        CustomFormField(
                          label: "מחיר",
                          initialValue: _item.price ??= "",
                          textInputType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "שדה זה הוא חובה";
                            } else if (double.parse(value) <= 0) {
                              return "הערך לא יכול להיות 0";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),

                        /* Radio buttons */
                        CustomRadioButton(
                          text: "הוצאה",
                          activeColor: complementary1,
                          value: _ItemType.expanse,
                          group: _itemType,
                          changeFun: (value) => setState(() => _itemType = _ItemType.expanse),
                        ),
                        CustomRadioButton(
                          text: "הכנסה",
                          activeColor: keyColor1,
                          value: _ItemType.income,
                          group: _itemType,
                          changeFun: (value) => setState(() => _itemType = _ItemType.income),
                        ),
                      ],
                    ),
                  ),
                ),

                /* Confirm Button */
                CustomButton(
                  func: () {
                    _key.currentState!.validate();
                  },
                  backgroundColor: condition ? keyColor1 : complementary1,
                  width: width(context),
                  useShadow: true,
                  padding: const EdgeInsets.all(10),
                  child: const CustomText(text: "אישור", fontSize: FontSizes.text25),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

enum _ItemType { expanse, income }
