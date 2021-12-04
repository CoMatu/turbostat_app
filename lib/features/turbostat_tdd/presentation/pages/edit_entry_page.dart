import 'package:flutter/material.dart';
import 'package:turbostat_app/features/turbostat_tdd/presentation/widgets/widgets.dart';

class EditEntryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: Container(
        child: EditEntryForm(),
      ),
    );
  }
}
