import 'package:flutter/material.dart';

class TextStatic extends StatelessWidget {

  final String texto;

  const TextStatic({
    Key? key,
    required this.texto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      texto,
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16
      ),
    );
  }
}
