import 'package:event_verify/ViewModels/AuthCubit/SignUpCubit/sign_up_cubit.dart';
import 'package:event_verify/Views/Auth/SignUp/sign_up_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(
        _formKey,
        _emailController,
        _passwordController,
      ),
      child: const SignUpBuilder(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _formKey.currentState?.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    debugPrint("SİGNUP KAPATILDI");
  }
}
