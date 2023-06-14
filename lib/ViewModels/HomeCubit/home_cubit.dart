import 'package:event_verify/Views/Home/Settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.scafoldKey) : super(const HomeInitialState()) {
    _homeInit();
  }

  final GlobalKey<ScaffoldState> scafoldKey;

  void _homeInit() async {
    emit(const HomeMotherState());
  }

  void openDrawer(BuildContext context) {
    scafoldKey.currentState!.openEndDrawer();
  }

  profileOnTap() {}

  void settingsOnTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const Settings(),
      ),
    );
  }
}
