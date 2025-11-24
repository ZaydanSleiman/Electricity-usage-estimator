import 'package:flutter/material.dart';
import 'result_page.dart';

class InputPage extends StatefulWidget {
  final String appliance;
  final int defaultWatt;

  const InputPage({
    super.key,
    required this.appliance,
    required this.defaultWatt,
  });

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final TextEditingController wattController = TextEditingController();
  final TextEditingController hoursController = TextEditingController();
  final TextEditingController rateController =
      TextEditingController(text: '0.14'); 

  @override
  void initState() {
    super.initState();
    wattController.text = widget.defaultWatt.toString();
  }

  @override
  void dispose() {
    wattController.dispose();
    hoursController.dispose();
    rateController.dispose();
    super.dispose();
  }

  void _calculate() {
    final double watt = double.tryParse(wattController.text) ?? 0;
    final double hours = double.tryParse(hoursController.text) ?? 0;
    final double rate = double.tryParse(rateController.text) ?? 0.14;

    if (watt <= 0 || hours <= 0 || rate <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter valid positive numbers.')),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ResultPage(
          appliance: widget.appliance,
          wattage: watt,
          hours: hours,
          rate: rate,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Enter Usage: ${widget.appliance}')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: wattController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Wattage (W)',
                hintText: 'e.g., 100',
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: hoursController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Hours used per day',
                hintText: 'e.g., 5',
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: rateController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Rate per kWh (\$)',
                hintText: 'e.g., 0.14',
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _calculate,
                child: const Text('Calculate'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
