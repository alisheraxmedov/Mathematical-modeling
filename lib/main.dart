import 'package:flutter/material.dart';
import 'package:triangle/cylinder.dart';
import 'package:triangle/triangle.dart';
import 'package:triangle/widgets/task_card.dart';
import 'package:triangle/widgets/text.dart';

void main() => runApp(
      const TriangleApp(),
    );

class TriangleApp extends StatelessWidget {
  const TriangleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: TriangleCalculator(),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: width * 0.2,
        backgroundColor: Colors.cyan,
        title: TextWidget(
          data: "Matematik modellashtirish",
          color: Colors.white,
          size: width * 0.07,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: width * 0.03),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TasksCardWidgets(
                  width: width,
                  taskNum: 1,
                  taskName: "Uchburchaklar",
                  imagePath: "assets/images/triangle.png",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TriangleCalculator(),
                      ),
                    );
                  },
                ),
                TasksCardWidgets(
                  width: width,
                  taskNum: 2,
                  taskName: "Slindr",
                  imagePath: "assets/images/slindr.png",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CylinderCalculator(),
                      ),
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: width * 0.06),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TasksCardWidgets(
                  width: width,
                  taskNum: 3,
                  taskName: "Radioaktiv y...",
                  imagePath: "assets/images/radioaktiv.png",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TriangleApp(),
                      ),
                    );
                  },
                ),
                TasksCardWidgets(
                  width: width,
                  taskNum: 4,
                  taskName: "Slindr",
                  imagePath: "assets/images/triangle.png",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TriangleApp(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
