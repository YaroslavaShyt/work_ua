import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_ua/core/widgets/colors.dart';
import 'package:work_ua/core/services/shared_preferences/shared_pref_user.dart';
import 'package:work_ua/core/widgets/button.dart';
import 'package:work_ua/features/authorization/presentation/widgets/form/form_field.dart';
import 'package:work_ua/features/candidate/profile/domain/cv_model.dart';
import 'package:work_ua/features/candidate/profile/presentation/bloc/cv/cv_bloc.dart';
import 'package:work_ua/features/candidate/profile/presentation/pages/my_cvs_screen.dart';
import 'package:work_ua/features/candidate/profile/presentation/pages/profile_screen.dart';

class CreateCVForm extends StatefulWidget {
  final CVModel? model;
  final bool isUpdate;
  const CreateCVForm({super.key, this.model, this.isUpdate = false});

  @override
  State<CreateCVForm> createState() => _CreateCVFormState();
}

class _CreateCVFormState extends State<CreateCVForm> {
  final TextEditingController positionController =
      TextEditingController(text: '');
  final TextEditingController cityController = TextEditingController(text: '');
  final TextEditingController descriptionController =
      TextEditingController(text: '');
  late String userId;

  @override
  void dispose() {
    positionController.dispose();
    cityController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    if (widget.model != null) {
      positionController.text = widget.model!.position;
      cityController.text = widget.model!.city;
      descriptionController.text = widget.model!.description;
    }
    initData();
  }

  Future<void> initData() async {
    userId = await getUserFieldNamed('id');
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CVBloc, CVState>(
      builder: (context, state) {
        if (state is CVCreateSuccess) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pushReplacementNamed(context, MyCVsScreen.id);
          });
        }
        if (state is CVUpdateSuccess) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.of(context).pop();
          });
        }
        if (state is CVCreateFail) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: Text(state.model.message),
                    ));
          });
        }
        if (state is CVUpdateFail) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: Text(state.model.message),
                    ));
          });
        }
        return Form(
            // key: _formKey,
            //  autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              FormFieldText(
                title: "Посада",
                controller: positionController,
                //  validator: Validator.validateName,
              ),
              const SizedBox(
                height: 15,
              ),
              FormFieldText(
                title: "Місто",
                controller: cityController,
                //   validator: Validator.validatePatronimyc,
              ),
              const SizedBox(
                height: 15,
              ),
              FormFieldText(
                title: "Про себе",
                controller: descriptionController,
                //  validator: Validator.validateSurname,
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: Button(
                  text: "Додати резюме",
                  onTap: () {
                    if (widget.isUpdate) {
                      print(widget.model!.id);
                      var model = CVModel(
                          userId: userId,
                          id: widget.model!.id,
                          position: positionController.text,
                          city: cityController.text,
                          description: descriptionController.text);
                      context
                          .read<CVBloc>()
                          .add(CVUpdateInitiateEvent(model: model));
                    } else {
                      var model = CVModel(
                          userId: userId,
                          position: positionController.text,
                          city: cityController.text,
                          description: descriptionController.text);
                      context
                          .read<CVBloc>()
                          .add(CVCreateInitiateEvent(model: model));
                    }
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
