import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wtf_flutter_projects/pages/signup_page.dart';
import 'package:wtf_flutter_projects/widgets/custom_button.dart';
import 'package:wtf_flutter_projects/widgets/custom_textfield.dart';
import 'package:wtf_flutter_projects/widgets/password_textfield.dart';
import 'package:wtf_flutter_projects/widgets/social_signin.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

var check_box_outline_blank = false;

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 120),
            Text(
              "Welcome Back",
              textAlign: TextAlign.center,
              style: GoogleFonts.playfairDisplay(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Colors.blueAccent,
              ),
            ),
            Text(
              "Welcome, Been A while!",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 32),
            CustomTextField(
              label: "Email",
              textEditingController: emailController,
            ),
            SizedBox(height: 16),
            PassswordTextField(
              label: "Password",
              textEditingController: passwordController,
            ),
            SizedBox(height: 16),
            Row(
                children: [
                Icon(
                Icons.check_box_outline_blank,      
              ),
                Text("Remember me"),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed("/forgotten");
                  },
              
                  child: Text(
                "Forgotten Password?",
                 textAlign: TextAlign.left,
                 style: TextStyle(color: Colors.blue),
                ),
                ),
              ],
            ),

            SizedBox(height: 20),
            CustomButton(
              text: "Login",
              onPressed: () {
              //   if (emailController.text == "uchechi@gmail.com" &&
              //       passwordController.text == "19930") {
              //     Navigator.of(context).pushReplacementNamed("/home");
              //   } else {
              //     ScaffoldMessenger.of(context).showSnackBar(
              //       SnackBar(
              //         content: Text(
              //           "Invalid Email or Password! try again",
              //           textAlign: TextAlign.center,
              //         ),
              //       ),
              //     );
              //   }
               },
            ),
            SizedBox(height: 24),
            SocialSignin(text: "Sign in with"),

            SizedBox(height: 36),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?"),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed("/signup");
                  },
                  child: Text("Sign Up", style: TextStyle(color: Colors.blue)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
