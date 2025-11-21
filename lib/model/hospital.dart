import 'package:json_annotation/json_annotation.dart';

part 'hospital.g.dart';

@JsonSerializable()
class Hospital {
  final String id;
  final String address;
  final String name;
  final String description;
  final int numberOfAmbulances;
  final int rating;
  final String website;
  final List<String> phoneNumber;

  Hospital({
    required this.name,
    required this.address,
    required this.phoneNumber,
    required this.website,
    this.description = "",
    required this.numberOfAmbulances,
    this.rating = 0,
    this.id = "",
  });

  Map<String, dynamic> toJson() => _$HospitalToJson(this);

  factory Hospital.fromJson(Map<String, dynamic> json) =>
      _$HospitalFromJson(json);
}
