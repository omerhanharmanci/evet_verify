import 'package:event_verify/ViewModels/AuthCubit/SignInCubit/sign_in_cubit.dart';
import 'package:event_verify/Views/Auth/SignIn/sign_in_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(
        _formKey,
        _emailController,
        _passwordController,
      ),
      child: const SignInBuilder(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _formKey.currentState?.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    debugPrint("SİGNIN PAGE KAPANDI");
  }
}
