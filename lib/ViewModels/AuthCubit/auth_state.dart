part of 'auth_cubit.dart';

abstract class AuthState {
  const AuthState();
}

class AuthInitialState extends AuthState {
  const AuthInitialState();
}

class AuthBusyState extends AuthState {
  const AuthBusyState();
}

class AuthSignInState extends AuthState {
  const AuthSignInState();
}

class AuthSignUpState extends AuthState {
  const AuthSignUpState();
}

class AuthErrorState extends AuthState {
  const AuthErrorState(this.message);

  final String message;
}
