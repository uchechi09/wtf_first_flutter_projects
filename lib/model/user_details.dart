import 'package:flutter/cupertino.dart';

class UserDetails {
  const UserDetails({
    required this.name,
    required this.email,
     this.profilepicture = "",
    this.phoneNumber = "",
    this.address ="",
     this.occupation = "",
    

  });

  final String name;
  final String email;
  final String profilepicture;
  final String phoneNumber;
  final String address;
  final String occupation;

  Map<String, dynamic> toJson(){
    return {   
      "email":this.email,
      "name":this.name,
      "phoneNumber": this.phoneNumber,
      "profilepicture": this.profilepicture,
      "address": this.address,
      "occupation": this.occupation,
      };
  }
   factory UserDetails.fromJson(Map <String, dynamic> json) {
    return UserDetails(
      name: json["name"],
      email: json["email"],
      profilepicture: json["profilepicture"],
      phoneNumber: json["phoneNumber"],
      address: json["address"],
      occupation: json ["occupation"],
    );
   }

}