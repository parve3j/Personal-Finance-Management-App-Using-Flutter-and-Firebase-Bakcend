import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../model/expense.dart';

class ExpenseController extends GetxController {
  var expenses = <Expense>[].obs;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void loadExpenses() async {
    String? userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) return;

    var querySnapshot = await firestore
        .collection('expenses')
        .where('userId', isEqualTo: userId)
        .get();

    expenses.clear();
    querySnapshot.docs.forEach((doc) {
      expenses.add(Expense.fromMap(doc.data()));
    });
  }

  Future<void> addExpense(double amount, String description) async {
    String? userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) return;

    String expenseId = firestore.collection('expenses').doc().id;
    Expense newExpense = Expense(
      id: expenseId,
      amount: amount,
      description: description,
      date: DateTime.now(),
      userId: userId,
    );

    await firestore.collection('expenses').doc(expenseId).set(newExpense.toMap());
    expenses.add(newExpense);
  }

  Future<void> deleteExpense(String id) async {
    await firestore.collection('expenses').doc(id).delete();
    expenses.removeWhere((expense) => expense.id == id);
  }
}
