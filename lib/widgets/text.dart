import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String data;
  final Color color;
  final double size;
  const TextWidget({
    super.key,
    required this.data,
    required this.color,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
