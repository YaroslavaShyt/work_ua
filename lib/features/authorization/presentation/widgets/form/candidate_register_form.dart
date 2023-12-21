import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_ua/core/widgets/colors.dart';
import 'package:work_ua/core/widgets/button.dart';
import 'package:work_ua/features/candidate/home.dart';
import 'package:work_ua/features/authorization/data/models/user_register_model.dart';
import 'package:work_ua/features/authorization/presentation/bloc/authentication_bloc.dart';
import 'package:work_ua/features/authorization/presentation/widgets/form/form_field.dart';
import 'package:work_ua/features/authorization/presentation/widgets/form/form_field_formatters.dart';

class RegisterFormCandidate extends StatefulWidget {
  const RegisterFormCandidate({super.key});

  @override
  State<RegisterFormCandidate> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterFormCandidate> {
  final TextEditingController emailController =
      TextEditingController();
  final TextEditingController nameController =
      TextEditingController();
  final TextEditingController surnameController =
      TextEditingController();
  final TextEditingController patronimycController =
      TextEditingController();
  final TextEditingController cityController =
      TextEditingController();
  final TextEditingController phoneNumberController =
      TextEditingController();
  final TextEditingController passwordController =
      TextEditingController();
  final TextEditingController dateOfBitrhController =
      TextEditingController();

  DateTime? dateOfBitrh;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state is AuthenticationSuccess) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pushReplacementNamed(context, HomeScreen.id);
          });
        }
        if (state is AuthenticationFail) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: Text(state.model.message),
                    ));
          });
        }
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
                    //  validator: Validator.validateName,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  FormFieldText(
                    title: "По батькові",
                    controller: patronimycController,
                    //   validator: Validator.validatePatronimyc,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  FormFieldText(
                    title: "Прізвище",
                    controller: surnameController,
                    //  validator: Validator.validateSurname,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  FormFieldText(
                    title: "Дата народження",
                    controller: dateOfBitrhController,
                    //  validator: Validator.validateDateOfBirth,
                    formatters: [InputFormatters.dateFormatter],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  FormFieldText(
                    title: "Номер телефону",
                    controller: phoneNumberController,
                    //  validator: Validator.validatePhone,
                    formatters: [InputFormatters.phoneNumberFormatter],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  FormFieldText(
                    title: "Населений пункт",
                    controller: cityController,
                    //  validator: Validator.validateCity,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  FormFieldText(
                    title: "Email",
                    controller: emailController,
                    //  validator: Validator.validateEmail,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  FormFieldText(
                    title: "Пароль",
                    controller: passwordController,
                    //  validator: Validator.validatePassword,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: Button(
                      text: "Зареєструватись",
                      onTap: () {
                        var model = UserRegisterModel(
                          socialMediaLinks: '',
                          profilePhoto: '',
                          title: '',
                          workersQuantity: '',
                          serviceType: '',
                          description: '',
                          usertype: "candidate",
                            name: nameController.text,
                            patronymic: patronimycController.text,
                            surname: surnameController.text,
                            birthDate: dateOfBitrhController.text,
                            city: cityController.text,
                            contactNumber: phoneNumberController.text,
                            email: emailController.text,
                            password: passwordController.text);
                        context.read<AuthenticationBloc>().add(
                            AuthenticationInitiateEvent(model: model));
                      },
                      color: crimsonColor,
                      textColor: whiteColor,
                    ),
                  )
                ],
              ),
            ));
      },
    );
  }
}
