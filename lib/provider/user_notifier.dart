
import 'package:flutter/material.dart';
import 'package:wtf_flutter_projects/data/dummy_user_details.dart';
import 'package:wtf_flutter_projects/model/user_details.dart';

class UserNotifier extends ChangeNotifier{
  UserDetails? loggedInUser;

  void login ( String email, String password) async{
    Future.delayed(Duration(seconds: 2));

    loggedInUser = USER_DETAILS [0];
    
    notifyListeners();
  }
}