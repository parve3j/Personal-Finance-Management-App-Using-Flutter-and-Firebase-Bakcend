import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/income.dart';

class AddIncomeScreen extends StatelessWidget {
  final IncomeController incomeController = Get.find();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController sourceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Income'),
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
              controller: sourceController,
              decoration: InputDecoration(labelText: 'Source'),
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                double amount = double.parse(amountController.text);
                String source = sourceController.text;
                String description = descriptionController.text;

                if (amount > 0 && source.isNotEmpty && description.isNotEmpty) {
                  incomeController.addIncome(amount, source, description);
                  Get.back(); // Return to previous screen
                  Get.snackbar('Success', 'Income added successfully!');
                } else {
                  Get.snackbar('Error', 'Please enter valid details');
                }
              },
              child: Text('Add Income'),
            ),
          ],
        ),
      ),
    );
  }
}
