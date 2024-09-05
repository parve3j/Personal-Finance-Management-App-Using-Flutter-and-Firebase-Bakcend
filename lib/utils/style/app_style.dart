import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppStyles {
  progressDialog(context) {
    showDialog(
        context: context,
        builder: (_) {
          return Dialog(
            elevation: 0,
            backgroundColor: Colors.transparent,
            child: Image.asset(
              'assets/files/loading.gif',
              height: 150,
            ),
          );
        });
  }

  GetSnackBar failedSnacBar(message)=> GetSnackBar(
    message: message,
    backgroundColor: Colors.redAccent,
    duration: Duration(seconds: 3),
    icon: Icon(Icons.warning),
    snackPosition: SnackPosition.TOP,
  );

  GetSnackBar successSnacBar(message)=> GetSnackBar(
    message: message,
    backgroundColor: Colors.greenAccent,
    duration: Duration(seconds: 3),
    icon: Icon(Icons.done),
    snackPosition: SnackPosition.TOP,
  );

}