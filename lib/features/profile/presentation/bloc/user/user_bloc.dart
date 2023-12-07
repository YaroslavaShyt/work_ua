import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:work_ua/core/success_model.dart';
import 'package:work_ua/features/authorization/data/models/user_register_model.dart';
import 'package:work_ua/features/profile/data/user_datasource.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final datasource = UserDatasource();
  UserBloc() : super(UserInitial()) {
    on<UserEvent>(_onGetUserEvent);
  }

  _onGetUserEvent(event, emit)async {
    try {
     var data = await datasource.read(event.userId);
     if (data is SuccessModel){
      emit(GetUserFailure(successModel: data));
     }else{
      emit(GetUserSuccess(userModel: data));
     }
    } catch (error) {
     emit(GetUserFailure(successModel: SuccessModel(false, error.toString(), 0)));
    }
  }
}
