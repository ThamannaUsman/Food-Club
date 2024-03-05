part of 'credential_bloc.dart';

abstract class CredentialState extends Equatable {
  const CredentialState();

  @override
  List<Object?> get props => [];
}

class CredentialInitial extends CredentialState {}

class CredentialLoading extends CredentialState {}

class CredentialLoaded extends CredentialState {}

class CredentialError extends CredentialState {
  final String errorMessage;

const  CredentialError({required this.errorMessage});
}
