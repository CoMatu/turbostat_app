import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:turbostat_app/core/error/failures.dart';
import 'package:turbostat_app/core/usecases/usecase.dart';
import 'package:turbostat_app/features/turbostat_tdd/data/models/part_model.dart';
import 'package:turbostat_app/features/turbostat_tdd/domain/repositories/turbostat_repository.dart';

class GetEntryParts implements UseCase<List<PartModel>, Params> {
  final TurbostatRepository repository;

  GetEntryParts({required this.repository});

  @override
  Future<Either<Failure, List<PartModel>>> call(Params params) async {
    return await repository.getEntryParts(params.entryId);
  }
}

class Params extends Equatable {
  final String entryId;

  Params({required this.entryId});

  @override
  List<Object> get props => [entryId];
}
