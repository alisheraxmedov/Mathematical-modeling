import 'package:flutter/material.dart';
import 'package:triangle/widgets/text.dart';

class TasksCardWidgets extends StatelessWidget {
  final double width;
  final int taskNum;
  final String taskName;
  final String imagePath;
  final void Function()? onTap;
  const TasksCardWidgets({
    super.key,
    required this.width,
    required this.taskNum,
    required this.taskName,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.cyan,
          borderRadius: BorderRadius.circular(
            width * 0.03,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(
                0.3,
              ), // soyani rangini va shaffofligini o'zgartirishingiz mumkin
              spreadRadius: 2, // soyani tarqalish radiusi
              blurRadius: 8, // soyani xiralik darajasi
              offset:
                  const Offset(4, 4), // soyani x va y o'qlari bo'ylab siljishi
            ),
          ],
        ),
        height: width * 0.5,
        width: width * 0.4,
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextWidget(
                    data: "$taskNum - Topshiriq",
                    color: Colors.white,
                    size: width * 0.05,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                height: width * 0.3,
                width: width * 0.3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(imagePath),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextWidget(
                    data: taskName,
                    color: Colors.white,
                    size: width * 0.05,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
