import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  // final TextEditingController controller;
  final TextInputType inputType;
  final bool obscureText;

  CustomTextField({
    required this.hint,
    // required this.controller,
    this.inputType = TextInputType.text,
    this.obscureText = false,
  });

  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late Color currentColor;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.3,
      child: Container(
        alignment: Alignment.center,
        height: 44,
        decoration: BoxDecoration(
          color: Color.fromARGB(185, 0, 0, 0),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            obscureText: widget.obscureText,
            //keyboardType: widget.inputType,
            // controller: widget.controller,
            decoration: InputDecoration(
              hintStyle: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
              border: InputBorder.none,
              hintText: widget.hint,
            ),
          ),
        ),
      ),
    );
  }
}
