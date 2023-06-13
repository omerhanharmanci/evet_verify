import 'package:event_verify/ViewModels/AuthCubit/SignUpCubit/sign_up_cubit.dart';
import 'package:event_verify/Views/Auth/SignUp/sign_up_form.dart';
import 'package:event_verify/Widgets/app_circular_progress_indicator.dart';
import 'package:event_verify/Widgets/error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBuilder extends StatelessWidget {
  const SignUpBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) => _signUpBuilder(context, state),
    );
  }

  _signUpBuilder(BuildContext context, SignUpState state) {
    if(state is SignUpBusyState){
      return const AppCircularProgressIndicator();
    }else if(state is SignUpErrorState){
      return AppErrorWidget(message: state.message);
    }else if(state is SignUpFormState){
      return const SignUpForm();
    }else if(state is SignUpDoneState){
      return const AppErrorWidget(message: "GİRİŞ BAŞARILI");
    }
    else {
      return const AppErrorWidget(message: "BİLİNMEYEN BİR HATA OLUŞTU");
    }
  }
}
