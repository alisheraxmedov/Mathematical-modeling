import 'package:flutter/material.dart';
import 'package:triangle/widgets/button.dart';
import 'package:triangle/widgets/text.dart';

class SimplexScreen extends StatefulWidget {
  const SimplexScreen({super.key});

  @override
  SimplexScreenState createState() => SimplexScreenState();
}

class SimplexScreenState extends State<SimplexScreen> {
  int xCount = 0; // O'zgaruvchilar soni
  int sCount = 0; // Tengsizliklar soni

  List<TextEditingController> coefficients = [];
  List<List<TextEditingController>> constraints = [];
  List<TextEditingController> sCoefficients = [];

  final TextEditingController xCountController = TextEditingController();
  final TextEditingController sCountController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initializeControllers();
  }

  void _initializeControllers() {
    coefficients = List.generate(xCount, (index) => TextEditingController());
    sCoefficients = List.generate(sCount, (index) => TextEditingController());

    constraints = List.generate(
      sCount,
      (index) => List.generate(xCount + sCount + 1,
          (i) => TextEditingController()), // +1 for the b values
    );
  }

  void _updateCount() {
    setState(() {
      xCount = int.tryParse(xCountController.text) ?? xCount;
      sCount = int.tryParse(sCountController.text) ?? sCount;
      _initializeControllers();
    });
  }

  void _calculateSimplex() {
    // Simpleks algoritmini shu yerda amalga oshirish kerak
    // Natijalarini UI da ko'rsatish uchun updateState() ni chaqirish kerak
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
          data: "Simpleks Usuli",
          color: Colors.white,
          size: width * 0.07,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: TextField(
                      controller: xCountController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "x1, x2, x3 soni",
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(width: width * 0.05),
                  Expanded(
                    flex: 1,
                    child: TextField(
                      controller: sCountController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Tengsizlik soni',
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              SizedBox(height: width * 0.05),
              ButtonWidget(
                color: Colors.green,
                onTap: _updateCount,
                text: "Jadval yaratish",
                width: width,
              ),
              SizedBox(height: width * 0.05),
              TextWidget(
                data: "Maqsadli funksiya koefitsiyentlari:",
                color: Colors.black,
                size: width * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(xCount, (index) {
                  return Flexible(
                    child: Padding(
                      padding: EdgeInsets.all(width * 0.0165),
                      child: TextField(
                        controller: coefficients[index],
                        decoration: InputDecoration(
                          labelText: 'x${index + 1}',
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  );
                }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(sCount, (index) {
                  return Flexible(
                    child: Padding(
                      padding: EdgeInsets.all(width * 0.0165),
                      child: TextField(
                        controller: sCoefficients[index],
                        decoration: InputDecoration(
                          labelText: 's${index + 1}',
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  );
                }),
              ),
              SizedBox(height: width * 0.05),
              TextWidget(
                data: "Tengsizliklar Koefitsiyentlari:",
                color: Colors.black,
                size: width * 0.05,
              ),
              ...List.generate(sCount, (index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(xCount + sCount + 1, (i) {
                    return Flexible(
                      child: Padding(
                        padding: EdgeInsets.all(width*0.0165),
                        child: TextField(
                          controller: constraints[index][i],
                          decoration: InputDecoration(
                            labelText: i < xCount
                                ? 'x${i + 1}'
                                : i < xCount + sCount
                                    ? 's${i - xCount + 1}'
                                    : 'b',
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    );
                  }),
                );
              }),
              SizedBox(height: width * 0.05),
              ButtonWidget(
                color: Colors.green,
                onTap: _calculateSimplex,
                text: "Natijani ko'rish",
                width: width,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
