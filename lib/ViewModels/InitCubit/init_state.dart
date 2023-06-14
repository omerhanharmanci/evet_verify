part of 'init_cubit.dart';

abstract class InitState {
  const InitState();

}

class InitInitialState extends InitState {
  const InitInitialState();
}


class InitBusyState extends InitState {
  const InitBusyState();
}

class InitDoneState extends InitState {
  final UserResponseModel? model;
  const InitDoneState(this.model);
}

class InitErrorState extends InitState {
  const InitErrorState(this.message);

  final String? message;
}