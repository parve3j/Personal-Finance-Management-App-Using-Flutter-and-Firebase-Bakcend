import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../const/app_colors.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text_fields.dart';
import '../../controller/expense_controller.dart';


class AddExpenseScreen extends StatelessWidget {
  final ExpenseController expenseController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            customFormField(TextInputType.number, expenseController.amountController,
                context, 'Amount', (value) {
                  if (value.isEmpty) {
                    return 'This field can\'t be empty';
                  }
                },
                prefixIcon: Icons.money
            ),
            customFormField(TextInputType.text, expenseController.descriptionController,
                context, 'Description', (value) {
                  if (value.isEmpty) {
                    return 'This field can\'t be empty';
                  }
                },
                prefixIcon:Icons.description
            ),
            const SizedBox(height: 20),
            customButton('Add Expense', () {
              double amount = double.parse(expenseController.amountController.text);
              String description = expenseController.descriptionController.text;

              if (amount >= 0 && expenseController.amountController.text.isNotEmpty && description.isNotEmpty) {
                expenseController.addExpense(amount, description);
                Get.back();
                Get.snackbar('Success', 'Expense added successfully!');
              } else {
                Get.snackbar('Error', 'Field can\'t be empty');
              }
              expenseController.amountController.clear();
              expenseController.descriptionController.clear();
            })
          ],
        ),
      ),
    );
  }

  AppBar get buildAppBar {
    return AppBar(
      title: const Text('Add Expense'),
      backgroundColor: AppColors.mandarinColor,
      foregroundColor: Colors.white,
      elevation: 3,
    );
  }
}
