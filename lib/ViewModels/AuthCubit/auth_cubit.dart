
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthInitialState()){
    _authInit();
  }

  
  void _authInit() {
    emit(const AuthSignInState());
  }

  void goSignUpPage() => emit(const AuthSignUpState());

  
  void goSignInPage() => emit(const AuthSignInState());
}
