part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationState {}

final class AuthenticationInitial extends AuthenticationState {}

final class AuthenticationSuccess extends AuthenticationState {
  final UserRegisterModel model;
  AuthenticationSuccess(this.model);
}

final class AuthenticationFail extends AuthenticationState {
  final SuccessModel model;
  AuthenticationFail(this.model);
}
