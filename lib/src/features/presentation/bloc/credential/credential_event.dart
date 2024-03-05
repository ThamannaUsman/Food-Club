part of 'credential_bloc.dart';

abstract class CredentialEvent extends Equatable {
  const CredentialEvent();

  @override
  List<Object?> get props => [];
}

class LoginEvent extends CredentialEvent {
  final UserEntity user;

  const LoginEvent({required this.user});

  @override
  List<Object?> get props => [user];
}

class SignUpEvent extends CredentialEvent {
  final UserEntity user;

  const SignUpEvent({required this.user});

  @override
  List<Object?> get props => [user];
}

class OtpEvent extends CredentialEvent {}

class GoogleSignInEvent extends CredentialEvent {}

class ForgotPasswordEvent extends CredentialEvent {
  final String email;

  const ForgotPasswordEvent({required this.email});

  @override
  List<Object?> get props => [email];
}

class UpdateUserDetailsEvent extends CredentialEvent {
  final UserEntity user;

  const UpdateUserDetailsEvent({required this.user});

  @override
  List<Object?> get props => [user];
}
