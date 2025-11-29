import 'package:json_annotation/json_annotation.dart';

part 'user_details.g.dart';

@JsonSerializable()
class UserDetails {
  const UserDetails({
    required this.name,
    required this.email,
    this.profilepicture = "",
    this.phoneNumber = "",
    this.address = "",
    this.occupation = "",
  });

  final String name;
  final String email;
  final String profilepicture;
  final String phoneNumber;
  final String address;
  final String occupation;

  Map<String, dynamic> toJson() => _$UserDetailsToJson(this);
   

  factory UserDetails.fromJson(Map<String, dynamic> json) => _$UserDetailsFromJson(json);
 
    
}