import 'package:food_club/src/core/constants/firebase_const.dart';
import 'package:food_club/src/features/data/data_source/auth/auth_firebase_remote_data_source.dart';
import 'package:food_club/src/features/data/data_source/auth/auth_firebase_remote_data_source_impl.dart';
import 'package:food_club/src/features/domain/entities/auth_entity.dart';
import 'package:food_club/src/features/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthFirebaseRemoteDataSource remoteDataSource =
      AuthFirebaseRemoteDataSourceImpl(authentication);

  @override
  Future<void> forgotPassword(String email) async =>
      await remoteDataSource.forgotPassword(email);

  @override
  Future<void> getCreateCurrentUser(UserEntity user) async =>
      await remoteDataSource.getCreateCurrentUser(user);

  @override
  Future<String> getCurrentUserId() async =>
      await remoteDataSource.getCurrentUserId();

  @override
  Future<bool> isSignIn() async => await remoteDataSource.isSignIn();

  @override
  Future<void> logIn(UserEntity user) async =>
      await remoteDataSource.logIn(user);

  @override
  Future<void> logOut() async => await remoteDataSource.logOut();

  @override
  Future<void> signUp(UserEntity user) async =>
      await remoteDataSource.signUp(user);

  @override
  Future<void> updateUserDetail(UserEntity user) async =>
      await remoteDataSource.updateUserDetail(user);
}
