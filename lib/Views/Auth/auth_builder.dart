
import 'package:event_verify/ViewModels/AuthCubit/auth_cubit.dart';
import 'package:event_verify/Views/Auth/SignIn/sign_in.dart';
import 'package:event_verify/Views/Auth/SignUp/sign_up.dart';
import 'package:event_verify/Widgets/app_circular_progress_indicator.dart';
import 'package:event_verify/Widgets/error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBuilder extends StatelessWidget {
  const AuthBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) => _authBuilder(context, state),
    );
  }

  _authBuilder(BuildContext context, AuthState state) {
      if(state is AuthBusyState){
        return const AppCircularProgressIndicator();
      }else if(state is AuthErrorState){
        return AppErrorWidget(message: state.message);
      }else if(state is AuthSignInState){
        return const SignIn();
      }else if(state is AuthSignUpState){
        return const SignUp();
      }else {
        return const AppErrorWidget(message: "BİLİNMEYEN HATA");
      }
  }
}
