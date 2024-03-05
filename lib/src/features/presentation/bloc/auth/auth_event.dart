part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class IsSignInEvent extends AuthEvent {}

class LoggedInEvent extends AuthEvent {}

class LogoutEvent extends AuthEvent {}

