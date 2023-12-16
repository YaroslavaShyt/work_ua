import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:work_ua/core/success_model.dart';
import 'package:work_ua/features/authorization/data/datasources/datasource.dart';
import 'package:work_ua/features/authorization/data/models/login_model.dart';
import 'package:work_ua/features/authorization/data/models/user_register_model.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationDatasource datasource = AuthenticationDatasource();

  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<AuthenticationInitiateEvent>(_onAuthenticationEvent);
    on<LoginInitiateEvent>(_onLoginEvent);
  }

  void _onAuthenticationEvent(event, emit) async {
    try {
      //print("${event.model} in bloc");
      var result =
          await datasource.register(event.model);
      if (result is UserRegisterModel) {
        emit(AuthenticationSuccess(result));
      } else {
        emit(AuthenticationFail(result));
      }
    } catch (e) {
      emit(AuthenticationFail(SuccessModel(false, e.toString(), 0)));
    }
  }

  void _onLoginEvent(event, emit) async {
    print('in ligin bloc');
    try {
      var result = await datasource.logIn(event.model);
      if (result is UserRegisterModel) {
        emit(AuthenticationSuccess(result));
      } else {
        emit(AuthenticationFail(result));
      }
    } catch (e) {
      print(e);
      emit(AuthenticationFail(SuccessModel(false, e.toString(), 0)));
    }
  }
}
