import 'package:flutter/material.dart';

class TextVariable extends StatelessWidget {

  final String variavel;
  const TextVariable({

  Key? key,
  required this.variavel
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      variavel,
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: Colors.blue
      ),
    );
  }
}
