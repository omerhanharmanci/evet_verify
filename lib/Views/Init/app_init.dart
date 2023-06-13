import 'package:event_verify/ViewModels/InitCubit/init_cubit.dart';
import 'package:event_verify/Views/Init/app_init_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppInit extends StatelessWidget {
  const AppInit({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<InitCubit>(
      create: (context) => InitCubit(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AppInitBuilder(),
      ),
    );
  }
}
