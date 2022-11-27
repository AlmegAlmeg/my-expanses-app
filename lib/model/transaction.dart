class Transaction {
  final String id;
  final String name;
  final double amount;
  final bool isExpanse;
  final DateTime createdAt;

  Transaction({
    required this.id,
    required this.name,
    required this.amount,
    required this.isExpanse,
    required this.createdAt,
  });

  Map<String, dynamic> toJson(Transaction transaction) {
    return {
      "id": transaction.id,
      "name": transaction.name,
      "amount": transaction.amount,
      "isExpanse": transaction.isExpanse,
      "createdAt": transaction.name,
    };
  }

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
