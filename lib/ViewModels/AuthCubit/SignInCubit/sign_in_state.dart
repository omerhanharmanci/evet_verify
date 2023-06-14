part of 'sign_in_cubit.dart';

abstract class SignInState {
  const SignInState();
}

class SignInFormState extends SignInState {
  const SignInFormState();
}

class SignInBusyState extends SignInState {
  const SignInBusyState();
}

class SignInErrorState extends SignInState{
  const SignInErrorState(this.message);
  final String message;
}

class SignInDoneState extends SignInState {
  final UserResponseModel model;
  const SignInDoneState(this.model);
}

