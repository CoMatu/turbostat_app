import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:turbostat_app/features/turbostat_tdd/domain/entities/mileage.dart';
part 'mileage_model.g.dart';

@JsonSerializable()
class MileageModel extends Mileage {
  MileageModel({
    required DateTime mileageDateTime,
    required int mileage,
  }) : super(
          mileageDateTime: mileageDateTime,
          mileage: mileage,
        );

  factory MileageModel.fromJson(Map<String, dynamic> json) =>
      _$MileageModelFromJson(json);
  Map<String, dynamic> toJson() => _$MileageModelToJson(this);
}
