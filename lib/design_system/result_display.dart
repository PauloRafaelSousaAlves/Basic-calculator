import 'package:flutter/material.dart';

class ResultDisplay extends StatelessWidget {
  const ResultDisplay({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.only(right: 24),
      width: double.infinity,
      height: 100,
      color: Colors.black,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 34,
        ),
      ),
    );
  }
}
