import 'package:event_verify/Models/user_sign_in_model.dart';
import 'package:event_verify/Models/user_sign_up_model.dart';

abstract class AuthBaseService {
  Future getCurrentUser();
  Future signUpWithEmailAndPassword(UserSignUpModel model);
  Future signInWhithEmailAndPassword(UserSignInModel model);
  Future signOut();
}
