import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:work_ua/core/success_model.dart';
import 'package:work_ua/features/candidate/profile/data/cv_datasource.dart';
import 'package:work_ua/features/candidate/profile/domain/cv_model.dart';
import 'package:work_ua/features/candidate/search/data/job_model.dart';
import 'package:work_ua/features/candidate/search/data/search_datasource.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchDatasource datasource = SearchDatasource();
  final CVDatasource cvDatasource = CVDatasource();

  SearchBloc() : super(SearchInitial()) {
    on<InitiateSearchVacancyEvent>(_onSearchVacancy);
    on<InitiateGetVacancyEvent>(_onGetVacancy);
    on<InitiateCreateVacancyEvent>(_onCreateVacancy);
    on<InitiateSearchCVByQueryEvent>(_onGetCVByQuery);
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

  _onGetCVByQuery(event, emit) async {
    try {
      var data = await cvDatasource.readAllBySearchString(event.searchString);
      if (data is List<CVModel>) {
        if (data.isEmpty) {
          emit(SearchCVByQueryFailure(model: SuccessModel(false, 'No cvs', 0)));
        } else {
          emit(SearchCVByQuerySuccess(models: data));
        }
      }
    } catch (err) {
      emit(SearchCVByQueryFailure(
          model: SuccessModel(false, err.toString(), 0)));
    }
  }
}
