import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:turbostat_app/features/turbostat_tdd/data/models/part_model.dart';
import 'package:turbostat_app/features/turbostat_tdd/domain/usecases/add_entry_parts.dart';
import 'package:turbostat_app/features/turbostat_tdd/domain/usecases/get_entry_parts.dart';
import 'package:turbostat_app/injection_container.dart';

class PartsCart extends ChangeNotifier {
  final List<PartModel> _parts = [];

  UnmodifiableListView<PartModel> get partsCart {
    return UnmodifiableListView(_parts);
  }

  double get totalPrice {
    double total = 0;
    _parts.forEach((element) {
      total = total + element.partPrice;
    });
    return total;
  }

  Future<void> getEntryParts(String entryId) async {
    _parts.clear();
    final partsList = await sl<GetEntryParts>().call(Params(entryId: entryId));
    _parts.addAll(partsList.fold(
        (failure) =>
            throw UnimplementedError(), //TODO не уверен, что так правильно, но пока работает
        (partsList) => partsList));

    notifyListeners();
  }

  void add(PartModel part) {
    _parts.add(part);
    notifyListeners();
  }

  void clearCart() {
    _parts.clear();
    notifyListeners();
  }

  void delete(PartModel part) {
    // _parts.removeWhere((element) => element.partId == part.partId);
    _parts.remove(part);
    notifyListeners();
  }

  void addPartsToDataSource(String entryId) async {
    await sl<AddEntryParts>().addEntryParts(entryId, _parts);
  }
}
