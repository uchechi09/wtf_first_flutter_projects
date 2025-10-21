import 'package:flutter/material.dart';

class PassswordTextField extends StatelessWidget {
  const PassswordTextField({
    super.key, 
  });
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        labelText: "Password",
      ),
      obscureText: true,
    );
  }
}