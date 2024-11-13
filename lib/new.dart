// import 'dart:math';
// import 'package:flutter/material.dart';

// void main() => runApp(const TriangleApp());

// class TriangleApp extends StatelessWidget {
//   const TriangleApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: TriangleCalculator(),
//     );
//   }
// }

// class TriangleCalculator extends StatefulWidget {
//   const TriangleCalculator({super.key});

//   @override
//   TriangleCalculatorState createState() => TriangleCalculatorState();
// }

// class TriangleCalculatorState extends State<TriangleCalculator> {
//   final TextEditingController sideAController = TextEditingController();
//   final TextEditingController sideBController = TextEditingController();
//   final TextEditingController sideCController = TextEditingController();

//   String selectedTriangleType = "Uchburchak turi";
//   double? area;
//   double? height;
//   double? perimeter;
//   double a = 0, b = 0, c = 0;

//   void calculateTriangleProperties() {
//     a = double.tryParse(sideAController.text) ?? 0;
//     b = double.tryParse(sideBController.text) ?? 0;
//     c = double.tryParse(sideCController.text) ?? 0;

//     switch (selectedTriangleType) {
//       case "To'g'ri burchakli":
//         if (a > 0 && b > 0) {
//           c = sqrt(a * a + b * b);
//           perimeter = a + b + c;
//           area = 0.5 * a * b;
//           height = b;
//         }
//         break;

//       case "Teng tomonli":
//         if (a > 0) {
//           perimeter = 3 * a;
//           area = (sqrt(3) / 4) * a * a;
//           height = (sqrt(3) / 2) * a;
//         }
//         break;

//       case "Teng yonli":
//         if (a > 0 && b > 0) {
//           perimeter = 2 * a + b;
//           double semiPerimeter = perimeter! / 2;
//           area = sqrt(semiPerimeter * (semiPerimeter - a) * (semiPerimeter - a) * (semiPerimeter - b));
//           height = (2 * area!) / b;
//         }
//         break;

//       case "Turli tomonli":
//         if (a > 0 && b > 0 && c > 0 && a + b > c && a + c > b && b + c > a) {
//           perimeter = a + b + c;
//           double semiPerimeter = perimeter! / 2;
//           area = sqrt(semiPerimeter * (semiPerimeter - a) * (semiPerimeter - b) * (semiPerimeter - c));
//           height = (2 * area!) / a;
//         }
//         break;
//     }

//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Uchburchak Hisoblagichi"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             DropdownButton<String>(
//               value: selectedTriangleType,
//               items: [
//                 "Uchburchak turi",
//                 "To'g'ri burchakli",
//                 "Teng tomonli",
//                 "Teng yonli",
//                 "Turli tomonli",
//               ].map((String type) {
//                 return DropdownMenuItem<String>(
//                   value: type,
//                   child: Text(type),
//                 );
//               }).toList(),
//               onChanged: (value) {
//                 setState(() {
//                   selectedTriangleType = value!;
//                   area = null;
//                   height = null;
//                   perimeter = null;
//                   sideAController.clear();
//                   sideBController.clear();
//                   sideCController.clear();
//                 });
//               },
//             ),
//             const SizedBox(height: 20),
//             if (selectedTriangleType == "To'g'ri burchakli") ...[
//               TextField(
//                 controller: sideAController,
//                 decoration: const InputDecoration(labelText: "Katet A"),
//                 keyboardType: TextInputType.number,
//               ),
//               TextField(
//                 controller: sideBController,
//                 decoration: const InputDecoration(labelText: "Katet B"),
//                 keyboardType: TextInputType.number,
//               ),
//             ] else if (selectedTriangleType == "Teng tomonli") ...[
//               TextField(
//                 controller: sideAController,
//                 decoration: const InputDecoration(labelText: "Tomon A"),
//                 keyboardType: TextInputType.number,
//               ),
//             ] else if (selectedTriangleType == "Teng yonli") ...[
//               TextField(
//                 controller: sideAController,
//                 decoration: const InputDecoration(labelText: "Teng tomon A"),
//                 keyboardType: TextInputType.number,
//               ),
//               TextField(
//                 controller: sideBController,
//                 decoration: const InputDecoration(labelText: "Asos B"),
//                 keyboardType: TextInputType.number,
//               ),
//             ] else if (selectedTriangleType == "Turli tomonli") ...[
//               TextField(
//                 controller: sideAController,
//                 decoration: const InputDecoration(labelText: "Tomon A"),
//                 keyboardType: TextInputType.number,
//               ),
//               TextField(
//                 controller: sideBController,
//                 decoration: const InputDecoration(labelText: "Tomon B"),
//                 keyboardType: TextInputType.number,
//               ),
//               TextField(
//                 controller: sideCController,
//                 decoration: const InputDecoration(labelText: "Tomon C"),
//                 keyboardType: TextInputType.number,
//               ),
//             ],
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: calculateTriangleProperties,
//               child: const Text("Hisoblash"),
//             ),
//             const SizedBox(height: 20),
//             if (area != null && height != null && perimeter != null) ...[
//               Text("Perimetr: ${perimeter!.toStringAsFixed(2)}"),
//               Text("Yuza: ${area!.toStringAsFixed(2)}"),
//               Text("Balandlik: ${height!.toStringAsFixed(2)}"),
//               const SizedBox(height: 20),
//               Expanded(
//                 child: CustomPaint(
//                   painter: TrianglePainter(a, b, c, selectedTriangleType),
//                   child: Container(),
//                 ),
//               ),
//             ],
//           ],
//         ),
//       ),
//     );
//   }
// }

// class TrianglePainter extends CustomPainter {
//   final double a, b, c;
//   final String triangleType;

//   TrianglePainter(this.a, this.b, this.c, this.triangleType);

//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = Colors.blue
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 2;

//     final textPainter = TextPainter(
//       textDirection: TextDirection.ltr,
//     );

//     final double scale = min(size.width / (a + b + c), size.height / (a + b + c));

//     if (triangleType == "To'g'ri burchakli") {
//       const p1 = Offset(0, 0);
//       final p2 = Offset(a * scale, 0);
//       final p3 = Offset(0, b * scale);

//       canvas.drawLine(p1, p2, paint);
//       canvas.drawLine(p2, p3, paint);
//       canvas.drawLine(p3, p1, paint);

//       drawText(canvas, textPainter, "A ($a)", p1);
//       drawText(canvas, textPainter, "B ($b)", p3);
//       drawText(canvas, textPainter, "C (${c.toStringAsFixed(2)})", p2);

//     } else if (triangleType == "Teng tomonli") {
//       final p1 = Offset(size.width / 2, 0);
//       final p2 = Offset(p1.dx - a * scale / 2, a * scale * sqrt(3) / 2);
//       final p3 = Offset(p1.dx + a * scale / 2, a * scale * sqrt(3) / 2);

//       canvas.drawLine(p1, p2, paint);
//       canvas.drawLine(p2, p3, paint);
//       canvas.drawLine(p3, p1, paint);

//       drawText(canvas, textPainter, "A ($a)", p1);
//     }
//     // Qo'shimcha uchburchak turlari uchun ham chizishni o'rnatish mumkin
//   }

//   void drawText(Canvas canvas, TextPainter textPainter, String text, Offset position) {
//     textPainter.text = TextSpan(
//       text: text,
//       style: const TextStyle(color: Colors.black, fontSize: 12),
//     );
//     textPainter.layout();
//     textPainter.paint(canvas, position);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) => false;
// }
