import 'package:flutter/material.dart';

class SocialSignin extends StatelessWidget {
  const SocialSignin({
    super.key, required this.text,
  });
    final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          spacing: 8,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(child: Divider()),
            Text("Sign up with"),
            Expanded(child: Divider()),
          ],
        ),
        SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 12,
          children: [
            InkWell(
              onTap: () {},
              child: Image.asset(
                "assets/google.png",
                width: 40,
                height: 40,
              ),
            ),
            InkWell(
              onTap: () {},
              child: Image.asset(
                "assets/facebook.png",
                width: 40,
                height: 40,
              ),
            ),
            InkWell(
              onTap: () {},
              child: Image.asset("assets/x.png", width: 40, height: 40),
            ),
          ],
        ),
      ],
    );
  }
}
