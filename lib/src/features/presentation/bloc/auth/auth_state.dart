part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthenticatedState extends AuthState {
  final String uid;

  const AuthenticatedState({required this.uid});

  @override
  List<Object> get props => [uid];
}

class UnAuthenticatedState extends AuthState {}
