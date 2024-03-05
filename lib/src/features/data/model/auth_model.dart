import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_club/src/features/domain/entities/auth_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    final String? name,
    final String? address,
    final String? phoneNumber,
    final String? email,
    final String? uid,
  }) : super(
          name: name,
          address: address,
          phoneNumber: phoneNumber,
          email: email,
          uid: uid,
        );

  factory UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    return UserModel(
      name: snapshot.get('name'),
      address: snapshot.get('address'),
      phoneNumber: snapshot.get('phoneNumber'),
      email: snapshot.get('email'),
      uid: snapshot.get('uid'),
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      "name": name,
      "address": address,
      "phoneNumber": phoneNumber,
      "email": email,
      "uid": uid,
    };
  }
}
