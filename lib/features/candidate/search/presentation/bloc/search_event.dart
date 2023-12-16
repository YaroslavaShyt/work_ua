part of 'search_bloc.dart';

sealed class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class InitiateSearchVacancyEvent extends SearchEvent {
  final String searchString;
  const InitiateSearchVacancyEvent({required this.searchString});
}

class InitiateCreateVacancyEvent extends SearchEvent {
  final JobModel model;
  const InitiateCreateVacancyEvent({required this.model});
}

class InitiateGetVacancyEvent extends SearchEvent {
  final String id;
  const InitiateGetVacancyEvent({required this.id});
}
