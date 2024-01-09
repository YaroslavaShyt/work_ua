part of 'cv_bloc.dart';

sealed class CVEvent extends Equatable {
  const CVEvent();
  @override
  List<Object?> get props => [];
}

class CVCreateInitiateEvent extends CVEvent {
 final CVModel model;
  const CVCreateInitiateEvent({required this.model});
  @override
  List<Object?> get props => [];
}

class CVReadInitiateEvent extends CVEvent {
  final String id;
  const CVReadInitiateEvent({required this.id});
}

class CVReadAllInitiateEvent extends CVEvent {
  final Map<String, dynamic> conditions;
  const CVReadAllInitiateEvent({required this.conditions});
}

class CVUpdateInitiateEvent extends CVEvent {
  final CVModel model;
  const CVUpdateInitiateEvent({required this.model});
}

class CVDeleteInitiateEvent extends CVEvent {
  final String id;
  const CVDeleteInitiateEvent({required this.id});
}
