import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personal_finance_management_app/const/app_colors.dart';

import '../../controller/income_controller.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_fields.dart';

class AddIncomeScreen extends StatelessWidget {
  final IncomeController incomeController = Get.find();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController sourceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Income'),
        backgroundColor: AppColors.mandarinColor,
        foregroundColor: Colors.white,
        elevation: 3,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            customFormField(TextInputType.number, amountController,
                context, 'Amount', (value) {
                  if (value.isEmpty) {
                    return 'This field can\'t be empty';
                  }
                },
              prefixIcon: Icons.money
            ),
            customFormField(TextInputType.text, sourceController,
              context, 'Source', (value) {
                if (value.isEmpty) {
                  return 'This field can\'t be empty';
                }
              },
              prefixIcon: Icons.source_outlined
            ),
            customFormField(TextInputType.text, descriptionController,
              context, 'Description', (value) {
                if (value.isEmpty) {
                  return 'This field can\'t be empty';
                }
              },
              prefixIcon:Icons.description
            ),
            const SizedBox(height: 20),
            customButton('Add Income', () {
              double amount = double.parse(amountController.text);
              String source = sourceController.text;
              String description = descriptionController.text;

              if (amount > 0 && source.isNotEmpty && description.isNotEmpty && amountController.text.isNotEmpty) {
                incomeController.addIncome(amount, source, description);
                Get.back();
                Get.snackbar('Success', 'Income added successfully!');
              } else {
                Get.snackbar('Error', 'Field can\'t be empty');
              }
            })
          ],
        ),
      ),
    );
  }
}
