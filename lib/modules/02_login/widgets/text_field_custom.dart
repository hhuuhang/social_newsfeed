import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final TextEditingController controller;
  final TextInputType inputType;
  final bool obscureText;

  CustomTextField({
    required this.hint,
    required this.controller,
    this.inputType = TextInputType.text,
    this.obscureText = false,
  });

  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late Color currentColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: TextField(
        obscureText: widget.obscureText,
        //keyboardType: widget.inputType,
        // controller: widget.controller,
        decoration: InputDecoration(
          // hintStyle: const TextStyle(),
          border: InputBorder.none,
          hintText: widget.hint,
        ),
      ),
    );
  }
}


// class TextFieldCustom extends StatefulWidget {
//   TextFieldCustom({required this.hint});
//   final String hint;

//   @override
//   State<TextFieldCustom> createState() => _TextFieldCustomState();
// }

// class _TextFieldCustomState extends State<TextFieldCustom> {
//   @override
//   Widget build(BuildContext context) {
//     return Opacity(
//       opacity: 0.3,
//       child: Container(
//         alignment: Alignment.center,
//         height: 44,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(24),
//         ),
//         child: const Padding(
//           padding: EdgeInsets.only(left: 20, right: 20),
//           child: TextField(
//             decoration: InputDecoration(
//                 border: InputBorder.none,
//                 hintText: widget.hint,
//                 hintStyle:
//                     TextStyle(color: Colors.red, fontWeight: FontWeight.w900)),
//           ),
//         ),
//       ),
//     );
//   }
// }
