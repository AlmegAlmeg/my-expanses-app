import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myexpenessapp/config/colors.dart';
import 'package:myexpenessapp/pages/add_transaction_page.dart';
import 'package:myexpenessapp/widgets/customs/custom_text.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final CollectionReference _transactions = FirebaseFirestore.instance.collection("transactions");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => const AddTransactionPage()),
        backgroundColor: keyColor3,
        child: const Icon(Icons.add, size: 40),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: StreamBuilder(
          stream: _transactions.snapshots(),
          builder: ((context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                itemCount: snapshot.data!.docs.length,
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                separatorBuilder: ((context, i) => const Divider(thickness: 1)),
                itemBuilder: ((context, i) {
                  final QueryDocumentSnapshot<Object?> document = snapshot.data!.docs[i];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: document["isExpanse"] ? keyColor2 : keyColor1,
                      child: const Icon(Icons.attach_money, color: white),
                    ),
                    title: CustomText(text: document["name"], color: darkGrey),
                    subtitle: CustomText(text: '₪${document["amount"]}', color: darkGrey),
                  );
                }),
              );
            }
            return const CircularProgressIndicator();
          }),
        ),
      ),
    );
  }
}
