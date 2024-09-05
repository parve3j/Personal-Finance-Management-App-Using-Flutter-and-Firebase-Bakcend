import 'package:flutter/material.dart';
import '../../const/app_colors.dart';

Widget customFormField(
    keyboardtype,
    controller,
    context,
    hinttext,
    validator, {
      bool obscureText = false,
      prefixIcon,
      readOnly = false,
    }) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: TextFormField(
      cursorColor: AppColors.mandarinColor,
      keyboardType: keyboardtype,
      readOnly: readOnly,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      controller: controller,
      obscureText: obscureText,
      textInputAction: TextInputAction.next,
      validator: validator,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.only(
            left: 5,
            top: 5,
            bottom: 5,
            right: 10,
          ),
          child: Container(
            width: 40,
            decoration: BoxDecoration(
              color: const Color(0xFFFDF2EE),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              prefixIcon,
              color: AppColors.mandarinColor,
              size: 20,
            ),
          ),
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(8),
        ),
        fillColor: Colors.white,
        filled: true,
        hintText: hinttext,
        hintStyle: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w400,
        ),
      ),
    ),
  );
}