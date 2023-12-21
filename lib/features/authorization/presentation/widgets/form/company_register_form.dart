import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_ua/core/widgets/colors.dart';
import 'package:work_ua/core/widgets/button.dart';
import 'package:work_ua/features/candidate/home.dart';
import 'package:work_ua/features/authorization/data/models/user_register_model.dart';
import 'package:work_ua/features/authorization/presentation/bloc/authentication_bloc.dart';
import 'package:work_ua/features/authorization/presentation/widgets/form/form_field.dart';

class RegisterFormCompany extends StatefulWidget {
  const RegisterFormCompany({super.key});

  @override
  State<RegisterFormCompany> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterFormCompany> {
  final TextEditingController nameController =
      TextEditingController(text: 'data');
  final TextEditingController titleController =
      TextEditingController(text: 'data');
  final TextEditingController workersQuantityController =
      TextEditingController(text: 'data');
  final TextEditingController serviceTypeontroller =
      TextEditingController(text: 'data');
  final TextEditingController descriptionController =
      TextEditingController(text: 'data');
  final TextEditingController phoneNumberController =
      TextEditingController(text: '0678386793');
  final TextEditingController emailController =
      TextEditingController(text: 'data');
  final TextEditingController passwordController =
      TextEditingController(text: 'data');

  DateTime? dateOfBitrh;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    titleController.dispose();
    workersQuantityController.dispose();
    serviceTypeontroller.dispose();
    descriptionController.dispose();
    phoneNumberController.dispose();
    emailController.dispose();
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
          //print('company authentication fail');
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
                    title: "Назва компанії",
                    controller: titleController,
                    //   validator: Validator.validatePatronimyc,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  FormFieldText(
                    title: "Кількість співробітників",
                    controller: workersQuantityController,
                    //  validator: Validator.validateSurname,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  FormFieldText(
                    title: "Тип послуг",
                    controller: serviceTypeontroller,
                    //  validator: Validator.validateDateOfBirth,
                    // formatters: [InputFormatters.dateFormatter],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  FormFieldText(
                    title: "Опис",
                    controller: descriptionController,
                    //  validator: Validator.validatePhone,
                    //formatters: [InputFormatters.phoneNumberFormatter],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  FormFieldText(
                    title: "Номер телефону",
                    controller: phoneNumberController,
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
                          usertype: 'company',
                          socialMediaLinks: '',
                          surname: 'lsdjf',
                          patronymic: 'sdf',
                          birthDate: 'ssdf',
                          profilePhoto: '',
                            name: 'варварп',
                            title: 'ваправпр',
                            city: 'lypovets',
                            workersQuantity: 'варпвар',
                            serviceType: 'вапрвапр',
                            description: 'вапрвапр',
                            contactNumber: 'вапрвар',
                            email: 'варварп',
                            password: 'вапрвапрвап');
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
