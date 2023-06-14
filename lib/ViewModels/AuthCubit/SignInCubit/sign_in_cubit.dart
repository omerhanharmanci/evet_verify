import 'package:event_verify/Models/user_response_model.dart';
import 'package:event_verify/Models/user_sign_in_model.dart';
import 'package:event_verify/Services/auth_base_service.dart';
import 'package:event_verify/Services/auth_firebase_service.dart';
import 'package:event_verify/Views/Auth/SignUp/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this.formKey, this.emailController, this.passwordController)
      : super(const SignInFormState());

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final AuthBaseService _auth = AuthFirebaseService();

  void loginOnPressed() async {
    if (formKey.currentState!.validate()) {
      emit(const SignInBusyState());
      final email = emailController.text;
      final password = passwordController.text;
      final model = UserSignInModel(email, password);
      await _signInWithEmailAndPassword(model);
    }
    emailController.clear();
    passwordController.clear();
  }

  goSignUpPage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const SignUp(),
    ));
  }

  Future<void> _signInWithEmailAndPassword(UserSignInModel model) async {
    try {
      var user = await _auth.signInWhithEmailAndPassword(model);
      emit(SignInDoneState(user));
    } catch (err) {
      debugPrint(err.toString());
      emit(SignInErrorState(err.toString()));
    }
  }
}
