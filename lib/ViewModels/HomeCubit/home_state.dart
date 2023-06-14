part of 'home_cubit.dart';

abstract class HomeState {
  const HomeState();
}

class HomeInitialState extends HomeState {
  const HomeInitialState();
}

class HomeMotherState extends HomeState {
  const HomeMotherState();
}

class HomeErrorState extends HomeState {
  const HomeErrorState(this.message);

  final String message;
}

class HomeBusyState extends HomeState{
  const HomeBusyState();
}

