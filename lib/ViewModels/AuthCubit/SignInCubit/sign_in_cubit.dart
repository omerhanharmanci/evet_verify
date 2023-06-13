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

  loginOnPressed() {
    if (formKey.currentState!.validate()) {
      debugPrint(emailController.text);
      debugPrint(passwordController.text);
    }
    emailController.clear();
    passwordController.clear();
  }

  goSignUpPage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const SignUp(),
    ));
  }
}
