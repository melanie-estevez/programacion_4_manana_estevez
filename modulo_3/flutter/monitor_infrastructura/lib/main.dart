import 'package:flutter/material.dart';
import 'screens/pantalla_dashboard.dart';

void main() => runApp(const AppMonitor());

class AppMonitor extends StatelessWidget {
  const AppMonitor({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:                      'Monitor Infraestructura',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme:  ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const PantallaDashboard(),
    );
  }
}