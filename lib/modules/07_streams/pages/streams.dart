import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class StreamsPage extends StatelessWidget {
  const StreamsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Streams Page",
          style: TextStyle(
            fontSize: 50,
          ),
        ),
      ),
    );
  }
}
