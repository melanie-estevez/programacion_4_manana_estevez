import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'pantalla_platos.dart';
import 'pantalla_metricas.dart';

final indiceTabProvider = StateProvider<int>((ref) => 0);

class PantallaDashboard extends ConsumerWidget {
  const PantallaDashboard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final indice = ref.watch(indiceTabProvider);

    return Scaffold(
      body: switch (indice) {
        0 => const PantallaPlatos(),
        1 => const PantallaMetricas(),
        _ => const PantallaPlatos(),
      },
      bottomNavigationBar: NavigationBar(
        selectedIndex:         indice,
        onDestinationSelected: (i) =>
            ref.read(indiceTabProvider.notifier).state = i,
        destinations: const [
          NavigationDestination(
            icon:         Icon(Icons.restaurant_menu_outlined),
            selectedIcon: Icon(Icons.restaurant_menu),
            label:        'Platos',
          ),
          NavigationDestination(
            icon:         Icon(Icons.soup_kitchen_outlined),
            selectedIcon: Icon(Icons.soup_kitchen),
            label:        'Cocina',
          ),
        ],
      ),
    );
  }
}
