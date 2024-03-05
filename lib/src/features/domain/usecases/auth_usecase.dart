import 'package:food_club/src/features/data/repositories/auth_repository_impl.dart';
import 'package:food_club/src/features/domain/entities/auth_entity.dart';
import 'package:food_club/src/features/domain/repositories/auth_repository.dart';

class AuthUseCase {
  final AuthRepository authRepository = AuthRepositoryImpl();

  Future<void> signUp(UserEntity user) {
    return authRepository.signUp(user);
  }

  Future<void> forgotPassword(String email) {
    return authRepository.forgotPassword(email);
  }

  Future<void> logOut() {
    return authRepository.logOut();
  }

  Future<void> logIn(UserEntity user) {
    return authRepository.logIn(user);
  }

  Future<bool> isSignIn() async {
    return authRepository.isSignIn();
  }

  Future<void> getCreateCurrentUser(UserEntity user) {
    return authRepository.getCreateCurrentUser(user);
  }

  Future<String> getCurrentUserId() async {
    return authRepository.getCurrentUserId();
  }

  Future<void> updateUserDetail(UserEntity user) async {
    return authRepository.updateUserDetail(user);
  }
}
