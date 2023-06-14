import 'package:event_verify/Models/user_response_model.dart';
import 'package:event_verify/Models/user_sign_in_model.dart';
import 'package:event_verify/Models/user_sign_up_model.dart';
import 'package:event_verify/Services/auth_base_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthFirebaseService extends AuthBaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<UserResponseModel?> getCurrentUser() async {
    try {
      var user = _auth.currentUser;
      return user != null ? UserResponseModel.fromFirebaseUser(user) : null;
    } on FirebaseAuthException catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (_) {
      rethrow;
    }
  }

  @override
  Future<UserResponseModel?> signInWhithEmailAndPassword(
      UserSignInModel model) async {
    try {
      var userCredential = await _auth.signInWithEmailAndPassword(
        email: model.email,
        password: model.password,
      );
      return userCredential.user != null
          ? UserResponseModel.fromFirebaseUser(userCredential.user)
          : null;
    } on FirebaseAuthException catch (_) {
      rethrow;
    }
  }

  @override
  Future<UserResponseModel?> signUpWithEmailAndPassword(
      UserSignUpModel model) async {
    try {
      var userCredential = await _auth.createUserWithEmailAndPassword(
        email: model.email,
        password: model.password,
      );
      await userCredential.user!.updateDisplayName(model.name);
      return userCredential.user != null
          ? UserResponseModel.fromFirebaseUser(userCredential.user)
          : null;
    } on FirebaseAuthException catch (_) {
      rethrow;
    }
  }
}
