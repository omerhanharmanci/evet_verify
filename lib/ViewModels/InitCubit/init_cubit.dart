import 'package:event_verify/Models/user_response_model.dart';
import 'package:event_verify/Services/auth_base_service.dart';
import 'package:event_verify/Services/auth_firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'init_state.dart';

class InitCubit extends Cubit<InitState> {
  InitCubit() : super(const InitInitialState()) {
    _appInit();
  }

  final AuthBaseService _auth = AuthFirebaseService();

  void _appInit() async {
    emit(const InitBusyState());
    await _getCurrentUser();
  }

  void goHome(UserResponseModel model) => emit(InitDoneState(model));

  void signOut() async {
    try {
      await _auth.signOut();
      emit(const InitDoneState(null));
    } catch (err) {
      debugPrint(err.toString());
      emit(InitErrorState(err.toString()));
    }
  }

  Future<void> _getCurrentUser() async {
    try {
      var model = await _auth.getCurrentUser();
      emit(InitDoneState(model));
    } catch (err) {
      debugPrint(err.toString());
      emit(InitErrorState(err.toString()));
    }
  }
}
