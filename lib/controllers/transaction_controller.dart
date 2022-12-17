import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:myexpenessapp/model/transaction.dart';

class TransactionController extends GetxController {
  /* State */
  final RxList<Transaction> _transactions = <Transaction>[].obs;
  late Box<Transaction> _tsBox;

  /* Getters */
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

  /* Actions */
  Future<void> getLocalStorage() async {
    _tsBox = await Hive.openBox("transactions");
    if (_tsBox.isEmpty) return;

    for (Transaction ts in _tsBox.values) {
      _transactions.add(ts);
    }

    update();
  }

  Future<void> setLocalStorage() async {
    _tsBox.clear();
    for (Transaction ts in _transactions) {
      _tsBox.add(ts);
    }

    update();
  }

  /// If [_findIndexById] returns: -1 -> no transaction found.
  int _findIndexById(String id) {
    final int index = _transactions.indexWhere((Transaction ts) => ts.id == id);
    return index;
  }

  void addTransaction(Transaction ts) {
    _transactions.add(ts);
    update();

    setLocalStorage();
  }

  void updateTransaction(Transaction ts) {
    final int index = _findIndexById(ts.id);
    if (index == -1) throw 'מזהה עסקה אינו תקין';

    _transactions[index] = ts;
    update();

    setLocalStorage();
  }

  void deleteTransaction(String id) {
    final int index = _findIndexById(id);
    if (index == -1) throw 'מזהה עסקה אינו תקין';

    _transactions.removeAt(index);
    update();

    setLocalStorage();
  }

  Future<void> deleteAll() async {
    await _tsBox.clear();
    _transactions.value = [];

    update();
  }
}
