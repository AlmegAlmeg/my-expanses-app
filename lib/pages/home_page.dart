import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myexpenessapp/controllers/transaction_controller.dart';
import 'package:myexpenessapp/pages/add_transaction_page.dart';
import 'package:myexpenessapp/widgets/customs/custom_text.dart';
import 'package:myexpenessapp/widgets/transaction_tile.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  // final TransactionController tc = Get.put(TransactionController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TransactionController>(builder: (tc) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: SafeArea(
          child: Scaffold(
            /* Appbar */
            appBar: AppBar(
              title: Obx((() => CustomText(text: 'מאזן: ${tc.balance}'))),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () => Get.to(() => const AddTransactionPage()),
                  icon: const Icon(Icons.add),
                ),
              ],
            ),

            /* Page body */
            body: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Column(
                children: [
                  /* Top tile */
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomText(text: "כמות עסקאות: ${tc.transactionsLength}"),
                      TextButton(
                        onPressed: () => tc.deleteAllTransactions(),
                        child: const CustomText(text: 'מחק הכל', textDecoration: TextDecoration.underline),
                      ),
                    ],
                  ),

                  /* Transactions list */
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: tc.transactionsLength,
                    itemBuilder: ((context, index) {
                      return TransactionTile(transaction: tc.allTransactions[index]);
                    }),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
