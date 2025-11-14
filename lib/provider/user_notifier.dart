import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:wtf_flutter_projects/model/user_details.dart';

class UserNotifier extends ChangeNotifier {
  UserDetails? loggedInUser;

  void login(BuildContext context, String email, String password) async {
    try {
      // create user user on firebase auth
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      // fetch user from firestore
      DocumentSnapshot docSnapshot = await FirebaseFirestore.instance
          .collection("users")
          .doc(email)
          .get();
      Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;

      UserDetails userDetails = UserDetails.fromJson(data);
      loggedInUser = userDetails;
      // take user to the home page
      Navigator.of(context).pushReplacementNamed("/home");
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.message ?? "error occured")));
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    }
    notifyListeners();
  }

  Future<void> signup({
    required BuildContext context,
    required String fullname,
    required String password,
    required String email,
  }) async {
    try {
      // ignore: unused_local_variable
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      // create user detail object
      var userD = UserDetails(name: fullname, email: email);

      // store user on firestore
      await FirebaseFirestore.instance
          .collection("users")
          .doc(email)
          .set(userD.toJson());

      loggedInUser = userD;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("user $fullname has been created successfully")),
      );
      Navigator.of(context).pushReplacementNamed("/home");
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.message ?? "error occured")));
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  void signInWithGoogle(BuildContext context) async {
    try {
      var instance = GoogleSignIn.instance;
      final GoogleSignInAccount? googleUser = await instance.authenticate();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth = googleUser!.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
      UserCredential user = await FirebaseAuth.instance.signInWithCredential(
        credential,
      );

      // create user detail object
      var userD = UserDetails(
        name: user.user!.displayName ?? "No name",
        email: user.user!.email!,
        profilepicture: user.user!.photoURL ?? "",
      );

      // store user on firestore
      await FirebaseFirestore.instance
          .collection("users")
          .doc(userD.email)
          .set(userD.toJson());

      loggedInUser = userD;
      Navigator.of(context).pushReplacementNamed("/home");

      print(user);
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.message ?? "error occured")));
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
    loggedInUser = null;
  }

  void forgotPassword(String email) {
    FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }
}
