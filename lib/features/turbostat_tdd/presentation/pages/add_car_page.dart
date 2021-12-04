import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turbostat_app/features/turbostat_tdd/presentation/bloc/bloc.dart';
import 'package:turbostat_app/features/turbostat_tdd/presentation/widgets/widgets.dart';
import 'package:turbostat_app/injection_container.dart';

class AddCarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      bottomNavigationBar: BottomNavigation(),
      body: buildBody(context),
    );
  }

  BlocProvider<LoadDataBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<LoadDataBloc>(),
      child: AddCarForm(),
    );
  }
}
