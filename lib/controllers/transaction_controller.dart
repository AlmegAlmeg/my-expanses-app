import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class TransactionController extends GetxController {
  final CollectionReference _transactions = FirebaseFirestore.instance.collection("transactions");

  CollectionReference get transactions => _transactions;
}
