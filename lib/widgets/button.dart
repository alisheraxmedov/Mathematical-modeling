import 'package:flutter/material.dart';
import 'package:triangle/widgets/text.dart';

class ButtonWidget extends StatelessWidget {
  final double width;
  final Color color;
  final String text;
  final void Function()? onTap;
  const ButtonWidget({
    super.key,
    required this.color,
    required this.onTap,
    required this.text,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(
            width * 0.03,
          ),
        ),
        height: width * 0.17,
        width: width * 0.7,
        child: TextWidget(
          data: text,
          color: Colors.white,
          size: width * 0.07,
        ),
      ),
    );
  }
}
