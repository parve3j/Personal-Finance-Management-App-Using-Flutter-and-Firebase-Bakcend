import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personal_finance_management_app/const/app_colors.dart';

import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text_fields.dart';
import '../../controller/income_controller.dart';


class AddIncomeScreen extends StatelessWidget {
  final IncomeController incomeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar,

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            customFormField(TextInputType.number, incomeController.amountController,
                context, 'Amount', (value) {
                  if (value.isEmpty) {
                    return 'This field can\'t be empty';
                  }
                },
              prefixIcon: Icons.money
            ),
            customFormField(TextInputType.text, incomeController.sourceController,
              context, 'Source', (value) {
                if (value.isEmpty) {
                  return 'This field can\'t be empty';
                }
              },
              prefixIcon: Icons.source_outlined
            ),
            customFormField(TextInputType.text, incomeController.descriptionController,
              context, 'Description', (value) {
                if (value.isEmpty) {
                  return 'This field can\'t be empty';
                }
              },
              prefixIcon:Icons.description
            ),
            const SizedBox(height: 20),
            customButton('Add Income', () {
              double amount = double.parse(incomeController.amountController.text);
              String source = incomeController.sourceController.text;
              String description = incomeController.descriptionController.text;

              if (amount >=0 && source.isNotEmpty && description.isNotEmpty && incomeController.amountController.text.isNotEmpty) {
                incomeController.addIncome(amount, source, description);
                Get.back();
                Get.snackbar('Success', 'Income added successfully!');
              } else {
                Get.snackbar('Error', 'Field can\'t be empty');
              }
              incomeController.amountController.clear();
              incomeController.sourceController.clear();
              incomeController.descriptionController.clear();
            })
          ],
        ),
      ),
    );
  }

  AppBar get buildAppBar {
    return AppBar(
      title: const Text('Add Income'),
      backgroundColor: AppColors.mandarinColor,
      foregroundColor: Colors.white,
      elevation: 3,
    );
  }
}
