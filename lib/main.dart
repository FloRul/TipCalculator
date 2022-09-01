import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter tip app',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const TipCalculatorPage(title: 'Tip calculator'),
    );
  }
}

class TipCalculatorPage extends StatefulWidget {
  const TipCalculatorPage({super.key, required this.title});

  final String title;

  @override
  State<TipCalculatorPage> createState() => _TipCalculatorPageState();
}

class _TipCalculatorPageState extends State<TipCalculatorPage> {
  double bill = 0;
  int tipPercentage = 15;
  double tipAmount = 0;
  double totalAmount = 0;

  @override
  void initState() {
    super.initState();
    updateTip();
  }

  void updateTip() {
    tipAmount = bill * tipPercentage / 100;
    totalAmount = bill + tipAmount;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: const InputDecoration(label: Text('Bill amount')),
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
                signed: false,
              ),
              initialValue: bill.toString(),
              onChanged: (newBill) => setState(() {
                bill = double.tryParse(newBill) ?? 0;
                updateTip();
              }),
            ),
            TextFormField(
              decoration: const InputDecoration(label: Text('Tip percentage')),
              keyboardType: const TextInputType.numberWithOptions(
                decimal: false,
                signed: false,
              ),
              initialValue: tipPercentage.toString(),
              onChanged: (newTip) => setState(() {
                tipPercentage = int.tryParse(newTip) ?? 0;
                updateTip();
              }),
            ),
            const Text(
              'Tip amount',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              tipAmount.toString(),
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Total amount',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              totalAmount.toString(),
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
