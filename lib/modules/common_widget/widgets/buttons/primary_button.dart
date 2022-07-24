import 'package:flutter/material.dart';

class PrimaryButton extends StatefulWidget {
  const PrimaryButton({
    Key? key,
    required this.content,
    required Null Function() onClick,
  }) : super(key: key);

  final String content;

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        alignment: Alignment.center,
        height: 44,
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: <Color>[
            Color.fromARGB(255, 255, 0, 0),
            Color.fromARGB(255, 255, 123, 0)
          ]),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Text(
          widget.content,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
    );
  }
}
