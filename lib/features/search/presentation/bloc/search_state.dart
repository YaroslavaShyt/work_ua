part of 'search_bloc.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

final class SearchInitial extends SearchState {}

class SearchVacancySuccess extends SearchState {
  final List<JobModel> models;
  const SearchVacancySuccess({required this.models});
}

class SearchVacancyFailure extends SearchState {
  final SuccessModel model;
  const SearchVacancyFailure({required this.model});
}

class CreateVacancySuccess extends SearchState {
  final JobModel model;
  const CreateVacancySuccess({required this.model});
}

class CreateVacancyFailure extends SearchState {
  final SuccessModel model;
  const CreateVacancyFailure({required this.model});
}

class GetVacancySuccess extends SearchState {
  final JobModel model;
  const GetVacancySuccess({required this.model});
}

class GetVacancyFailure extends SearchState {
  final SuccessModel model;
  const GetVacancyFailure({required this.model});
}
