import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:turbostat_app/core/error/failures.dart';
import 'package:turbostat_app/core/usecases/usecase.dart';
import 'package:turbostat_app/features/turbostat_tdd/data/models/mileage_model.dart';
import 'package:turbostat_app/features/turbostat_tdd/domain/repositories/turbostat_repository.dart';

class GetCarMileage implements UseCase<MileageModel, Params> {
  final TurbostatRepository repository;

  GetCarMileage({required this.repository});

  @override
  Future<Either<Failure, MileageModel>> call(Params params) async {
    return await repository.getLastMileageModel(params.carId);
  }
}

class Params extends Equatable {
  final String carId;

  Params({required this.carId});

  @override
  List<Object> get props => [carId];
}
