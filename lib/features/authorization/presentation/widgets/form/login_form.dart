import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_ua/core/colors.dart';
import 'package:work_ua/core/widgets/button.dart';
import 'package:work_ua/features/authorization/presentation/widgets/form/form_field.dart';
import 'package:work_ua/features/authorization/presentation/widgets/form/form_field_formatters.dart';
import 'form_field_validators.dart';

class LogInForm extends StatefulWidget {
  const LogInForm({super.key});

  @override
  State<LogInForm> createState() => _LogInFormState();
}

class _LogInFormState extends State<LogInForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  DateTime? dateOfBitrh;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _submitForm() {
    // if (_formKey.currentState!.validate()) {
    //   print("tapped");
    // } else {
    //   print("tapped1");
    //   print(_formKey.currentState);
    //   _resetForm();
    // }
  }

  void _resetForm() {
    _formKey.currentState!.reset();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        //  autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              FormFieldText(
                title: "Email",
                controller: emailController,
                validator: Validator.validateEmail,
              ),
              const SizedBox(
                height: 15,
              ),
              FormFieldText(
                title: "Пароль",
                controller: passwordController,
                validator: Validator.validatePassword,
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: Button(
                  text: "Увійти",
                  onTap: () => _submitForm(),
                  color: crimsonColor,
                  textColor: whiteColor,
                ),
              )
            ],
          ),
        ));
  }
}
