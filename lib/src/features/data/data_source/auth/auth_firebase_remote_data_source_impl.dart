import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_club/src/core/constants/firebase_const.dart';
import 'package:food_club/src/features/data/data_source/auth/auth_firebase_remote_data_source.dart';
import 'package:food_club/src/features/data/model/auth_model.dart';

import '../../../domain/entities/auth_entity.dart';

class AuthFirebaseRemoteDataSourceImpl implements AuthFirebaseRemoteDataSource {

  @override
  Future<void> forgotPassword(String email) async {
    await auth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<void> getCreateCurrentUser(UserEntity user) async {
    final userCollections= FirebaseFirestore.instance.collection("users");
    final uid = await getCurrentUserId();
   userCollections.doc(uid).get().then((userDoc) {
      final newUsers = UserModel(
              name: user.name,
              address: user.address,
              phoneNumber: user.phoneNumber,
              email: user.email,
              uid: uid)
          .toDocument();
      if (!userDoc.exists) {
        userCollections.doc(uid).set(newUsers);
      }
      return;
    });
  }

  @override
  Future<String> getCurrentUserId() async => auth.currentUser!.uid;

  @override
  Future<bool> isSignIn() async => auth.currentUser?.uid != null;

  @override
  Future<void> logIn(UserEntity user) async {
    await auth.signInWithEmailAndPassword(
        email: user.email!, password: user.password!);
  }

  @override
  Future<void> logOut() async {
    await auth.signOut();
  }

  @override
  Future<void> signUp(UserEntity user) async {
    await auth.createUserWithEmailAndPassword(
        email: user.email!, password: user.password!);
  }

  @override
  Future<void> updateUserDetail(UserEntity user) async {
    var store = userCollection.doc(auth.currentUser!.uid);
    await store.set({
      'name': user.name,
      'address': user.address,
      'phoneNumber': user.phoneNumber
    }, SetOptions(merge: true));
  }
}
