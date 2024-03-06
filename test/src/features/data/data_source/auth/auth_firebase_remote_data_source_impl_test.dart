//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:food_club/src/core/constants/firebase_const.dart';
// import 'package:food_club/src/features/data/data_source/auth/auth_firebase_remote_data_source_impl.dart';
// import 'package:food_club/src/features/domain/entities/auth_entity.dart';
// import 'package:mocktail/mocktail.dart';
//
// class MockFirebaseAuth extends Mock implements FirebaseAuth {}
//
// void main() {
//  late MockFirebaseAuth mockFirebaseAuth;
//  late AuthFirebaseRemoteDataSourceImpl authDataSource;
//
//   setUp(() {
//     mockFirebaseAuth = MockFirebaseAuth();
//     auth= mockFirebaseAuth;
//     authDataSource = AuthFirebaseRemoteDataSourceImpl();
//   });
//
//   group('FirebaseAuth', () {
//     test('should call sendPasswordResetEmail with correct email', () async {
//       // Arrange
//       when(()=>mockFirebaseAuth.sendPasswordResetEmail(email:any(named: 'email')))
//           .thenAnswer((_) => Future.value());
//       const String email = 'test@example.com';
//       // Act
//       await authDataSource.forgotPassword(email);
//       // Assert
//       verify(()=>mockFirebaseAuth.sendPasswordResetEmail(email: email)).called(1);
//     });
//   });
//
// }