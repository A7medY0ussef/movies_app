import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.uid,
    required super.name,
    required super.email,
    required super.phoneNumber,
    required super.avatarPath,
  });

  factory UserModel.fromMap(
      Map<String, dynamic> map, {
        required String uid,
      }) {
    return UserModel(
      uid: uid,
      name: map['name'],
      email: map['email'],
      phoneNumber: map['phoneNumber'],
      avatarPath: map['avatarPath'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'avatarPath': avatarPath,
    };
  }
}