import 'package:flutter/material.dart';
import 'package:nanoid/nanoid.dart';
import 'package:provider/provider.dart';
import 'package:turbostat_app/features/turbostat_tdd/data/models/maintenance_model.dart';
import 'package:turbostat_app/features/turbostat_tdd/presentation/providers/providers.dart';
import 'package:turbostat_app/generated/i18n.dart';

class AddMaintenanceForm extends StatefulWidget {
  AddMaintenanceForm({Key? key}) : super(key: key);

  @override
  _AddMaintenanceFormState createState() => _AddMaintenanceFormState();
}

class _AddMaintenanceFormState extends State<AddMaintenanceForm> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String maintenanceId;
  late String maintenanceName;
  late int maintenanceMileageLimit;
  late int maintenanceMonthLimit;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          shrinkWrap: true,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Text(
                AppLocalizations.of(context)!.add_entry_page_description,
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: TextFormField(
                keyboardType: TextInputType.text,
                initialValue: '',
                autocorrect: false,
                onSaved: (String? value) {
                  maintenanceName = value!;
                },
                maxLines: 1,
                validator: (value) {
                  if (value!.isEmpty || value.length < 1) {
                    return AppLocalizations.of(context)!
                        .form_validator_car_name;
                  }
                  return null;
                },
                decoration: InputDecoration(
                    labelText: AppLocalizations.of(context)!
                        .form_decorator_maintenance_name,
                    labelStyle: TextStyle(
                      decorationStyle: TextDecorationStyle.solid,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: TextFormField(
                keyboardType: TextInputType.number,
                initialValue: '',
                autocorrect: false,
                onSaved: (String? value) {
                  maintenanceMileageLimit = int.parse(value!);
                },
                maxLines: 1,
                validator: (value) {
                  if (value!.isEmpty || value.length < 1) {
                    return AppLocalizations.of(context)!
                        .form_decorator_maintenance_interval_km;
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!
                      .form_decorator_maintenance_interval_km,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: TextFormField(
                keyboardType: TextInputType.number,
                initialValue: '',
                autocorrect: false,
                onSaved: (String? value) {
                  maintenanceMonthLimit = int.parse(value!);
                },
                maxLines: 1,
                validator: (value) {
                  if (value!.isEmpty || value.length < 1) {
                    return AppLocalizations.of(context)!
                        .form_decorator_maintenance_interval;
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!
                      .form_decorator_maintenance_interval,
                ),
              ),
            ),
            Container(
              height: 30.0,
            ),
            Consumer<CurrentCar>(
              builder: (context, car, child) => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 150,
                    child: ElevatedButton(
                      child: Text(AppLocalizations.of(context)!.button_cancel),
                      onPressed: () {
                        Navigator.pop(context);
                        //TODO при добавлении из списка отмена уводит на страницу настроек, а должна вернуть к списку
                      },
                      // color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  SizedBox(
                    width: 150,
                    child: ElevatedButton(
                      child: Text(AppLocalizations.of(context)!.button_save),
                      onPressed: () async =>
                          _submitDetails(car.currentCar.carId),
                      // color: Colors.yellow,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _submitDetails(String carId) async {
    final FormState? formState = _formKey.currentState;

    if (!formState!.validate()) {
      //     showSnackBarMessage(AppLocalizations.of(context).form_warning_fill_info);
    } else {
      formState.save();
      final maintenanceGenId = nanoid(4);
      final newMaintenance = MaintenanceModel(
        maintenanceId: maintenanceGenId,
        maintenanceName: maintenanceName,
        maintenanceMileageLimit: maintenanceMileageLimit,
        maintenanceMonthLimit: maintenanceMonthLimit,
      );
      Provider.of<Maintenances>(context, listen: false)
          .add(newMaintenance, carId);

      Navigator.pushReplacementNamed(context, 'load_data_page');
    }
  }
}
