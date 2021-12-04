import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:turbostat_app/features/turbostat_tdd/data/models/car_model.dart';
import 'package:turbostat_app/features/turbostat_tdd/data/models/mileage_model.dart';
import 'package:turbostat_app/features/turbostat_tdd/presentation/bloc/bloc.dart';
import 'package:turbostat_app/features/turbostat_tdd/presentation/providers/providers.dart';
import 'package:turbostat_app/features/turbostat_tdd/presentation/widgets/widgets.dart';
import 'package:turbostat_app/generated/i18n.dart';
import 'package:turbostat_app/injection_container.dart';

enum ConfirmAction { CANCEL, ACCEPT }

class CarListPage extends StatelessWidget {
  final TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return buildPageBody(context);
  }

  BlocProvider<LoadDataBloc> buildPageBody(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<LoadDataBloc>()..add(GetAllCar()),
      child: BlocBuilder<LoadDataBloc, LoadDataState>(
        builder: (context, state) {
          if (state is Loading) {
            return CustomCircleProgressBar();
          }
          if (state is LoadedAllCars) {
            return state.listAll.isEmpty
                ? Center(
                    child: ElevatedButton(
                      child: Text('Add car'),
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, 'load_data_page');
                      },
                    ),
                  )
                : ListView.builder(
                    itemCount: state.listAll.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            CircleAvatar(
                              backgroundColor: Colors.blueAccent,
                              child: Icon(Icons.directions_car),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () async {
                                  final pref =
                                      await SharedPreferences.getInstance();
                                  CarModel car = state.listAll[index];
                                  String currentCar = jsonEncode(car);
                                  pref.setString('carId', currentCar);

                                  Provider.of<CurrentCar>(context,
                                          listen: false)
                                      .updateCurrentCar(state.listAll[index]);
                                  Provider.of<Maintenances>(context,
                                          listen: false)
                                      .getAllMaintenances(car.carId);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10.0,
                                    right: 10.0,
                                  ),
                                  child: Column(
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            child: Text(
                                              state.listAll[index].carMark,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 12,
                                          ),
                                          Container(
                                            child: Text(
                                              state.listAll[index].carModel,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Divider(),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: <Widget>[
                                                Text(
                                                  '88585',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .overline,
                                                ),
                                                GestureDetector(
                                                  onTap: () async {
                                                    _displayDialog(
                                                      context,
                                                      state
                                                          .listAll[index].carId,
                                                    );
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 12.0,
                                                            right: 12.0),
                                                    child: Icon(
                                                      Icons.edit,
                                                      size: 18.0,
                                                      color: Colors.green,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              state.listAll[index].carYear
                                                  .toString(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .overline,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                    context, 'edit_car');
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.delete_outline),
                              onPressed: () async {
                                final String carKey =
                                    state.listAll[index].carId;

                                final ConfirmAction? confirmAction =
                                    await asyncConfirmDialog(context, carKey);
// TODO исправить логику при удалении последнего авто
                                if (confirmAction == ConfirmAction.ACCEPT) {
                                  BlocProvider.of<LoadDataBloc>(context)
                                      .add(DeleteConcreteCar(carKey: carKey));
                                  BlocProvider.of<LoadDataBloc>(context)
                                      .add(GetAllCar());
                                }
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
          }
          return Container();
        },
      ),
    );
  }

  Future<ConfirmAction?> asyncConfirmDialog(
      BuildContext context, String carId) async {
    return showDialog<ConfirmAction>(
      context: context,
      barrierDismissible: false, // user must tap button for close dialog!
      builder: (BuildContext context) {
        return AlertDialog(
          title:
              Text(AppLocalizations.of(context)!.car_card_alert_dialog_title),
          content: Text(AppLocalizations.of(context)!.car_card_content_text),
          actions: <Widget>[
            ElevatedButton(
              child: Text(
                AppLocalizations.of(context)!.button_cancel,
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                Navigator.of(context).pop(ConfirmAction.CANCEL);
              },
            ),
            ElevatedButton(
              child: Text(
                AppLocalizations.of(context)!.button_delete,
              ),
              onPressed: () async {
                Navigator.of(context).pop(ConfirmAction.ACCEPT);
              },
            )
          ],
        );
      },
    );
  }

  _displayDialog(BuildContext context, String carId) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: TextField(
              controller: _textFieldController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!
                      .car_card_enter_current_mileage),
            ),
            actions: <Widget>[
              ElevatedButton(
                child: Text(
                  AppLocalizations.of(context)!.button_cancel,
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              ElevatedButton(
                child: Text(
                  AppLocalizations.of(context)!.button_save,
                ),
                onPressed: () async {
                  MileageModel mileage = MileageModel(
                    mileageDateTime: DateTime.now(),
                    mileage: int.parse(_textFieldController.text),
                  );

                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}

/*



*/
