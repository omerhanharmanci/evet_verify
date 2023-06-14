import 'package:event_verify/Models/user_response_model.dart';
import 'package:event_verify/Models/user_sign_up_model.dart';
import 'package:event_verify/Services/auth_base_service.dart';
import 'package:event_verify/Services/auth_firebase_service.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this.formKey, this.emailController, this.passwordController,
      this.userNameController)
      : super(const SignUpFormState()) {
    _signUpInit();
  }

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController userNameController;
  final AuthBaseService _auth = AuthFirebaseService();

  void _signUpInit() async {}

  void onLogin() async {
    if (formKey.currentState!.validate()) {
      emit(const SignUpBusyState());
      final userName = userNameController.text;
      final email = emailController.text;
      final password = passwordController.text;
      final model = UserSignUpModel(email, password, userName);
      await _signUpWithEmailAndPassword(model);
    }
    emailController.clear();
    passwordController.clear();
  }

  Future<void> _signUpWithEmailAndPassword(UserSignUpModel model) async {
    try {
      final user = await _auth.signUpWithEmailAndPassword(model);
      emit(SignUpDoneState(user));
    } catch (err) {
      debugPrint(err.toString());
      emit(SignUpErrorState(err.toString()));
    }
  }
}
