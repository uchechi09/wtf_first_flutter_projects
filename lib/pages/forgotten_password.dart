import 'dart:async';
import 'package:flutter/material.dart';
import 'package:otp_input/otp_input.dart';
import 'package:wtf_flutter_projects/widgets/custom_button.dart';
import 'package:wtf_flutter_projects/widgets/custom_textfield.dart';

class ForgottenPassword extends StatefulWidget {
  const ForgottenPassword({super.key});

  @override
  State<ForgottenPassword> createState() => _ForgottenPasswordState();
}

class _ForgottenPasswordState extends State<ForgottenPassword> {
  bool showOtp = false;
  late Timer timer;
  int seconds = 60;
  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 8,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            showOtp
                ? _buildOtpView()
                : Column(
                    spacing: 10,
                    children: [
                      Text(
                        "Enter your registered email to get a reset password link.",
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                      CustomTextField(label: "Email Address"),
                      CustomButton(
                        onPressed: () {
                          setState(() {
                            showOtp = true;
                          });
                          // set re-request otp
                          timer = Timer.periodic(Duration(seconds: 1), (timer) {
                            print("ticked");
                            if (seconds <= 1) {
                              timer.cancel();
                            }
                            setState(() {
                              seconds--;
                            });
                          });
                        },
                        text: " Get OTP",
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }

  Widget _buildOtpView() {
    return Column(
      children: [
        Text("Check your email address for Otp sent"),
        OtpInputField(
          otpInputFieldCount: 6,
          fieldStyle: OtpFieldStyle.dash,
          onOtpEntered: (otp) {
            print('Entered OTP: $otp');
            if (otp == "009988") {
              Navigator.pushNamed(context, "/login");
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Invaild OTP", textAlign: TextAlign.center),
                ),
              );
            }
          },
        ),
        Text("$seconds seconds to request again"),
      ],
    );
  }
}
