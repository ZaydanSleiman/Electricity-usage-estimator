import 'package:flutter/material.dart';
import 'input_page.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  static final List<Map<String, dynamic>> appliances = [
    {"name": "Fan", "defaultWatt": 75, "icon": Icons.toys},
    {"name": "Fridge", "defaultWatt": 150, "icon": Icons.kitchen},
    {"name": "TV", "defaultWatt": 100, "icon": Icons.tv},
    {"name": "Laptop", "defaultWatt": 60, "icon": Icons.laptop},
    {"name": "Light Bulb", "defaultWatt": 12, "icon": Icons.lightbulb},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select Appliance')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: appliances.length,
        separatorBuilder: (_, __) => const SizedBox(height: 8),
        itemBuilder: (context, index) {
          final item = appliances[index];
          return Card(
            child: ListTile(
              leading: Icon(item["icon"] as IconData),
              title: Text(item["name"] as String),
              subtitle: Text('Default: ${item["defaultWatt"]} W'),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => InputPage(
                      appliance: item["name"] as String,
                      defaultWatt: item["defaultWatt"] as int,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
