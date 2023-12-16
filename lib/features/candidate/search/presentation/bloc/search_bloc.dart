import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:work_ua/core/success_model.dart';
import 'package:work_ua/features/candidate/search/data/job_model.dart';
import 'package:work_ua/features/candidate/search/data/search_datasource.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchDatasource datasource = SearchDatasource();
  SearchBloc() : super(SearchInitial()) {
    on<InitiateSearchVacancyEvent>(_onSearchVacancy);
    on<InitiateGetVacancyEvent>(_onGetVacancy);
    on<InitiateCreateVacancyEvent>(_onCreateVacancy);
  }

  _onSearchVacancy(event, emit) async {
    try {
      var data = await datasource.searchVacancy(event.searchString);
      if (data is List<JobModel>) {
        if (data.isNotEmpty) {
          emit(SearchVacancySuccess(models: data));
        } 
      } else {
        emit(SearchVacancyFailure(model: data));
      }
    } catch (err) {
      emit(SearchVacancyFailure(model: SuccessModel(false, err.toString(), 0)));
    }
  }

  _onCreateVacancy(event, emit) async {
    try {
      var data = await datasource.createVacancy(event.model);
      if (data is JobModel) {
        emit(CreateVacancySuccess(model: data));
      } else {
        emit(CreateVacancyFailure(model: data));
      }
    } catch (err) {
      emit(CreateVacancyFailure(model: SuccessModel(false, err.toString(), 0)));
    }
  }

  _onGetVacancy(event, emit) async {
    try {
      var data = await datasource.getVacancy(event.id);
      if (data is JobModel) {
        emit(CreateVacancySuccess(model: data));
      } else {
        emit(CreateVacancyFailure(model: data));
      }
    } catch (err) {
      emit(CreateVacancyFailure(model: SuccessModel(false, err.toString(), 0)));
    }
  }
}
