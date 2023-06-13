part of '../SignUpCubit/sign_up_cubit.dart';

abstract class SignUpState {
  const SignUpState();
}

class SignUpFormState extends SignUpState {
  const SignUpFormState();
}

class SignUpBusyState extends SignUpState {
  const SignUpBusyState();
}

class SignUpErrorState extends SignUpState {
  const SignUpErrorState(this.message);
  final String message;
}

class SignUpDoneState extends SignUpState {
  const SignUpDoneState();
}
