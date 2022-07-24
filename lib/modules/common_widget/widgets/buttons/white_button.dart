import 'package:flutter/material.dart';

class WhiteButton extends StatelessWidget {
  const WhiteButton({
    Key? key,
    required this.content,
    required this.onClick,
  }) : super(key: key);

  final String content;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        alignment: Alignment.center,
        height: 44,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Colors.white,
        ),
        child: Text(
          content,
          style: const TextStyle(
              color: Colors.red, fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
    );
  }
}
