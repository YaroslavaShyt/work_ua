part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationState {}

final class AuthenticationInitial extends AuthenticationState {}

final class AuthenticationSuccess extends AuthenticationState {}

final class AuthenticationFail extends AuthenticationState {}
