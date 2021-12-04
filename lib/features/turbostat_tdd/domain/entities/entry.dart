import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:json_annotation/json_annotation.dart';
part 'entry.g.dart';

@JsonSerializable()
class Entry extends Equatable {
  final String entryId;
  final String maintenanceId;
  final String entryName;
  final String entryNote;
  final DateTime entryDateTime;
  final double entryWorkPrice;
  final int entryMileage;

  Entry({
    required this.entryId,
    required this.maintenanceId,
    required this.entryName,
    required this.entryNote,
    required this.entryDateTime,
    required this.entryWorkPrice,
    required this.entryMileage,
  });

  factory Entry.fromJson(Map<String, dynamic> json) => _$EntryFromJson(json);
  Map<String, dynamic> toJson() => _$EntryToJson(this);

  @override
  List<Object> get props => [
        entryId,
        maintenanceId,
        entryName,
        entryNote,
        entryDateTime,
        entryWorkPrice,
        entryMileage,
      ];
}
