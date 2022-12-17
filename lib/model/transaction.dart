import 'package:hive/hive.dart';

part 'transaction.g.dart';

@HiveType(typeId: 0)
class Transaction extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final double amount;
  @HiveField(3)
  final bool isExpanse;
  @HiveField(4)
  final DateTime createdAt;

  Transaction({
    required this.id,
    required this.name,
    required this.amount,
    required this.isExpanse,
    required this.createdAt,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json["id"],
      name: json["name"],
      amount: json["amount"],
      isExpanse: json["isExpanse"],
      createdAt: json["createdAt"],
    );
  }
}
