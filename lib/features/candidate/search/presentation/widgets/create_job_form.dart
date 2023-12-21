import 'package:flutter/material.dart';
import 'package:work_ua/core/widgets/colors.dart';
import 'package:work_ua/core/services/shared_preferences/shared_pref_user.dart';
import 'package:work_ua/core/widgets/button.dart';
import 'package:work_ua/features/authorization/presentation/widgets/form/form_field.dart';
import 'package:work_ua/features/candidate/search/data/job_model.dart';

class CreateJobForm extends StatefulWidget {
  final JobModel? model;
  final bool isUpdate;
  const CreateJobForm({super.key, this.model, this.isUpdate = false});

  @override
  State<CreateJobForm> createState() => _CreateJobFormState();
}

class _CreateJobFormState extends State<CreateJobForm> {
  final TextEditingController positionController =
      TextEditingController(text: '');
  final TextEditingController salaryController =
      TextEditingController(text: '');
  final TextEditingController formatController =
      TextEditingController(text: '');
  final TextEditingController timeTypeController =
      TextEditingController(text: '');
  final TextEditingController experienceController =
      TextEditingController(text: '');
  final TextEditingController descriptionController =
      TextEditingController(text: '');
  late String userId;

  @override
  void dispose() {
    positionController.dispose();
    salaryController.dispose();
    formatController.dispose();
    timeTypeController.dispose();
    experienceController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    if (widget.model != null) {
      positionController.text = widget.model!.title;
      salaryController.text = widget.model!.salary;
      formatController.text = widget.model!.format;
      timeTypeController.text = widget.model!.timeType;
      experienceController.text = widget.model!.experience;
      descriptionController.text = widget.model!.description;
    }
    initData();
  }

  Future<void> initData() async {
    userId = await getUserFieldNamed('id');
  }

  @override
  Widget build(BuildContext context) {
    // return BlocBuilder<CVBloc, CVState>(
    //   builder: (context, state) {
    //     if (state is CVCreateSuccess || state is CVUpdateSuccess) {
    //       WidgetsBinding.instance.addPostFrameCallback((_) {
    //         Navigator.pushReplacementNamed(context, MyCVsScreen.id);
    //       });
    //     }
    //     if (state is CVCreateFail) {
    //       WidgetsBinding.instance.addPostFrameCallback((_) {
    //         showDialog(
    //             context: context,
    //             builder: (context) => AlertDialog(
    //                   title: Text(state.model.message),
    //                 ));
    //       });
    //     }
    //     if (state is CVUpdateFail) {
    //       WidgetsBinding.instance.addPostFrameCallback((_) {
    //         showDialog(
    //             context: context,
    //             builder: (context) => AlertDialog(
    //                   title: Text(state.model.message),
    //                 ));
    //       });
    //     }
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
            title: "Зарплатня",
            controller: salaryController,
            //   validator: Validator.validatePatronimyc,
          ),
          const SizedBox(
            height: 15,
          ),
          FormFieldText(
            title: "Формат",
            controller: formatController,
            //  validator: Validator.validateSurname,
          ),
          const SizedBox(
            height: 15,
          ),
          FormFieldText(
            title: "Зайнятість",
            controller: timeTypeController,
            //  validator: Validator.validateSurname,
          ),
          const SizedBox(
            height: 15,
          ),
          FormFieldText(
            title: "Досвід",
            controller: experienceController,
            //  validator: Validator.validateSurname,
          ),
          const SizedBox(
            height: 15,
          ),
          FormFieldText(
            title: "Опис",
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
              text: "Додати вакансію",
              onTap: () {
                // if (widget.isUpdate) {
                //   print(widget.model!.id);
                //   var model = CVModel(
                //       userId: userId,
                //       id: widget.model!.id,
                //       position: positionController.text,
                //       city: cityController.text,
                //       description: descriptionController.text);
                //   context
                //       .read<CVBloc>()
                //       .add(CVUpdateInitiateEvent(model: model));
                // } else {
                //   var model = CVModel(
                //       userId: userId,
                //       position: positionController.text,
                //       city: cityController.text,
                //       description: descriptionController.text);
                //   context
                //       .read<CVBloc>()
                //       .add(CVCreateInitiateEvent(model: model));
                // }
              },
              color: crimsonColor,
              textColor: whiteColor,
            ),
          )
        ],
      ),
    ));
    //   },
    // );
  }
}
