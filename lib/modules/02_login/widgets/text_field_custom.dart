import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  // final TextEditingController controller;
  final TextInputType inputType;
  final bool obscureText;

  const CustomTextField({
    Key? key,
    required this.hint,
    // required this.controller,
    this.inputType = TextInputType.text,
    this.obscureText = false,
  }) : super(key: key);

  @override
  CustomTextFieldState createState() => CustomTextFieldState();
}

class CustomTextFieldState extends State<CustomTextField> {
  late Color currentColor;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.3,
      child: Container(
        alignment: Alignment.center,
        height: 44,
        decoration: BoxDecoration(
          color: const Color.fromARGB(185, 0, 0, 0),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            style: const TextStyle(color: Colors.white),
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
