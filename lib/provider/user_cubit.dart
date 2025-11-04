import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wtf_flutter_projects/data/dummy_user_details.dart';
import 'package:wtf_flutter_projects/model/user_details.dart';

class UserCubit extends Cubit<UserDetails?> {
  UserCubit(): super (null);

  
  BuildContext? get context => null;

  void login(BuildContext context, email, String password) async {
    Future.delayed(Duration(seconds: 2));

   // print("Got into login function");

    for (var userDetails in USER_DETAILS) {
      if (userDetails.email == email) {
        emit(userDetails);
        Navigator.of(context).pushReplacementNamed("/home");
      }else{
        ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(content: Text("Invaild email or password! please try again")),
        );
      }
    }

   
  } 
  // void signup(String email, String fullname, BuildContext context){
  //   loggedInUser = UserDetails(name: fullname, email: email, profilepicture: "",password: "");
  //   USER_DETAILS.add(loggedInUser!);
  //   Navigator.pushReplacementNamed(context, "/home");
  // }
  


}
