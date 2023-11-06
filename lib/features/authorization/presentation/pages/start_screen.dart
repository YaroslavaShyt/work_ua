import 'package:flutter/material.dart';
import 'package:work_ua/core/colors.dart';
import 'package:work_ua/core/widgets/button.dart';
import 'package:work_ua/features/authorization/presentation/widgets/form/login_form.dart';
import 'package:work_ua/features/authorization/presentation/widgets/form/register_form.dart';
import 'package:work_ua/features/authorization/presentation/widgets/other/confidency_widget.dart';
import 'package:work_ua/features/authorization/presentation/widgets/other/custom_divider.dart';
import 'package:work_ua/features/authorization/presentation/widgets/modal/modal_bottom_sheet_register.dart';
import 'package:work_ua/core/widgets/start_screen_headers.dart';

class StartScreen extends StatelessWidget {
  static const id = "start_screen";

  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: blueColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const StartScreenHeaders(),
              Container(
                decoration: BoxDecoration(
                    color: lightBlue,
                    borderRadius: BorderRadius.circular(10.0)),
                margin: const EdgeInsets.all(10.0),
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.fromLTRB(45.0, 0.0, 45.0, 0.0),
                      child: Text(
                        'Увійдіть або зареєструйтесь, щоб скористатись всіма перевагами Work.ua',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: whiteColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: Button(
                        text: 'Увійти',
                        color: crimsonColor,
                        textColor: whiteColor,
                        onTap: () => showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (BuildContext context) {
                            return const ModalBottomSheetContent(
                              title: "Увійти",
                              form: LogInForm(),
                            );
                          },
                        ),
                      ),
                    ),
                    const CustomDivider(
                      text: 'або',
                      textColor: whiteColor,
                      lineColor: whiteColor,
                    ),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: Button(
                        text: 'Зареєструватись',
                        color: whiteColor,
                        textColor: blueColor,
                        onTap: () => showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (BuildContext context) {
                            return const ModalBottomSheetContent(
                              title: "Зареєструватись",
                              form: RegisterForm(),
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const ConfidencyPolitics()
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
