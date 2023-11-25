part of 'cv_bloc.dart';

sealed class CVState {}

final class CVInitial extends CVState {}

final class CVCreateSuccess extends CVState{
  final SuccessModel model;
  CVCreateSuccess({required this.model});
}

final class CVCreateFail extends CVState {
  final SuccessModel model;
  CVCreateFail({required this.model});
}


final class CVGetSuccess extends CVState {
  final CVModel model;
  CVGetSuccess({required this.model});
}

final class CVGetFail extends CVState {
  final SuccessModel model;
  CVGetFail({required this.model});
}


final class CVGetAllSuccess extends CVState {
  final List<CVModel> models;
  CVGetAllSuccess({required this.models});
}

final class CVGetAllFail extends CVState {
  final SuccessModel model;
  CVGetAllFail({required this.model});
}


final class CVUpdateSuccess extends CVState {
  final SuccessModel model;
  CVUpdateSuccess({required this.model});
}

final class CVUpdateFail extends CVState {
  final SuccessModel model;
  CVUpdateFail({required this.model});
}



final class CVDeleteSuccess extends CVState {
  final SuccessModel model;
 CVDeleteSuccess({required this.model});
}

final class CVDeleteFail extends CVState {
  final SuccessModel model;
  CVDeleteFail(this.model);
}

