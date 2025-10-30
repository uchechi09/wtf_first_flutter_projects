import 'package:flutter/material.dart';
import 'package:wtf_flutter_projects/data/dummy_user_details.dart';
import 'package:wtf_flutter_projects/model/user_details.dart';

class UserNotifier extends ChangeNotifier {
  UserDetails? loggedInUser;
  
  BuildContext? get context => null;

  void login(BuildContext context, email, String password) async {
    Future.delayed(Duration(seconds: 2));

    print("Got into login function");

    for (var userDetails in USER_DETAILS) {
      if (userDetails.email == email) {
        loggedInUser = userDetails;
        Navigator.of(context).pushReplacementNamed("/home");
      }
    }

    notifyListeners();
  } 
  void singnup(String email, String fullname, BuildContext context){
    loggedInUser = UserDetails(name: fullname, email: email, profilepicture: "");
    USER_DETAILS.add(loggedInUser!);
    Navigator.pushReplacementNamed(context, "/home");
  }

  notifyListeners();
}
