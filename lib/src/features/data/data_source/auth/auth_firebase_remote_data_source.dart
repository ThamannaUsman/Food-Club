import 'package:food_club/src/features/domain/entities/auth_entity.dart';

abstract class AuthFirebaseRemoteDataSource {
  Future<void> logIn(UserEntity user);

  Future<void> signUp(UserEntity user);

  Future<bool> isSignIn();

  Future<void> logOut();

  Future<void> forgotPassword(String email);

  Future<void> getCreateCurrentUser(UserEntity user);

  Future<String> getCurrentUserId();

  Future<void> updateUserDetail(UserEntity user);
}
