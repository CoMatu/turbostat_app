import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:turbostat_app/features/turbostat_tdd/data/models/car_model.dart';
import 'package:meta/meta.dart';

abstract class TurbostatRemoteDataSource {
  Future<CarModel>? getConcreteCarModel(String carId);

  Future<List<CarModel>> getAllCarModels();
}

class TurbostatRemoteDataSourceImpl implements TurbostatRemoteDataSource {
  final CollectionReference collectionReference;

  TurbostatRemoteDataSourceImpl({required this.collectionReference});
  @override
  Future<List<CarModel>> getAllCarModels() async {
    List<CarModel> list = [];

    String userId = 'test';

    final result =
        await collectionReference.where('userId', isEqualTo: userId).get();

    result.docs.forEach((f) {
      final data = f.data() as Map<String, dynamic>;
      CarModel res = CarModel.fromJson(data);
      list.add(res);
    });

    return list;
  }

  @override
  Future<CarModel>? getConcreteCarModel(String carId) => null;
}
