import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../const/app_colors.dart';
import '../../controller/expense_controller.dart';

class ViewExpensesScreen extends StatelessWidget {
  final ExpenseController expenseController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expenses'),
        backgroundColor: AppColors.mandarinColor,
        foregroundColor: Colors.white,
        elevation: 3,
      ),
      body: Obx(() {
        if (expenseController.expenses.isEmpty) {
          return const Center(child: Text('No expenses added yet'));
        } else {
          return ListView.builder(
            itemCount: expenseController.expenses.length,
            itemBuilder: (context, index) {
              final expense = expenseController.expenses[index];
              return InkWell(
                onTap: (){
                  Get.snackbar(
                    'Expenses Details',
                    'Amount: \$${expense.amount.toStringAsFixed(2)}\nDate: ${DateFormat('yyyy-MM-dd – kk:mm')}',
                    snackPosition: SnackPosition.BOTTOM,
                    duration: const Duration(seconds: 3),
                  );
                },
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    title: Text(expense.description,style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),),
                    subtitle: Text(
                      'Amount: \$${expense.amount.toStringAsFixed(2)}\nDate: ${DateFormat('yyyy-MM-dd – kk:mm').format(expense.date)},',
                      style: const TextStyle(fontSize: 16),
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        expenseController.deleteExpense(expense.id);
                      },
                    ),
                  ),
                ),
              );
            },
          );
        }
      }),
    );
  }
}
