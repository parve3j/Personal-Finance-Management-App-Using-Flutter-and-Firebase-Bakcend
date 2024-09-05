import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../model/income.dart';

class IncomeController extends GetxController {
  var incomes = <Income>[].obs;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void loadIncomes() async {
    String? userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) return;

    var querySnapshot = await firestore
        .collection('incomes')
        .where('userId', isEqualTo: userId)
        .get();

    incomes.clear();
    querySnapshot.docs.forEach((doc) {
      incomes.add(Income.fromMap(doc.data()));
    });
  }

  Future<void> addIncome(double amount, String source, String description) async {
    String? userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) return;

    String incomeId = firestore.collection('incomes').doc().id;
    Income newIncome = Income(
      id: incomeId,
      amount: amount,
      source: source,
      description: description,
      date: DateTime.now(),
      userId: userId,
    );

    await firestore.collection('incomes').doc(incomeId).set(newIncome.toMap());
    incomes.add(newIncome);
  }

  Future<void> deleteIncome(String id) async {
    await firestore.collection('incomes').doc(id).delete();
    incomes.removeWhere((income) => income.id == id);
  }
}
