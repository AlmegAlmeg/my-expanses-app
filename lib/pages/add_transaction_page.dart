import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myexpenessapp/config/colors.dart';
import 'package:myexpenessapp/config/font_sizes.dart';
import 'package:myexpenessapp/widgets/customs/custom_button.dart';
import 'package:myexpenessapp/widgets/customs/custom_form_field.dart';
import 'package:myexpenessapp/widgets/customs/custom_text.dart';

class AddTransactionPage extends StatefulWidget {
  const AddTransactionPage({this.id = '', super.key});

  final String id;

  @override
  State<AddTransactionPage> createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  bool isExpanse = false;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: lightGrey,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

        /* Add transaction button */
        floatingActionButton: SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: CustomButton(
            func: _addTransaction,
            backgroundColor: darkGrey,
            useShadow: true,
            padding: const EdgeInsets.all(15),
            child: const CustomText(text: "הוספת עסקה"),
          ),
        ),

        /* Appbar */
        appBar: AppBar(
          backgroundColor: darkGrey,
          automaticallyImplyLeading: true,
          centerTitle: true,
          title: const CustomText(text: "הוספת עסקה"),
        ),

        /* Body */
        body: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.all(25),

            /* Form */
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /* Name input */
                  CustomFormField(
                    label: "תיאור",
                    controller: _nameController,
                    validator: (String? value) {
                      if (value == null || value.isEmpty || value.replaceAll(" ", "").isEmpty) {
                        return "שדה זה הינו שדה חובה";
                      } else if (value.length < 2) {
                        return "שדה זה חייב להכיל לפחות שני תווים";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30),

                  /* Amount input */
                  CustomFormField(
                    label: "כמות",
                    controller: _amountController,
                    textInputType: TextInputType.number,
                    validator: (String? value) {
                      if (value == null || value.isEmpty || value.replaceAll(" ", "").isEmpty) {
                        return "שדה זה הינו שדה חובה";
                      } else if (RegExp(r'^[a-z,A-Z,א-ת]+$').hasMatch(value)) {
                        return "שדה זה לא יכול להכיל תווים";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 30),

                  /* Switch button */
                  ListTile(
                    contentPadding: const EdgeInsets.all(0),
                    onTap: () => setState(() => isExpanse = !isExpanse),
                    leading: Switch(
                      value: isExpanse,
                      onChanged: (value) => setState(() => isExpanse = value),
                      activeTrackColor: grey,
                      activeColor: white,
                    ),
                    title: const CustomText(text: "האם זוהי הוצאה?", color: darkGrey, fontSize: FontSizes.text18),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _addTransaction() async {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();

    final Map<String, dynamic> json = {
      "id": "",
      "name": _nameController.text,
      "amount": double.tryParse(_amountController.text),
      "isExpanse": isExpanse,
      "createdAt": DateTime.now(),
    };

    final transactions = FirebaseFirestore.instance.collection("transactions").doc();

    

    Get.back();
  }
}
