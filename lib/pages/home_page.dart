import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final CollectionReference _transactions = FirebaseFirestore.instance.collection("transactions");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              separatorBuilder: ((context, i) => const Divider()),
              itemBuilder: ((context, i) {
                return const ListTile();
              }),
            );
          }
          return const CircularProgressIndicator();
        }),
      )),
    );
  }
}
