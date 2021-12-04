import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nanoid/nanoid.dart';
import 'package:provider/provider.dart';
import 'package:turbostat_app/core/fixtures/date_validator.dart';
import 'package:turbostat_app/features/turbostat_tdd/data/models/entry_model.dart';
import 'package:turbostat_app/features/turbostat_tdd/data/models/maintenance_model.dart';
import 'package:turbostat_app/features/turbostat_tdd/domain/usecases/add_entry_parts.dart';
import 'package:turbostat_app/features/turbostat_tdd/presentation/providers/providers.dart';
import 'package:turbostat_app/generated/i18n.dart';
import 'package:turbostat_app/injection_container.dart';

class AddEntryForm extends StatefulWidget {
  AddEntryForm({Key? key}) : super(key: key);

  @override
  _AddEntryFormState createState() => _AddEntryFormState();
}

class _AddEntryFormState extends State<AddEntryForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();

  late List<MaintenanceModel> _maintenances;

  late String entryId;
  late String maintenanceId;
  late String entryName;
  late String entryNote;
  late DateTime entryDateTime;
  late double entryWorkPrice;
  late int entryMileage;
  late bool isVisible;
  late double totalPrice;

  @override
  void initState() {
    _maintenances =
        Provider.of<Maintenances>(context, listen: false).maintenances;
    super.initState();
    isVisible = false;
    totalPrice = Provider.of<PartsCart>(context, listen: false).totalPrice;
  }

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
                AppLocalizations.of(context)!.add_operation_page_description,
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            FormField<String>(
              builder: (FormFieldState<String> state) {
                return InputDecorator(
                  decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!
                          .form_decorator_select_maintenance,
                      labelStyle: TextStyle(fontSize: 22.0)),
                  isEmpty: maintenanceId == '',
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: maintenanceId,
                      isDense: true,
                      isExpanded: true,
                      onChanged: (String? newValue) {
                        setState(() {
                          maintenanceId = newValue!;
                          state.didChange(newValue);
                        });
                      },
                      items: _maintenances.map((MaintenanceModel value) {
                        return DropdownMenuItem<String>(
                          value: value.maintenanceId,
                          child: Text(value.maintenanceName),
                        );
                      }).toList(),
                    ),
                  ),
                );
              },
            ),
            Row(children: <Widget>[
              Expanded(
                  child: TextFormField(
                decoration: InputDecoration(
                  //                        icon: const Icon(Icons.calendar_today),
                  labelText: AppLocalizations.of(context)!.form_decorator_date,
                ),
                controller: _controller,
                keyboardType: TextInputType.datetime,
                validator: (val) => DateValidator().isValidDate(val!)
                    ? null
                    : AppLocalizations.of(context)!.form_validator_date_format,
                onSaved: (val) =>
                    entryDateTime = DateFormat('dd.MM.yyyy').parseStrict(val!),
              )),
              IconButton(
                icon: Icon(Icons.more_horiz),
                tooltip:
                    AppLocalizations.of(context)!.form_decorator_date_select,
                onPressed: (() {
                  assert(_controller.text != null);
                  _chooseDate(context, _controller.text);
                }),
              ),
            ]),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: TextFormField(
                keyboardType: TextInputType.number,
                initialValue: '',
                autocorrect: false,
                onSaved: (String? value) => entryMileage = int.parse(value!),
                maxLines: 1,
                validator: (value) {
                  if (value!.isEmpty || value.length < 1) {
                    return AppLocalizations.of(context)!
                        .form_decorator_car_mileage;
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!
                      .form_decorator_odometer_value,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: TextFormField(
                keyboardType: TextInputType.number,
                initialValue: '',
                autocorrect: false,
                onSaved: (String? value) =>
                    entryWorkPrice = double.parse(value!),
                maxLines: 1,
                validator: (value) {
                  if (value!.contains(',')) {
                    return AppLocalizations.of(context)!.form_validator_dot;
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText:
                      AppLocalizations.of(context)!.form_decorator_value_work,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          'Расход запчастей и их стоимость', //TODO generate 18
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.add_circle_outline),
                        onPressed: () {
                          setState(() {
                            if (!isVisible) {
                              isVisible = true;
                            } else {
                              isVisible = false;
                            }
                          });
                          //TODO add form for entry
                        },
                      ),
                    ],
                  ),
                  Consumer<PartsCart>(
                    builder: (context, partsCart, child) {
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount:
                              Provider.of<PartsCart>(context, listen: false)
                                  .partsCart
                                  .length,
                          itemBuilder: (BuildContext context, int index) => Row(
                                children: <Widget>[
                                  Expanded(
                                      child: Text(
                                          partsCart.partsCart[index].partName)),
                                  Text(partsCart.partsCart[index].partPrice
                                      .toString()),
                                ],
                              ));
                    },
                  ),
                  Divider(),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text('Amount: '),
                      ), //TODO add plugin i18n
                      Text(totalPrice.toString()),
                    ],
                  ),
                  Container(
                    height: 12.0,
                  ),
                  isVisible
                      ? Consumer<Parts>(
                          builder: (context, partsList, child) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                left: 12.0,
                              ),
                              child: Column(
                                children: <Widget>[
                                  Text('База данных запчастей и расходников'),
                                  // TODO добавить 18
                                  ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: partsList.parts.length,
                                    itemBuilder:
                                        (BuildContext context, int index) =>
                                            Row(
                                      children: <Widget>[
                                        Expanded(
                                            child: Text(partsList
                                                .parts[index].partName)),
                                        Text(partsList.parts[index].partPrice
                                            .toString()),
                                        IconButton(
                                          icon: Icon(Icons.remove),
                                          onPressed: () {
                                            Provider.of<PartsCart>(context,
                                                    listen: false)
                                                .delete(partsList.parts[index]);
                                            setState(() {
                                              totalPrice =
                                                  Provider.of<PartsCart>(
                                                          context,
                                                          listen: false)
                                                      .totalPrice;
                                            });
                                          },
                                        ),
                                        //  Text(numberOfPart.toString()),
                                        IconButton(
                                          icon: Icon(Icons.add),
                                          onPressed: () {
                                            Provider.of<PartsCart>(context,
                                                    listen: false)
                                                .add(partsList.parts[index]);
                                            setState(() {
                                              totalPrice =
                                                  Provider.of<PartsCart>(
                                                          context,
                                                          listen: false)
                                                      .totalPrice;
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        )
                      : Container(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: TextFormField(
                keyboardType: TextInputType.text,
                initialValue: '',
                autocorrect: false,
                onSaved: (String? value) => entryNote = value!,
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.form_decorator_notes,
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
                      Provider.of<PartsCart>(context, listen: false)
                          .clearCart();

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
      final filtrRes =
          _maintenances.where((f) => f.maintenanceId == maintenanceId).first;
      entryName = filtrRes.maintenanceName;
      entryId = await nanoid(4);
      final _result = EntryModel(
        entryId: entryId,
        maintenanceId: maintenanceId,
        entryName: entryName,
        entryDateTime: entryDateTime,
        entryMileage: entryMileage,
        entryWorkPrice: entryWorkPrice,
        entryNote: entryNote,
      );
      final String _carId =
          Provider.of<CurrentCar>(context, listen: false).currentCar.carId;
      Provider.of<Entries>(context, listen: false).add(_carId, _result);

      var _parts = Provider.of<PartsCart>(context, listen: false).partsCart;
      await sl<AddEntryParts>().addEntryParts(entryId, _parts);
      Provider.of<PartsCart>(context, listen: false).clearCart();

      Provider.of<Entries>(context, listen: false).add(_carId, _result);

      Navigator.pushReplacementNamed(context, 'load_data_page');
    }
  }

  Future _chooseDate(BuildContext context, String initialDateString) async {
    var now = DateTime.now();
    var initialDate = convertToDate(initialDateString) ?? now;
    assert(initialDate != null);
    print(initialDate.toString());
    initialDate = (initialDate.year >= 2015 && initialDate.isBefore(now)
        ? initialDate
        : now);

    var result = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2015),
      lastDate: DateTime.now(),
    );
    if (result == null) return;

    setState(() {
      _controller.text = DateFormat('dd.MM.yyyy').format(result);
    });
  }

  DateTime? convertToDate(String input) {
    try {
      var d = DateFormat('dd.MM.yyyy').parseStrict(input);
      return d;
    } catch (e) {
      return null;
    }
  }
}
