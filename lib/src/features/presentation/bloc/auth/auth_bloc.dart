
import 'dart:io';

import 'package:equatable/equatable.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_club/src/core/constants/firebase_const.dart';


part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<IsSignInEvent>(_isSignInEvent);
    on<LoggedInEvent>(_loggedInEvent);
    on<LogoutEvent>(_logOutEvent);
  }

  void _isSignInEvent(IsSignInEvent event, Emitter<AuthState> emit) async {
    try {
      final isSignIn = await authUseCase.isSignIn();
      if (isSignIn) {
        final uid = await authUseCase.getCurrentUserId();
        emit(AuthenticatedState(uid: uid));
      } else {
        emit(UnAuthenticatedState());
      }
    } on SocketException catch (_) {
      emit(UnAuthenticatedState());
    }
  }

  void _loggedInEvent(LoggedInEvent event, Emitter<AuthState> emit) async {
    try {
      final uid = await authUseCase.getCurrentUserId();
      emit(AuthenticatedState(uid: uid));
    } catch (_) {
      emit(UnAuthenticatedState());
    }
  }

  void _logOutEvent(LogoutEvent event, Emitter<AuthState> emit) async {
    try {
      await authUseCase.logOut();
      emit(UnAuthenticatedState());
    } catch (_) {
      emit(UnAuthenticatedState());
    }
  }
}
