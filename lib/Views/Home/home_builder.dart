import 'package:event_verify/ViewModels/HomeCubit/home_cubit.dart';
import 'package:event_verify/Views/Home/home_mother_builder.dart';
import 'package:event_verify/Widgets/app_circular_progress_indicator.dart';
import 'package:event_verify/Widgets/error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBuilder extends StatelessWidget {
  const HomeBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) => _homeBodyBuilder(context, state),
    );
  }

  _homeBodyBuilder(BuildContext context, HomeState state) {
    if (state is HomeBusyState) {
      return const Scaffold(
        body: AppCircularProgressIndicator(),
      );
    } else if (state is HomeErrorState) {
      return Scaffold(
        body: AppErrorWidget(
          message: state.message,
        ),
      );
    }else if(state is HomeMotherState){
      return const HomeMotherBuilder();
    }else {
      return const AppErrorWidget(message: "BİLİNMEYEN HATA OLUŞTU");
    }
  }
}
