import 'package:event_verify/ViewModels/InitCubit/init_cubit.dart';
import 'package:event_verify/Views/Auth/auth.dart';
import 'package:event_verify/Views/Home/home.dart';
import 'package:event_verify/Widgets/app_circular_progress_indicator.dart';
import 'package:event_verify/Widgets/error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppInitBuilder extends StatelessWidget {
  const AppInitBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InitCubit, InitState>(
      builder: (context, state) => _initBuild(context, state),
    );
  }

  _initBuild(BuildContext context, InitState state) {
    if (state is InitBusyState) {
      return const Scaffold(body: AppCircularProgressIndicator());
    } else if (state is InitErrorState) {
      return Scaffold(body: AppErrorWidget(message: state.message!));
    } else if (state is InitDoneState) {
      return state.model == null ? const Auth() : const Home();
    } else {
      return const Scaffold(
        body: AppErrorWidget(message: "BİLİNMEYEN HATA OLUŞTU"),
      );
    }
  }
}
