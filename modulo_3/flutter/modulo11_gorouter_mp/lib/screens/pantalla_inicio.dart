import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PantallaInicio extends StatelessWidget {
  const PantallaInicio({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title:           const Text('Sabor Local'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.restaurant, size: 64, color: cs.primary),
            const SizedBox(height: 16),
            const Text('Sabor Local',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('Gestiona tu menú y pedidos',
                style: TextStyle(color: cs.onSurfaceVariant)),
            const SizedBox(height: 32),
            FilledButton.icon(

              onPressed: () => context.go('/platos'),
              icon:  const Icon(Icons.restaurant_menu),
              label: const Text('Ver menú'),
            ),
          ],
        ),
      ),
    );
  }
}
