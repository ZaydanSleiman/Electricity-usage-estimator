import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String appliance;
  final double wattage;
  final double hours;
  final double rate;

  const ResultPage({
    super.key,required this.appliance,required this.wattage,required this.hours,required this.rate,});

  double get kWh => (wattage * hours) / 1000;
  double get dailyCost => kWh * rate;
  double get monthlyCost => dailyCost * 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Estimated Usage')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Card(
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    appliance,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 12),
                  Text('Wattage: ${wattage.toStringAsFixed(0)} W'),
                  Text('Hours per day: ${hours.toStringAsFixed(2)} h'),
                  Text('Rate: \$${rate.toStringAsFixed(2)} per kWh'),
                  const Divider(height: 24),
                  Text('Daily consumption: ${kWh.toStringAsFixed(2)} kWh'),
                  Text('Daily cost: \$${dailyCost.toStringAsFixed(2)}'),
                  Text('Monthly cost (approx): \$${monthlyCost.toStringAsFixed(2)}'),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Edit values'),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () =>
                              Navigator.popUntil(context, (route) => route.isFirst),
                          child: const Text('Back to Home'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
