import 'package:flutter/material.dart';
import 'package:turbostat_app/features/turbostat_tdd/presentation/widgets/widgets.dart';

class BuildWaitingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: Container(
        alignment: Alignment.center,
        child: CustomCircleProgressBar(),
      ),
    );
  }
}
