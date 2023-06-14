import 'package:event_verify/ViewModels/HomeCubit/home_cubit.dart';
import 'package:event_verify/ViewModels/InitCubit/init_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeDrawer extends Drawer {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Drawer(
      width: width * 0.4,
      child: ListView(
        children: [
          const DrawerHeader(
            child: Text("MENU"),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("PROFİL"),
            onTap: () => context.read<HomeCubit>().profileOnTap(),
          ),
          SizedBox(
            height: height * 0.005,
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("AYARLAR"),
            onTap: () => context.read<HomeCubit>().settingsOnTap(context),
          ),
          SizedBox(
            height: height * 0.05,
          ),
          TextButton(
            onPressed: () => context.read<InitCubit>().signOut(),
            child: const Text("ÇIKIŞ YAP"),
          ),
        ],
      ),
    );
  }
}
