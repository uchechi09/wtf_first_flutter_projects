import 'package:json_annotation/json_annotation.dart';
import 'package:wtf_flutter_projects/model/user_details.dart';

part 'review.g.dart';

@JsonSerializable()
class Review {
  final String message;
  final UserDetails user;
  final DateTime date;

  Review({required this.message, required this.user, required this.date});

  Map<String, dynamic> toJson() => _$ReviewToJson(this);

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);
}
