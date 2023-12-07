part of 'user_bloc.dart';

sealed class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

final class UserInitial extends UserState {}

final class GetUserSuccess extends UserState {
  final UserRegisterModel userModel;
  const GetUserSuccess({required this.userModel});
}

final class GetUserFailure extends UserState {
  final SuccessModel successModel;
  const GetUserFailure({required this.successModel});
}
