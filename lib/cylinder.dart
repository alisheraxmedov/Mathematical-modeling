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
    double r = sqrt(surfaceArea / (3 * pi));
    double h = (surfaceArea / (2 * pi * r)) - r;

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
        backgroundColor: Colors.cyan,
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
                    color: Colors.cyan,
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
              if (radius != null && height != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: width * 0.02),
                      color: Colors.cyan.shade200,
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
                      color: Colors.cyan.shade200,
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
            ],
          ),
        ),
      ),
    );
  }
}
