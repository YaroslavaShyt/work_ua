part of 'job_bloc.dart';

sealed class JobEvent extends Equatable {
  const JobEvent();

  @override
  List<Object> get props => [];
}

class InitiateCreateJobEvent extends JobEvent{}

class InitiateEditJobEvent extends JobEvent{}

class InitiateDeleteEvent extends JobEvent{}

class InitiateGetJobEvent extends JobEvent{}

class InitiateGetJobsEvent extends JobEvent{}
