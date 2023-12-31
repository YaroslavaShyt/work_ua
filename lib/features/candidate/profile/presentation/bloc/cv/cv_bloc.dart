import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:work_ua/core/data/success_model.dart';
import 'package:work_ua/features/candidate/profile/data/cv_datasource.dart';
import 'package:work_ua/features/candidate/profile/domain/cv_model.dart';

part 'cv_event.dart';
part 'cv_state.dart';

class CVBloc extends Bloc<CVEvent, CVState> {
  final datasource = CVDatasource();

  CVBloc() : super(CVInitial()) {
    on<CVCreateInitiateEvent>(_onCvCreateInitiateEvent);
    on<CVReadAllInitiateEvent>(_onCvReadAllInitiateEvent);
    on<CVDeleteInitiateEvent>(_onCvDeleteInitiateEvent);
    on<CVUpdateInitiateEvent>(_onCvUpdateInitiateEvent);
    on<CVReadInitiateEvent>(_onCvReadInitiateEvent);
  }

  _onCvCreateInitiateEvent(event, emit) async {
    try {
      var result = await datasource.create(event.model);
      if (result.success == true) {
        emit(CVCreateSuccess(model: result));
      } else {
        emit(CVCreateFail(model: result));
      }
    } catch (error) {
      emit(CVCreateFail(model: SuccessModel(false, error.toString(), 0)));
    }
  }

  _onCvReadAllInitiateEvent(event, emit) async {
    try {
      var result = await datasource.readAll(event.conditions);
      if (result is List<CVModel>) {
        //print(result);
        emit(CVGetAllSuccess(models: result));
      } else {
        emit(CVGetAllFail(model: result));
      }
    } catch (error) {
      emit(CVGetAllFail(model: SuccessModel(false, error.toString(), 0)));
    }
  }

  _onCvReadInitiateEvent(event, emit) async {
    try {
      var result = await datasource.read(event.id);
      if (result is CVModel) {
        //print(result);
        emit(CVGetSuccess(model: result));
      } else {
        emit(CVGetFail(model: result));
      }
    } catch (error) {
      emit(CVGetFail(model: SuccessModel(false, error.toString(), 0)));
    }
  }

  _onCvDeleteInitiateEvent(event, emit) async {
    try {
      var result = await datasource.delete(event.id);
      if (result.success == true) {
        // print(result);
        emit(CVDeleteSuccess(model: result));
      } else {
        emit(CVDeleteFail(result));
      }
    } catch (error) {
      emit(CVDeleteFail(SuccessModel(false, error.toString(), 0)));
    }
  }

  _onCvUpdateInitiateEvent(event, emit) async {
    try {
      var result = await datasource.update(event.model);
      if (result.success == true) {
        // print(result);
        emit(CVUpdateSuccess(model: result));
      } else {
        emit(CVUpdateFail(model: result));
      }
    } catch (error) {
      emit(CVUpdateFail(model: SuccessModel(false, error.toString(), 0)));
    }
  }
}
