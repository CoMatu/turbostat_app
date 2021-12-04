import 'package:flutter/material.dart';
import 'package:nanoid/nanoid.dart';
import 'package:provider/provider.dart';
import 'package:turbostat_app/features/turbostat_tdd/data/models/part_model.dart';
import 'package:turbostat_app/features/turbostat_tdd/domain/usecases/add_part_model.dart';
import 'package:turbostat_app/features/turbostat_tdd/presentation/providers/providers.dart';
import 'package:turbostat_app/generated/i18n.dart';
import 'package:turbostat_app/injection_container.dart';

class AddPartForm extends StatefulWidget {
  AddPartForm({Key? key}) : super(key: key);

  @override
  _AddPartFormState createState() => _AddPartFormState();
}

class _AddPartFormState extends State<AddPartForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late String partId;
  late String partName;
  late String partCode;
  late double partPrice;
  late int partQnty;

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
                'На этой странице необходимо записать информацию о покупке запчасти или расходника', //TODO generate
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: TextFormField(
                keyboardType: TextInputType.text,
                initialValue: '',
                autocorrect: false,
                onSaved: (String? value) => partName = value!,
                maxLines: 1,
                decoration: InputDecoration(
                  labelText: 'Наименование', //TODO generate
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: TextFormField(
                keyboardType: TextInputType.text,
                initialValue: '',
                autocorrect: false,
                onSaved: (String? value) => partCode = value!,
                maxLines: 1,
                decoration: InputDecoration(
                  labelText: 'Код или артикул', //TODO generate
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: TextFormField(
                keyboardType: TextInputType.number,
                initialValue: '',
                autocorrect: false,
                onSaved: (String? value) => partPrice = double.parse(value!),
                maxLines: 1,
                validator: (value) {
                  if (value!.contains(',')) {
                    return AppLocalizations.of(context)!.form_validator_dot;
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Стоимость', //TODO generate
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: TextFormField(
                keyboardType: TextInputType.number,
                initialValue: '1',
                autocorrect: false,
                onSaved: (String? value) => partQnty = int.parse(value!),
                maxLines: 1,
                validator: (value) {
                  if (value!.contains(',')) {
                    return AppLocalizations.of(context)!.form_validator_dot;
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Quantity', //TODO generate
                ),
              ),
            ),
            Container(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    child: Text(AppLocalizations.of(context)!.button_cancel),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, 'load_data_page');
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
                    onPressed: _submitDetails,
                    // color: Colors.yellow,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _submitDetails() async {
    final FormState? formState = _formKey.currentState;

    if (!formState!.validate()) {
      //     showSnackBarMessage(AppLocalizations.of(context).form_warning_fill_info);
    } else {
      formState.save();

      final String _carId =
          Provider.of<CurrentCar>(context, listen: false).currentCar.carId;

      for (int i = 0; i < partQnty; i++) {
        partId = await nanoid(4);
        final _result = PartModel(
            partId: partId,
            partName: partName,
            partCode: partCode,
            partPrice: partPrice);

        Provider.of<Parts>(context, listen: false).add(_carId, _result);
      }

      Navigator.pushReplacementNamed(context, 'load_data_page');
    }
  }
}
