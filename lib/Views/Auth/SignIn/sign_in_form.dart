import 'package:event_verify/ViewModels/AuthCubit/SignInCubit/sign_in_cubit.dart';
import 'package:event_verify/ViewModels/AuthCubit/auth_cubit.dart';
import 'package:event_verify/Widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Form(
      key: context.read<SignInCubit>().formKey,
      child: Column(
        children: [
          SizedBox(
            height: height * 0.2,
          ),
          AppTextFormField(
            labelText: "EMAİL",
            hintText: "LÜTFEN BİR EMAİL GİRİNİZ",
            controller: context.read<SignInCubit>().emailController,
            keyboardType: TextInputType.emailAddress,
          ),
          AppTextFormField(
            labelText: "PASSWORD",
            hintText: "LÜTFEN ŞİFRENİZİ GİRİNİZ",
            controller: context.read<SignInCubit>().passwordController,
            obscureText: true,
          ),
          ElevatedButton(
            onPressed: () => context.read<SignInCubit>().loginOnPressed(),
            child: const Text("GİRİŞ YAP"),
          ),
          SizedBox(
            height: height * 0.005,
          ),
          TextButton(
            onPressed: () => context.read<AuthCubit>().goSignUpPage(),
            child: const Text("Hesabın yok mu? Kayıt ol"),
          ),
        ],
      ),
    );
  }
}
