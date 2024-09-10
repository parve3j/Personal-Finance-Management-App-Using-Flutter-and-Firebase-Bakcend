import 'package:cloud_firestore/cloud_firestore.dart';

class Income {
  String id;
  double amount;
  String source;
  String description;
  DateTime date;
  String userId;

  Income({
    required this.id,
    required this.amount,
    required this.source,
    required this.description,
    required this.date,
    required this.userId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'amount': amount,
      'source': source,
      'description': description,
      'date': date,
      'userId': userId,
    };
  }

  factory Income.fromMap(Map<String, dynamic> map) {
    return Income(
      id: map['id'],
      amount: map['amount'],
      source: map['source'],
      description: map['description'],
      date: (map['date'] as Timestamp).toDate(),
      userId: map['userId'],
    );
  }
}
