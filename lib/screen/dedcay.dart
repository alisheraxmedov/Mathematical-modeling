import 'package:flutter/material.dart';
import 'dart:math';

import 'package:triangle/widgets/button.dart';
import 'package:triangle/widgets/text.dart';

class RadioactiveDecayCalculator extends StatefulWidget {
  const RadioactiveDecayCalculator({super.key});

  @override
  RadioactiveDecayCalculatorState createState() =>
      RadioactiveDecayCalculatorState();
}

class RadioactiveDecayCalculatorState
    extends State<RadioactiveDecayCalculator> {
  final _formKey = GlobalKey<FormState>();
  final _initialAtomsController = TextEditingController();
  final _remainingAtomsController = TextEditingController();
  final _decayCoefficientController = TextEditingController();
  double? time;

  void calculateTime(double N0, double N, double lambda) {
    double t = -log(N / N0) / lambda;
    setState(() {
      time = t;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        toolbarHeight: width * 0.2,
        backgroundColor: Colors.green,
        title: Text(
          "Radioaktivlik Vaqtini Topish",
          style: TextStyle(color: Colors.white, fontSize: width * 0.07),
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
                controller: _initialAtomsController,
                decoration: const InputDecoration(
                  labelText: 'Dastlabki atomlar soni (N0)',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Dastlabki atomlar sonini kiriting';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _remainingAtomsController,
                decoration: const InputDecoration(
                  labelText: 'Qoladigan atomlar soni (N)',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Qoladigan atomlar sonini kiriting';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _decayCoefficientController,
                decoration: const InputDecoration(
                  labelText: 'Sochilish koeffitsiyenti (λ)',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Sochilish koeffitsiyentini kiriting';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ButtonWidget(
                color: Colors.green,
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    double N0 = double.parse(_initialAtomsController.text);
                    double N = double.parse(_remainingAtomsController.text);
                    double lambda =
                        double.parse(_decayCoefficientController.text);
                    calculateTime(N0, N, lambda);
                  }
                },
                text: "Hisoblash",
                width: width,
              ),
              const SizedBox(height: 20),
              if (time != null)
                Container(
                  // width: double.infinity,
                  color: Colors.green.shade200,
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.04,
                    vertical: width * 0.02,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(
                        data: "Vaqt (t): ",
                        color: Colors.white,
                        size: width * 0.05,
                      ),
                      TextWidget(
                        data: "${time!.toStringAsFixed(2)} s",
                        color: Colors.white,
                        size: width * 0.05,
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
