import 'package:event_verify/ViewModels/HomeCubit/home_cubit.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBuilder extends StatelessWidget {
  const HomeBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) => _homeBodyBuilder(context, state),
    );
  }

  _homeBodyBuilder(BuildContext context, HomeState state) {}
}
