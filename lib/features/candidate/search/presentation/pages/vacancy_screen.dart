import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_ua/core/data/api_datasource.dart';
import 'package:work_ua/core/widgets/colors.dart';
import 'package:work_ua/core/services/shared_preferences/shared_pref_user.dart';
import 'package:work_ua/core/widgets/button.dart';
import 'package:work_ua/features/authorization/presentation/widgets/modal/modal_bottom_sheet_register.dart';
import 'package:work_ua/features/candidate/notifications/chat/domain/chat_model.dart';
import 'package:work_ua/features/candidate/notifications/chat/presentation/bloc/chat_bloc/chat_bloc.dart';
import 'package:work_ua/features/candidate/notifications/chat/presentation/bloc/message_bloc/message_bloc.dart';
import 'package:work_ua/features/candidate/notifications/chat/presentation/pages/chat_screen.dart';
import 'package:work_ua/features/candidate/profile/presentation/bloc/cv/cv_bloc.dart';
import 'package:work_ua/features/candidate/profile/presentation/widgets/my_cvs/my_cvs_list.dart';
import 'package:work_ua/features/candidate/search/data/job_model.dart';
import 'package:work_ua/features/candidate/search/presentation/widgets/cv_modal_bottom_sheet.dart';
import 'package:work_ua/features/candidate/search/presentation/widgets/cv_modal_list.dart';
import 'package:work_ua/features/candidate/search/presentation/widgets/vacancy_item_ovals_row.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class VacancyScreen extends StatefulWidget {
  static const id = "vacancy_screen";
  final JobModel model;
  const VacancyScreen({super.key, required this.model});

  @override
  State<VacancyScreen> createState() => _VacancyScreenState();
}

class _VacancyScreenState extends State<VacancyScreen> {
  late String userId;
  late IO.Socket socket;

  @override
  void initState() {
    super.initState();
    initData();
    // Підключення до сервера
    socket = IO.io(APIDatasource.url, <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });

    // Підключення до сервера при запуску
    socket.connect();
    socket.on('connect', (_) {
      print('Connected to the server');
    });

    socket.on('disconnect', (_) {
      print('Disconnected from the server');
    });

    // Слухаємо подію chat_created
    socket.on('chat_created', (data) {
      print('Received chat_created event: $data');
    });
  }

  void createChat() {
    // Отримуємо ідентифікатор користувача або якийсь інший унікальний ідентифікатор
    String userId = '657c5cc02de50f087767de49';

    // Надсилаємо подію chat_created на сервер
    socket.emit('chat_created', {'userId': userId});
    print('Chat created event sent');
  }

  Future<void> initData() async {
    userId = await getUserFieldNamed('id');
    context
        .read<CVBloc>()
        .add(CVReadAllInitiateEvent(conditions: {"userId": userId}));
  }

  @override
  Widget build(BuildContext context) {
    var formatColor, experienceColor, timeTypeColor;
    if (widget.model.format == 'remote') {
      formatColor = greenColor;
    } else {
      formatColor = redColor;
    }
    if (widget.model.experience == 'no required') {
      experienceColor = greenColor;
    } else {
      experienceColor = redColor;
    }
    if (widget.model.timeType == 'part time') {
      timeTypeColor = greenColor;
    } else {
      timeTypeColor = redColor;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueColor,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: whiteColor,
          ),
        ),
        title: Text(
          widget.model.title,
          style:
              const TextStyle(color: whiteColor, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Посада',
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w200),
              ),
              Text(
                widget.model.title,
                style: const TextStyle(
                    color: blackColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0),
              ),
              const Text(
                'Роботодавець',
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w200),
              ),
              Text(
                widget.model.user.title ?? '**no title',
                style: const TextStyle(fontSize: 20.0),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text("${widget.model.salary} грн",
                  style: const TextStyle(
                      color: blackColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0)),
              VacancyItemOvalsRow(
                experience: widget.model.experience,
                experienceColor: experienceColor,
                format: widget.model.format,
                formatColor: formatColor,
                timeType: widget.model.timeType,
                timeTypeColor: timeTypeColor,
              ),
              const Text(
                'Опис вакансії',
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w200),
              ),
              Text(
                widget.model.description,
                style: const TextStyle(fontSize: 16.0),
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                height: 50.0,
                width: MediaQuery.of(context).size.width,
                child: Button(
                  text: 'Відгукнутись',
                  textColor: whiteColor,
                  color: crimsonColor,
                  onTap: () => showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (BuildContext context) {
                      var cvBloc = context.read<CVBloc>();
                      // createChat();
                      if (cvBloc.state is CVGetAllSuccess) {
                        return MultiBlocProvider(
                           providers: [
                        //     BlocProvider(create: (context) => ChatBloc()),
                            BlocProvider(create: (context) => MessageBloc())
                           ],
                        child:
                        CVModalBottomSheetContent(
                          title: 'Мої резюме',
                          cvs: CVsModalList(
                            cvs: (cvBloc.state as CVGetAllSuccess).models,
                            chat: ChatModel(
                              position: widget.model.title,
                              id: widget.model.id,
                              companyName:
                                  widget.model.user.title ?? 'No title',
                              isGroupChat: true,
                              user: [userId, widget.model.user.id],
                              createdAt: DateTime(2023),
                              updatedAt: DateTime(2023),
                              v: 1,
                            ),
                          ),
                           ),
                        );
                      }
                      return const CircularProgressIndicator();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
