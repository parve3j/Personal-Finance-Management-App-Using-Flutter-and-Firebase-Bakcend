import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../const/app_colors.dart';
import '../../controller/auth_controller.dart';
import '../../routes/routes.dart';
import '../../utils/responsive/size_config.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_fields.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

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
                    'Log In',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  customFormField(TextInputType.emailAddress, _emailController,
                      context, 'Email', (value) {
                    if (value.isEmpty) {
                      return 'This field can\'t be empty';
                    }
                    if (!value.contains(RegExp(r'\@'))) {
                      return 'Enter a valid email address';
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
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () => Get.toNamed(forgetpass),
                      child: const Text(
                        'Forget Password',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                      width: 200,
                      height: 45,
                      child: customButton(
                        'Log in',
                        () {
                          if (_formKey.currentState!.validate()) {
                            Get.find<AuthController>().login(
                                _emailController.text.trim(),
                                _passwordController.text.trim(),
                                context);
                          }
                        },
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(registration);
                    },
                    child: Text.rich(TextSpan(children: [
                      const TextSpan(
                          text: 'Don\'t have an account?',
                          style: TextStyle(color: AppColors.grayColor)),
                      TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Get.toNamed(registration),
                          text: ' Sign Up',
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 16)),
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
