import 'package:flutter/material.dart';
import 'package:work_ua/core/colors.dart';
import 'package:work_ua/core/widgets/button.dart';
import 'package:work_ua/core/widgets/label.dart';
import 'package:work_ua/features/authorization/presentation/widgets/custom_divider.dart';
import 'package:work_ua/features/authorization/presentation/widgets/register_form.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: blueColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Label(textColor: whiteColor),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Робота в Україні',
                style: TextStyle(
                    color: whiteColor,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Зараз у нас 93656 актуальних вакансій.',
                style: TextStyle(
                    color: whiteColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w300),
              ),
              const SizedBox(
                height: 100,
              ),
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
                    SizedBox(
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
                          context: context,
                          builder: (BuildContext context) {
                            return Column(
                              children: [
                                SizedBox(
                                  height: 50,
                                ),
                                Label(textColor: blueColor),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Зареєструйтесь",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: RegisterForm(),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                    CustomDivider(
                      text: 'або',
                      textColor: whiteColor,
                      lineColor: whiteColor,
                    ),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: Button(
                        onTap: () {},
                        text: 'Зареєструватись',
                        color: whiteColor,
                        textColor: blueColor,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
                      child: Text(
                        'Продовжуючи, ви приймаєте правила сайту та політику конфіденційності',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: whiteColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
