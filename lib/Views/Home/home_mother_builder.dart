import 'package:event_verify/ViewModels/HomeCubit/home_cubit.dart';
import 'package:event_verify/Views/Home/home_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeMotherBuilder extends StatelessWidget {
  const HomeMotherBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<HomeCubit>().scafoldKey,
      appBar: _homeAppbarBuilder(context),
      endDrawer: const HomeDrawer(),
    );
  }

  AppBar _homeAppbarBuilder(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: const Text("ANASAYFA"),
      actions: [
        InkWell(
          onTap: () => context.read<HomeCubit>().openDrawer(context),
          child: const Icon(Icons.menu),
        ),
      ],
    );
  }
}
