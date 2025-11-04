import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:wtf_flutter_projects/pages/login_page.dart';
import 'package:wtf_flutter_projects/provider/user_cubit.dart';
import 'package:wtf_flutter_projects/widgets/custom_button.dart';
import 'package:wtf_flutter_projects/widgets/custom_textfield.dart';
import 'package:wtf_flutter_projects/widgets/password_textfield.dart';
import 'package:wtf_flutter_projects/widgets/social_signin.dart';


class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController emailController =TextEditingController();
  TextEditingController fullnameController = TextEditingController();
  TextEditingController passwordController =TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmpasswordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var userNotifier = Provider.of<UserCubit>(context);
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          spacing: 16,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 100,),
            Text(
              "Get Started",
              textAlign: TextAlign.center,
              style: GoogleFonts.playfairDisplay(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Colors.blueAccent,
              ),
            ),
           
            Text(
              "Register Your Details Below",
              textAlign: TextAlign.center,
              style:
               TextStyle(fontSize: 16),
            ),
           CustomTextField(label: "Full Name",
           textEditingController: fullnameController,
           ),
           CustomTextField(label: "Email",
           textEditingController: emailController,),
           PassswordTextField(label: "Password",
           textEditingController: passwordController,),
           PassswordTextField(label: "Confirm Password",
           textEditingController: confirmpasswordController,),
           CustomButton(text: "Sign Up",
           onPressed: () {

            //UserCubit.signup(emailController.text, fullnameController.text,context);
              //    if(fullname
              //    Controller.text == "Uchechi Grace"
              //      && emailController.text == "uchechi@gmail.com"
              //      && passwordController.text == "19930" && confirmpasswordController.text == "19930" ){
              //    Navigator.of(context).pushReplacementNamed("/home");
              //      }else{
              //       ScaffoldMessenger.of(context).showSnackBar(
              //        SnackBar(content: Text("Enter a Matching Info", textAlign: TextAlign.center,),),
              //       );
              //      }
               Navigator.of(context).pushReplacementNamed("/home");
            },
           ),
           SocialSignin(text: "Sign up with",), 
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?"),
                GestureDetector(
                onTap: () {
                 Navigator.of(context).pushReplacementNamed("/login");
                },
                  child: Text("Sign in", style: TextStyle(color: Colors.blue)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}