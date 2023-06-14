import 'package:firebase_auth/firebase_auth.dart';

class UserResponseModel {
  final String? uid;
  final String? name;
  final String? email;

  factory UserResponseModel.fromFirebaseUser(User? user) =>
      UserResponseModel(user?.uid, user?.displayName, user?.email);

  UserResponseModel(this.uid, this.name, this.email);
}
