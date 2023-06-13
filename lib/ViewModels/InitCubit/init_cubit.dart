import 'package:event_verify/Models/user_token_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'init_state.dart';

class InitCubit extends Cubit<InitState> {
  InitCubit() : super(const InitInitialState()) {
    _appInit();
  }
  late final UserTokenModel? token;

  void _appInit() async {
    emit(const InitBusyState());
    await Future.delayed(const Duration(seconds: 3));
    emit(const InitDoneState(null));
  }
}
