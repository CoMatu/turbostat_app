import 'package:flutter/material.dart';
import 'package:turbostat_app/features/turbostat_tdd/presentation/widgets/widgets.dart';

class EditMaintenancePage extends StatelessWidget {
  const EditMaintenancePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: Container(
        child: EditMaintenanceForm(),
      ),
    );
  }
}
