import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myexpenessapp/controllers/transaction_controller.dart';
import 'package:myexpenessapp/pages/add_transaction_page.dart';
import 'package:myexpenessapp/widgets/customs/custom_text.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final TransactionController tc = Get.put(TransactionController());

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          // floatingActionButton: FloatingActionButton(
          //   onPressed: () => Get.to(() => const AddTransactionPage()),
          //   backgroundColor: keyColor2,
          //   child: const Icon(Icons.add, size: 40),
          // ),
          // floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
          // resizeToAvoidBottomInset: true,

          /* Appbar */
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () => Get.to(() => const AddTransactionPage()),
                icon: const Icon(Icons.add),
              ),
            ],
            centerTitle: true,
            title: Obx((() => CustomText(text: 'מאזן: ${tc.balance}'))),
          ),
        ),
      ),
    );
  }
}
