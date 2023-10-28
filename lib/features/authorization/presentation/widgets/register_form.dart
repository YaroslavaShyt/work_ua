import 'package:bottom_picker/bottom_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:work_ua/core/colors.dart';

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
  DateTime? dateOfBitrh;

  void _openDatePicker(BuildContext context) {
    BottomPicker.date(
      title: "Обрати дату",
      titleStyle: const TextStyle(
          fontSize: 20, color: blackColor, fontWeight: FontWeight.bold),
      dateOrder: DatePickerDateOrder.dmy,
      pickerTextStyle: const TextStyle(color: blackColor, fontSize: 20),
      onChange: (index) {
        dateOfBitrh = index;
      },
      initialDateTime: dateOfBitrh ?? DateTime.now(),
    ).show(context);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        TextFormField(
          controller: nameController,
          decoration: const InputDecoration(label: Text("Ім'я")),
        ),
        TextFormField(
          controller: patronimycController,
          decoration: const InputDecoration(label: Text("По батькові")),
        ),
        TextFormField(
          controller: surnameController,
          decoration: const InputDecoration(label: Text("Прізвище")),
        ),
        ElevatedButton(
            onPressed: () {
              print("pressed");
              _openDatePicker(context);
            },
            child: const Text("Додати дату народження"))
      ],
    ));
  }
}
