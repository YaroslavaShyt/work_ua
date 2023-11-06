import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_ua/core/colors.dart';
import 'package:work_ua/core/widgets/button.dart';
import 'package:work_ua/features/authorization/presentation/widgets/form/form_field.dart';
import 'package:work_ua/features/authorization/presentation/widgets/form/form_field_formatters.dart';
import 'form_field_validators.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController patronimycController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController dateOfBitrhController = TextEditingController();

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
    nameController.dispose();
    surnameController.dispose();
    patronimycController.dispose();
    cityController.dispose();
    phoneNumberController.dispose();
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
                title: "Ім'я",
                controller: nameController,
                validator: Validator.validateName,
              ),
              const SizedBox(
                height: 15,
              ),
              FormFieldText(
                title: "По батькові",
                controller: patronimycController,
                validator: Validator.validatePatronimyc,
              ),
              const SizedBox(
                height: 15,
              ),
              FormFieldText(
                title: "Прізвище",
                controller: surnameController,
                validator: Validator.validateSurname,
              ),
              const SizedBox(
                height: 15,
              ),
              FormFieldText(
                title: "Дата народження",
                controller: dateOfBitrhController,
                validator: Validator.validateDateOfBirth,
                formatters: [InputFormatters.dateFormatter],
              ),
              const SizedBox(
                height: 15,
              ),
              FormFieldText(
                title: "Номер телефону",
                controller: phoneNumberController,
                validator: Validator.validatePhone,
                formatters: [InputFormatters.phoneNumberFormatter],
              ),
              const SizedBox(
                height: 15,
              ),
              FormFieldText(
                title: "Населений пункт",
                controller: cityController,
                validator: Validator.validateCity,
              ),
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
                  text: "Зареєструватись",
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
