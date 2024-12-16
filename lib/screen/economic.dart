// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'dart:math';

import 'package:triangle/widgets/button.dart';
import 'package:triangle/widgets/text.dart';

class PopulationGrowthCalculator extends StatefulWidget {
  const PopulationGrowthCalculator({super.key});

  @override
  PopulationGrowthCalculatorState createState() =>
      PopulationGrowthCalculatorState();
}

class PopulationGrowthCalculatorState
    extends State<PopulationGrowthCalculator> {
  final _formKey = GlobalKey<FormState>();
  final _initialPopulationController = TextEditingController();
  final _timeController = TextEditingController();
  final _alphaController = TextEditingController();
  final _betaController = TextEditingController();
  double? population;

  double parseExpression(String expr, double t) {
    return double.parse(expr.replaceAll('t', t.toString()));
  }

  double calculateIntegral(String alphaExpr, String betaExpr, double t) {
    int n = 1000;
    double h = t / n;
    double integral = 0.0;

    for (int i = 0; i < n; i++) {
      double x0 = i * h;
      double x1 = (i + 1) * h;
      double alpha0 = parseExpression(alphaExpr, x0);
      double beta0 = parseExpression(betaExpr, x0);
      double alpha1 = parseExpression(alphaExpr, x1);
      double beta1 = parseExpression(betaExpr, x1);
      double avgValue = (alpha0 - beta0 + alpha1 - beta1) / 2;
      integral += avgValue * h;
    }

    return integral;
  }

  void calculatePopulation(
      double N0, String alphaExpr, String betaExpr, double t) {
    double integral = calculateIntegral(alphaExpr, betaExpr, t);
    double Nt = N0 * exp(integral);
    setState(() {
      population = Nt;
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
        title: TextWidget(
          data: "Aholi O'sishi Hisoblagichi",
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
                controller: _initialPopulationController,
                decoration: const InputDecoration(
                  labelText: "Boshlang'ich aholi soni (N0)",
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Boshlang'ich aholi sonini kiriting";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _timeController,
                decoration: const InputDecoration(
                  labelText: 'Vaqt (yil)',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vaqtni kiriting';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _alphaController,
                decoration: const InputDecoration(
                  labelText: "Tug'ilish koeffitsiyenti (α(t))",
                  hintText: "Masalan: 0.3",
                ),
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Tug'ilish koeffitsiyentini kiriting";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _betaController,
                decoration: const InputDecoration(
                  labelText: "O'lim koeffitsiyenti (β(t))",
                  hintText: 'Masalan: 0.5',
                ),
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "O'lim koeffitsiyentini kiriting";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ButtonWidget(
                color: Colors.green,
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    double N0 = double.parse(_initialPopulationController.text);
                    double t = double.parse(_timeController.text);
                    String alphaExpr = _alphaController.text;
                    String betaExpr = _betaController.text;
                    calculatePopulation(N0, alphaExpr, betaExpr, t);
                  }
                },
                text: "Hisoblash",
                width: width,
              ),
              const SizedBox(height: 20),
              if (population != null)
                Container(
                  color: Colors.green.shade200,
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.04,
                    vertical: width * 0.02,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(
                        data: "Aholi soni (N(t)): ",
                        color: Colors.white,
                        size: width * 0.05,
                      ),
                      TextWidget(
                        data: population!.toStringAsFixed(2),
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
