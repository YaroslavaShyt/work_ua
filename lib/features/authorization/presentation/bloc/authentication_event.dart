part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();
  @override
  List<Object?> get props => [];
}

class AuthenticationInitiateEvent extends AuthenticationEvent {
  final UserRegisterModel model;
  const AuthenticationInitiateEvent({required this.model});
  @override
  List<Object?> get props => [];
}

class LoginInitiateEvent extends AuthenticationEvent{
  final LoginModel model;
  const LoginInitiateEvent({required this.model});
}