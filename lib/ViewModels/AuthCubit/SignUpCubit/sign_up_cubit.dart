import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.formKey, this.emailController, this.passwordController)
      : super(const SignUpFormState()) {
    _signUpInit();
  }

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  void _signUpInit() async {}

  void onLogin() {
    if (formKey.currentState!.validate()) {
      debugPrint(emailController.text);
      debugPrint(passwordController.text);
    }
    emailController.clear();
    passwordController.clear();
  }
}
