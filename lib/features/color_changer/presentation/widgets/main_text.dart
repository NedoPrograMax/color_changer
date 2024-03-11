import 'package:flutter/material.dart';

class MainText extends StatelessWidget {
  const MainText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Hello there",
      style: TextStyle(
        color: Theme.of(context).colorScheme.onPrimary,
        fontSize: 32,
        fontStyle: FontStyle.italic,
      ),
    );
  }
}
