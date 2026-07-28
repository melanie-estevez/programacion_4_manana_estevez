import 'package:flutter/material.dart';
import 'package:modulo08_material3_mp/screens/pantalla_appbar.dart';
import 'package:modulo08_material3_mp/screens/pantalla_dialogs.dart';
import 'package:modulo08_material3_mp/screens/pantalla_navegacion.dart';
import 'package:modulo08_material3_mp/screens/pantalla_tema.dart';
import 'package:modulo08_material3_mp/widgets/catalogo_botones.dart';

const int paso = 6;

void main() => runApp(const AppRestaurante());

class AppRestaurante extends StatefulWidget {
  const AppRestaurante({super.key});
  @override
  State<AppRestaurante> createState() => _AppRestauranteState();
}

class _AppRestauranteState extends State<AppRestaurante> {
  ThemeMode _themeMode = ThemeMode.system;

  @override
  Widget build(BuildContext context) {
    const seedColor = Color(0xFFBF360C);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: _themeMode,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: seedColor, brightness: Brightness.light),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: seedColor, brightness: Brightness.dark),
        useMaterial3: true,
      ),
      home: switch (paso) {
        1 => const _Paso1(),
        2 => PantallaTema(
       themeMode: _themeMode,
       onToggle:  (mode) => setState(() => _themeMode = mode),
       ),
       3 => const PantallaAppBar(),
       4 => const CatalogoBotones(),
       5 => const PantallaNavegacion(),
       6 => const PantallaDialogs(),
        _ => Scaffold(
            body: Center(child: Text('Paso $paso: crea el widget primero'))),
      },
    );
  }
}

class _Paso1 extends StatelessWidget {
  const _Paso1();

  @override
  Widget build(BuildContext context) {
    final cs   = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title:           const Text('Sabor Local'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
        actions: [
          IconButton(icon: const Icon(Icons.refresh), onPressed: () {}),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.restaurant, size: 64, color: cs.primary),
            const SizedBox(height: 16),
            Text(
              'Lomo Saltado',
              style: text.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Principal · 25 min · Parrilla',
              style: text.bodyMedium?.copyWith(color: cs.onSurfaceVariant),
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: () {},
              icon:  const Icon(Icons.receipt_long),
              label: const Text('Tomar pedido'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
