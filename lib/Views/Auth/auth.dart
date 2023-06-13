import 'package:event_verify/ViewModels/AuthCubit/auth_cubit.dart';
import 'package:event_verify/Views/Auth/auth_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  @override
  void initState() {
    super.initState();
    debugPrint("AUTH CUBİT AÇILDI");
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: const Scaffold(
        body: AuthBuilder(),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    debugPrint("AUTH CUBİT KAPANDI");
  }
}
