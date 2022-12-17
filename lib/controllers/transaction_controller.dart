import 'package:get/get.dart';
import 'package:myexpenessapp/model/transaction.dart';

class TransactionController extends GetxController {
  final RxList<Transaction> _transactions = <Transaction>[].obs;

  double get balance {
    double total = 0;
    for (Transaction trans in _transactions) {
      if (trans.isExpanse) {
        total = total - trans.amount;
      } else {
        total = total + trans.amount;
      }
    }

    return total;
  }
}
