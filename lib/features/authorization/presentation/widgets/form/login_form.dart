import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_ua/core/colors.dart';
import 'package:work_ua/core/widgets/button.dart';
import 'package:work_ua/features/candidate/home.dart';
import 'package:work_ua/features/authorization/data/models/login_model.dart';
import 'package:work_ua/features/authorization/presentation/bloc/bloc/authentication_bloc.dart';
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

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state is LoginInitiateEvent) {
          return const CircularProgressIndicator();
        }
        if (state is AuthenticationSuccess) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pushReplacementNamed(context, HomeScreen.id);
          });
        }
        if (state is AuthenticationFail) {
          print('login fail');
          WidgetsBinding.instance.addPostFrameCallback((_) {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: Text(state.model.message.toString()),
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
                    title: "Email",
                    controller: emailController,
                    //   validator: Validator.validateEmail,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  FormFieldText(
                    title: "Пароль",
                    controller: passwordController,
                    //   validator: Validator.validatePassword,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: Button(
                      text: "Увійти",
                      onTap: () {
                        print('pressed');
                        var model = LoginModel(
                            email: emailController.text,
                            password: passwordController.text);
                        context
                            .read<AuthenticationBloc>()
                            .add(LoginInitiateEvent(model: model));
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
