import 'package:event_verify/ViewModels/AuthCubit/SignInCubit/sign_in_cubit.dart';
import 'package:event_verify/Views/Auth/SignIn/sign_in_form.dart';
import 'package:event_verify/Widgets/app_circular_progress_indicator.dart';
import 'package:event_verify/Widgets/error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBuilder extends StatelessWidget {
  const SignInBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInCubit, SignInState>(
      builder: (context, state) => _signInBuilder(context, state),
    );
  }

  _signInBuilder(BuildContext context, SignInState state) {
    if (state is SignInBusyState) {
      return const AppCircularProgressIndicator();
    } else if (state is SignInErrorState) {
      return AppErrorWidget(message: state.message);
    } else if (state is SignInFormState) {
      return const SignInForm();
    } else {
      return const AppErrorWidget(message: "bilinmeyen hata");
    }
  }
}
