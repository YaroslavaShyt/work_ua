part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();
  @override
  List<Object?> get props => [];
}

class AuthenticationInitiateEvent extends AuthenticationEvent {
  final CandidateRegisterModel? modelCandidate;
  final CompanyRegisterModel? modelCompany;
  const AuthenticationInitiateEvent({this.modelCandidate, this.modelCompany});
  @override
  List<Object?> get props => [];
}

class LoginInitiateEvent extends AuthenticationEvent{
  final LoginModel model;
  const LoginInitiateEvent({required this.model});
}