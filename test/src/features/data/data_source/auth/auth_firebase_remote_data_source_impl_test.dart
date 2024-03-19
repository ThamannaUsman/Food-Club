import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:food_club/src/features/data/data_source/auth/auth_firebase_remote_data_source_impl.dart';
import 'package:food_club/src/features/domain/entities/auth_entity.dart';
import 'package:mocktail/mocktail.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockUserCredential extends Mock implements UserCredential {}

class MockUser extends Mock implements User {}

void main() {
  late AuthFirebaseRemoteDataSourceImpl dataSource;
  late MockFirebaseAuth mockFirebaseAuth;
  late MockUserCredential mockUserCredential;
  late MockUser mockUser;
  setUp(() {
    mockFirebaseAuth = MockFirebaseAuth();
    mockUserCredential = MockUserCredential();
    mockUser = MockUser();
    dataSource = AuthFirebaseRemoteDataSourceImpl(mockFirebaseAuth);
  });
  group('AuthFirebaseRemoteDataSourceImpl', () {
    test('forgotPassword sends password reset email', () async {
      // Arrange
      final email = 'sample@gmail.com';
      when(() => mockFirebaseAuth.sendPasswordResetEmail(email: email))
          .thenAnswer((_) => Future.value());

      // Act
      await dataSource.forgotPassword(email);

      // Assert
      verify(() => mockFirebaseAuth.sendPasswordResetEmail(email: email))
          .called(1);
    });
    test('getCurrentUserId returns user ID', () async {
      // Arrange
      when(() => mockUser.uid).thenReturn('testUid');
      when(() => mockFirebaseAuth.currentUser).thenReturn(mockUser);

      // Act
      final result = await dataSource.getCurrentUserId();

      // Assert
      expect(result, 'testUid');
    });

    group('isLogIn', () {
      test('isSignIn returns true if user is authenticated', () async {
        // Arrange
        when(() => mockUser.uid).thenReturn('testUid');
        when(() => mockFirebaseAuth.currentUser).thenReturn(mockUser);

        // Act
        final result = await dataSource.isSignIn();

        // Assert
        expect(result, true);
      });

      test('isSignIn returns true if user is not authenticated', () async {
        //Arrange
        when(() => mockFirebaseAuth.currentUser).thenReturn(null);

        // Act
        final result = await dataSource.isSignIn();

        // Assert
        expect(result, false);
      });
    });

    test('logIn calls signInWithEmailAndPassword with correct credentials',
        () async {
      // Arrange
      final userEntity =
          UserEntity(email: 'test@example.com', password: 'password123');

      when(() => mockFirebaseAuth.signInWithEmailAndPassword(
              email: userEntity.email!, password: userEntity.password!))
          .thenAnswer((_) async => mockUserCredential);

      // Act
      await dataSource.logIn(userEntity);

      // Assert
      verify(() => mockFirebaseAuth.signInWithEmailAndPassword(
          email: userEntity.email!, password: userEntity.password!)).called(1);
    });

    test('logOut', () async {
      // Arrange
      when(() => mockFirebaseAuth.signOut()).thenAnswer((_) => Future.value());

      // Act
      await dataSource.logOut();

      // Assert
      verify(() => mockFirebaseAuth.signOut()).called(1);
    });

    test('signUp calls createUserWithEmailAndPassword with correct credentials',
        () async {
      // Arrange
      final userEntity =
          UserEntity(email: 'test@example.com', password: 'password123');

      when(() => mockFirebaseAuth.createUserWithEmailAndPassword(
              email: userEntity.email!, password: userEntity.password!))
          .thenAnswer((_) async => mockUserCredential);

      // Act
      await dataSource.signUp(userEntity);

      // Assert
      verify(() => mockFirebaseAuth.createUserWithEmailAndPassword(
          email: userEntity.email!, password: userEntity.password!)).called(1);
    });
  });
}
