


import 'package:event_verify/ViewModels/HomeCubit/home_cubit.dart';
import 'package:event_verify/Views/Home/home_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    debugPrint("HOME CUBİT AÇILDI");
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(_scaffoldKey),
      child: const HomeBuilder(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _scaffoldKey.currentState?.dispose();
    debugPrint("HOME CUBİT KAPANDI");

  }
}
