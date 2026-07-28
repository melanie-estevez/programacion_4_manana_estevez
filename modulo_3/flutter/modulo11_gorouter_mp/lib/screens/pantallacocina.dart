import 'package:flutter/material.dart';

class PantallaCocina extends StatelessWidget {
  const PantallaCocina({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    body: const Center(child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.soup_kitchen, size: 56),
        SizedBox(height: 8),
        Text('Cocina — tickets activos', style: TextStyle(fontSize: 18)),
      ],
    )),
  );
}
