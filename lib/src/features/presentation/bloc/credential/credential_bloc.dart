import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:food_club/src/core/constants/firebase_const.dart';
import 'package:food_club/src/features/domain/entities/auth_entity.dart';

part 'credential_event.dart';

part 'credential_state.dart';

class CredentialBloc extends Bloc<CredentialEvent, CredentialState> {
  CredentialBloc() : super(CredentialInitial()) {
    on<LoginEvent>(_loginEvent);
    on<SignUpEvent>(_signUpEvent);
    on<ForgotPasswordEvent>(_forgotPasswordEvent);
    on<UpdateUserDetailsEvent>(_updateUserDetailsEvent);
  }

  void _loginEvent(LoginEvent event, Emitter<CredentialState> emit) async {
    emit(CredentialLoading());
    try {
      await authUseCase.logIn(event.user);
      emit(CredentialLoaded());
    } on FirebaseAuthException catch (e) {
      emit(CredentialError(errorMessage: e.message.toString()));
    }
  }

  void _signUpEvent(SignUpEvent event, Emitter<CredentialState> emit) async {
    emit(CredentialLoading());
    try {
      await authUseCase.signUp(event.user);
      await authUseCase.getCreateCurrentUser(event.user);
      emit(CredentialLoaded());
    } on FirebaseAuthException catch (e) {
      emit(CredentialError(errorMessage: e.message.toString()));
    }
  }

  void _forgotPasswordEvent(
      ForgotPasswordEvent event, Emitter<CredentialState> emit) async {
    try {
      authUseCase.forgotPassword(event.email);
    } on FirebaseAuthException catch (e) {
      emit(CredentialError(errorMessage: e.message.toString()));
    }
  }

  void _updateUserDetailsEvent(
      UpdateUserDetailsEvent event, Emitter<CredentialState> emit) async {
    try {
      await authUseCase.updateUserDetail(event.user);
      emit(CredentialLoaded());
    } on FirebaseAuthException catch (e) {
      emit(CredentialError(errorMessage: e.message.toString()));
    }
  }
}
