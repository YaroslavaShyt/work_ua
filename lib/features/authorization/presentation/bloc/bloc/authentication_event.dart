part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();
  @override
  List<Object?> get props => [];
}

class AuthenticationInitiateEvent extends AuthenticationEvent {
  const AuthenticationInitiateEvent();
  @override
  List<Object?> get props => [];
}
