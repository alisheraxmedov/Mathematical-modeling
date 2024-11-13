// import 'package:flutter/material.dart';
// import 'package:triangle/widgets/button.dart';
// import 'dart:math';

// import 'package:triangle/widgets/text.dart';

// class CylinderCalculator extends StatefulWidget {
//   const CylinderCalculator({super.key});

//   @override
//   CylinderCalculatorState createState() => CylinderCalculatorState();
// }

// class CylinderCalculatorState extends State<CylinderCalculator> {
//   final _formKey = GlobalKey<FormState>();
//   final _surfaceAreaController = TextEditingController();
//   double? radius;
//   double? height;

//   void calculateCylinderDimensions(double surfaceArea) {
//     // double hosila = (pi * surfaceArea / 2) - (3 * pi * r * r);

//     double r = sqrt((surfaceArea / 2) / 3);
//     double h = (surfaceArea - 2 * r * r) / (2 * r);
//     setState(() {
//       radius = r;
//       height = h;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final double width = MediaQuery.sizeOf(context).width;
//     return Scaffold(
//       appBar: AppBar(
//         iconTheme: const IconThemeData(color: Colors.white),
//         toolbarHeight: width * 0.2,
//         backgroundColor: Colors.cyan,
//         title: TextWidget(
//           data: "Silindr Hajmini Topish",
//           color: Colors.white,
//           size: width * 0.07,
//         ),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               TextFormField(
//                 controller: _surfaceAreaController,
//                 decoration: const InputDecoration(
//                   labelText: 'Tekislik yuzasi (π bilan, masalan: 150)',
//                 ),
//                 keyboardType: TextInputType.number,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Yuzani kiriting';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   ButtonWidget(
//                     color: Colors.cyan,
//                     onTap: () {
//                       if (_formKey.currentState!.validate()) {
//                         double surfaceArea =
//                             double.parse(_surfaceAreaController.text);
//                         calculateCylinderDimensions(surfaceArea);
//                       }
//                     },
//                     text: "Hisoblash",
//                     width: width,
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 20),
//               if (radius != null && height != null)
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Container(
//                       margin: EdgeInsets.only(bottom: width * 0.02),
//                       color: Colors.cyan.shade200,
//                       child: Padding(
//                         padding: EdgeInsets.symmetric(
//                           horizontal: width * 0.04,
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             TextWidget(
//                               data: "Radius: ",
//                               color: Colors.white,
//                               size: width * 0.05,
//                             ),
//                             TextWidget(
//                               data: radius!.toStringAsFixed(2),
//                               color: Colors.white,
//                               size: width * 0.05,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     Container(
//                       margin: EdgeInsets.only(bottom: width * 0.02),
//                       color: Colors.cyan.shade200,
//                       child: Padding(
//                         padding: EdgeInsets.symmetric(
//                           horizontal: width * 0.04,
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             TextWidget(
//                               data: "Balandlik: ",
//                               color: Colors.white,
//                               size: width * 0.05,
//                             ),
//                             TextWidget(
//                               data: height!.toStringAsFixed(2),
//                               color: Colors.white,
//                               size: width * 0.05,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:triangle/widgets/button.dart';
import 'dart:math';

import 'package:triangle/widgets/text.dart';

class CylinderCalculator extends StatefulWidget {
  const CylinderCalculator({super.key});

  @override
  CylinderCalculatorState createState() => CylinderCalculatorState();
}

class CylinderCalculatorState extends State<CylinderCalculator> {
  final _formKey = GlobalKey<FormState>();
  final _surfaceAreaController = TextEditingController();
  double? radius;
  double? height;

  void calculateCylinderDimensions(double surfaceArea) {
    double r = sqrt((surfaceArea / 2) / 3);
    double h = (surfaceArea - 2 * r * r) / (2 * r);
    setState(() {
      radius = r;
      height = h;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        toolbarHeight: width * 0.2,
        backgroundColor: Colors.green,
        title: TextWidget(
          data: "Silindr Hajmini Topish",
          color: Colors.white,
          size: width * 0.07,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: _surfaceAreaController,
                decoration: const InputDecoration(
                  labelText: 'Tekislik yuzasi (π bilan, masalan: 150)',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Yuzani kiriting';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonWidget(
                    color: Colors.green,
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        double surfaceArea =
                            double.parse(_surfaceAreaController.text);
                        calculateCylinderDimensions(surfaceArea);
                      }
                    },
                    text: "Hisoblash",
                    width: width,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              if (radius != null && height != null) ...[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: width * 0.02),
                      color: Colors.green.shade200,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: width * 0.04,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextWidget(
                              data: "Radius: ",
                              color: Colors.white,
                              size: width * 0.05,
                            ),
                            TextWidget(
                              data: radius!.toStringAsFixed(2),
                              color: Colors.white,
                              size: width * 0.05,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: width * 0.02),
                      color: Colors.green.shade200,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: width * 0.04,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextWidget(
                              data: "Balandlik: ",
                              color: Colors.white,
                              size: width * 0.05,
                            ),
                            TextWidget(
                              data: height!.toStringAsFixed(2),
                              color: Colors.white,
                              size: width * 0.05,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                CustomPaint(
                  size: Size(width * 0.5, width * 0.5),
                  painter: CylinderPainter(radius: radius!, height: height!),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class CylinderPainter extends CustomPainter {
  final double radius;
  final double height;

  CylinderPainter({required this.radius, required this.height});

  @override
  void paint(Canvas canvas, Size size) {
    // Kattalashtirish uchun 5x marta ko'paytirish
    final double scaledRadius = radius * 10;
    final double scaledHeight = height * 10;

    final paint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.fill;

    final topCenter = Offset(size.width / 2, size.height / 4);
    final bottomCenter = Offset(size.width / 2, (size.height / 4) + scaledHeight);

    // Yuqori qism (oval)
    canvas.drawOval(
      Rect.fromCenter(
        center: topCenter,
        width: scaledRadius * 2,
        height: scaledRadius / 2,
      ),
      paint,
    );

    // Silindrning tanasi
    final cylinderBodyPath = Path()
      ..moveTo(topCenter.dx - scaledRadius, topCenter.dy)
      ..lineTo(bottomCenter.dx - scaledRadius, bottomCenter.dy)
      ..lineTo(bottomCenter.dx + scaledRadius, bottomCenter.dy)
      ..lineTo(topCenter.dx + scaledRadius, topCenter.dy)
      ..close();

    canvas.drawPath(cylinderBodyPath, paint);

    // Pastki qism (oval)
    canvas.drawOval(
      Rect.fromCenter(
        center: bottomCenter,
        width: scaledRadius * 2,
        height: scaledRadius / 2,
      ),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
