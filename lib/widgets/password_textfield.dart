import 'package:flutter/material.dart';

class PassswordTextField extends StatefulWidget {
  const PassswordTextField({
    super.key, 
    required this.label,
    this.textEditingController,
  });
  final String label;
  final TextEditingController? textEditingController;

  @override
  State<PassswordTextField> createState() => _PassswordTextFieldState();
}
var isvisible = false;

class _PassswordTextFieldState extends State<PassswordTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.textEditingController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        labelText: widget.label,
        suffixIcon: InkWell(onTap: () {
          setState(() {
            isvisible = !isvisible;
          });
        },
          child: Icon(isvisible ? Icons.visibility : Icons.visibility_off))
      ),
      obscureText: !isvisible,
    );
  }
}