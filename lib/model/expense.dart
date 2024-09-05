import 'package:cloud_firestore/cloud_firestore.dart';

class Expense {
  String id;
  double amount;
  String description;
  DateTime date;
  String userId;

  Expense({
    required this.id,
    required this.amount,
    required this.description,
    required this.date,
    required this.userId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'amount': amount,
      'description': description,
      'date': date,
      'userId': userId,
    };
  }

  factory Expense.fromMap(Map<String, dynamic> map) {
    return Expense(
      id: map['id'],
      amount: map['amount'],
      description: map['description'],
      date: (map['date'] as Timestamp).toDate(),
      userId: map['userId'],
    );
  }
}
