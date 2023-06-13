import 'package:event_verify/ViewModels/AuthCubit/SignUpCubit/sign_up_cubit.dart';
import 'package:event_verify/ViewModels/AuthCubit/auth_cubit.dart';
import 'package:event_verify/Widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Form(
      key: context.read<SignUpCubit>().formKey,
      child: Column(
        children: [
          SizedBox(
            height: height * 0.2,
          ),
          AppTextFormField(
            labelText: "EMAİL",
            hintText: "LÜTFEN EMAİL İNİZİ GİRİNİZ",
            controller: context.read<SignUpCubit>().emailController,
            keyboardType: TextInputType.emailAddress,
          ),
          AppTextFormField(
            labelText: "PASSWORD",
            hintText: "LÜTFEN ŞİFRENİZİ GİRİNİZ",
            controller: context.read<SignUpCubit>().passwordController,
            obscureText: true,
          ),
          ElevatedButton(
            onPressed: () => context.read<SignUpCubit>().onLogin(),
            child: const Text("KAYIT OL"),
          ),
          SizedBox(
            height: height * 0.005,
          ),
          TextButton(
            onPressed: () => context.read<AuthCubit>().goSignInPage(),
            child: const Text("Hesabın var mı? Giriş Yap"),
          ),
        ],
      ),
    );
  }
}
