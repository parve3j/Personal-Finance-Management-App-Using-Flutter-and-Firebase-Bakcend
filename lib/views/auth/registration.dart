import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personal_finance_management_app/routes/routes.dart';
import '../../const/app_colors.dart';
import '../../controller/auth_controller.dart';
import '../../utils/responsive/size_config.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_fields.dart';

class Registration extends StatelessWidget {
  Registration({super.key});

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  AuthController _authController = Get.find();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            height: SizeConfig.screnHeight,
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.always,
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  customFormField(
                      TextInputType.text, _nameController, context, 'Name',
                      (val) {
                    if (val.isEmpty) {
                      return 'This field can\'t be empty';
                    }
                  }, prefixIcon: Icons.person_2_outlined),
                  customFormField(TextInputType.emailAddress, _emailController,
                      context, 'Email', (val) {
                    if (val.isEmpty) {
                      return 'This field can\'t be empty';
                    }
                    if (!val.contains(RegExp(r'\@'))) {
                      return 'enter a valid email address';
                    }
                  }, prefixIcon: Icons.email_outlined),
                  Obx(() => customFormField(
                        TextInputType.text,
                        _passwordController,
                        context,
                        'Password',
                        (val) {
                          if (val!.isEmpty) {
                            return 'This field can\'t be empty';
                          }
                          return null;
                        },
                        prefixIcon: Icons.lock_outline,
                        isObscure: _authController.obscureText,
                        count: 1,
                        onSuffixIconPressed: _authController.toggleObscureText,
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                      width: 200,
                      height: 45,
                      child: customButton(
                        'Sign Up',
                        () {
                          if (_formKey.currentState!.validate()) {
                            Get.find<AuthController>().signUp(
                                _nameController.text,
                                _emailController.text.trim(),
                                _passwordController.text.trim(),
                                context);
                          } else {
                            print('failed');
                          }
                        },
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(loginscreen);
                    },
                    child: Text.rich(TextSpan(children: [
                      const TextSpan(
                          text: 'Already have an account?',
                          style: TextStyle(color: AppColors.grayColor)),
                      TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.back();
                            },
                          text: ' Login',
                          style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w600)),
                    ])),
                  )
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
