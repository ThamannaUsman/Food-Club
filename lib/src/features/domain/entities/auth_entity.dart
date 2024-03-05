import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? name;
  final String? address;
  final String? phoneNumber;
  final String? email;
  final String? password;
  final String? uid;

  const UserEntity(
      {this.name,
      this.address,
      this.phoneNumber,
      this.email,
      this.password,
      this.uid});

  @override
  List<Object?> get props => [name, address, phoneNumber, email, password, uid];
}
