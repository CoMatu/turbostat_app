import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:turbostat_app/features/turbostat_tdd/presentation/providers/providers.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.build),
            ),
            title: Text(
                'Список операций технического обслуживания'), //TODO add to plugin
            onTap: () async {
              final carId = Provider.of<CurrentCar>(context, listen: false)
                  .currentCar
                  .carId;
              await Provider.of<Maintenances>(context, listen: false)
                  .getAllMaintenances(carId);
              Navigator.pushNamed(context, 'maintenancies_page');
            },
          ),
          ListTile(
            leading: CircleAvatar(
              child: Icon(Icons.assignment),
            ),
            title: Text('Список запасных частей и расходников'),
            onTap: () async {
              final carId = Provider.of<CurrentCar>(context, listen: false)
                  .currentCar
                  .carId;
              await Provider.of<Maintenances>(context, listen: false)
                  .getAllMaintenances(carId);
              Navigator.pushNamed(context, 'parts_page');
            },
          )
        ],
      ),
    );
  }
}
