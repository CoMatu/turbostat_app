import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:turbostat_app/core/error/exception.dart';
import 'package:turbostat_app/features/turbostat_tdd/data/models/car_model.dart';
import 'package:turbostat_app/features/turbostat_tdd/domain/usecases/delete_entry.dart';
import 'package:turbostat_app/features/turbostat_tdd/presentation/pages/pages.dart';
import 'package:turbostat_app/features/turbostat_tdd/presentation/providers/entries.dart';
import 'package:turbostat_app/features/turbostat_tdd/presentation/providers/providers.dart';
import 'package:turbostat_app/generated/i18n.dart';
import 'package:turbostat_app/injection_container.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      initialData: _getData(context),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return Consumer<Entries>(
            builder: (context, entry, child) {
              return ListView.builder(
                itemCount: entry.entries.length,
                itemBuilder: (BuildContext context, int index) => Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.cyan,
                        child: Icon(
                          Icons.settings,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        width: 10.0,
                      ),
                      Expanded(
                        child: Column(
                          children: <Widget>[
                            GestureDetector(
                              // TODO детектор поднять в колонку?
                              onTap: () async {
                                final carId = Provider.of<CurrentCar>(context,
                                        listen: false)
                                    .currentCar
                                    .carId;

                                Provider.of<PartsCart>(context, listen: false)
                                    .getEntryParts(
                                        entry.entries[index].entryId);

                                await Provider.of<Maintenances>(context,
                                        listen: false)
                                    .getAllMaintenances(carId);

                                Navigator.pushNamed(
                                    context, 'maintenance_details',
                                    arguments: entry.entries[index]);
                              },
                              child: Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  entry.entries[index].entryName != null
                                      ? entry.entries[index].entryName
                                      : 'unknowing entry',
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 6.0, right: 10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    entry.entries[index].entryDateTime != null
                                        ? DateFormat('dd.MM.yyyy').format(
                                            entry.entries[index].entryDateTime)
                                        : 'undefinied',
                                    //                          entry.entries[index].entryDateTime.toString(),
                                    style: Theme.of(context).textTheme.overline,
                                  ),
                                  Text(
                                    AppLocalizations.of(context)!
                                        .car_card_mileage,
                                    style: Theme.of(context).textTheme.overline,
                                  )
                                  // (
                                  // entry.entries[index].entryMileage.toString())
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () async {
                          final carId =
                              Provider.of<CurrentCar>(context, listen: false)
                                  .currentCar
                                  .carId;

                          Provider.of<CurrentEntry>(context, listen: false)
                              .update(entry.entries[index]);
                          await Provider.of<Maintenances>(context,
                                  listen: false)
                              .getAllMaintenances(carId);
                          await Provider.of<Parts>(context, listen: false)
                              .update(carId);
                          Provider.of<PartsCart>(context, listen: false)
                              .getEntryParts(entry.entries[index].entryId);
                          Navigator.popAndPushNamed(context, 'edit_entry');
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete_outline),
                        onPressed: () async {
                          final carId =
                              Provider.of<CurrentCar>(context, listen: false)
                                  .currentCar
                                  .carId;

                          final ConfirmAction? confirmAction =
                              await asyncConfirmDialog(context);
                          if (confirmAction == ConfirmAction.ACCEPT) {
                            sl<DeleteEntry>().deleteEntry(
                                carId, entry.entries[index].entryId);
                            Provider.of<Entries>(context, listen: false)
                                .updateAll(carId);
                            //TODO решить что делать с запчастями при удалении записи
                          }
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }

  _getData(BuildContext context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final jsonString = pref.getString('carId');
    if (jsonString != null) {
      Map res = jsonDecode(pref.getString('carId')!);
      final _car = CarModel.fromJson(res as Map<String, dynamic>);
      Provider.of<Entries>(context, listen: false).updateAll(_car.carId);
    } else {
      throw CacheException();
    }
  }

  Future<ConfirmAction?> asyncConfirmDialog(BuildContext context) async {
    return showDialog<ConfirmAction>(
      context: context,
      barrierDismissible: false, // user must tap button for close dialog!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(AppLocalizations.of(context)!.delete_entry_operation),
          content: Text(
              AppLocalizations.of(context)!.delete_entry_operation_warning),
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
}
