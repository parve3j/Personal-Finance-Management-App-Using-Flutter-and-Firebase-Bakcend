import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/auth_controller.dart';
import '../../utils/responsive/size_config.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_fields.dart';


class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});
  TextEditingController _emailController = TextEditingController();
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
                        'Forget Password?',
                        style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      customFormField(TextInputType.emailAddress, _emailController,
                          context, 'Email', (val) {
                            if (val.isEmpty) {
                              return 'this field can\'t be empty';
                            }
                            if (!val.contains(RegExp(r'\@'))) {
                              return 'enter a valid email address';
                            }
                          }, prefixIcon: Icons.email_outlined),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                          width: 200,
                          height: 40,
                          child: customButton(
                            'Continue',
                                () {
                                  if (_formKey.currentState!.validate()) {
                                    Get.find<AuthController>().forgetPassword(
                                        _emailController.text.trim(), context);
                                  } else {
                                    print('failed');
                                  }
                            },
                          )),
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
