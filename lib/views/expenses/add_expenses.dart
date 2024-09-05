import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/expense.dart';

class AddExpenseScreen extends StatelessWidget {
  final ExpenseController expenseController = Get.find();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Expense'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Amount'),
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                double amount = double.parse(amountController.text);
                String description = descriptionController.text;

                if (amount > 0 && description.isNotEmpty) {
                  expenseController.addExpense(amount, description);
                  Get.back(); // Return to previous screen
                  Get.snackbar('Success', 'Expense added successfully!');
                } else {
                  Get.snackbar('Error', 'Please enter valid details');
                }
              },
              child: Text('Add Expense'),
            ),
          ],
        ),
      ),
    );
  }
}
