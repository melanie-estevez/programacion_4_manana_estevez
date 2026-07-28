import 'package:flutter/material.dart';

class PantallaAppBar extends StatelessWidget {
  const PantallaAppBar({super.key});

  static const _platos = [
    'Ceviche Clásico',
    'Lomo Saltado',
    'Ají de Gallina',
    'Arroz con Mariscos',
    'Causa Limeña',
    'Anticuchos',
    'Papa a la Huancaína',
    'Suspiro a la Limeña',
    'Chicha Morada',
    'Pisco Sour',
  ];

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      body: CustomScrollView(
        slivers: [

          SliverAppBar.large(
            title:           const Text('Menú'),
            pinned:          true,
            backgroundColor: cs.primaryContainer,
            foregroundColor: cs.onPrimaryContainer,
            actions: [
              IconButton(
                icon:      const Icon(Icons.filter_list),
                onPressed: () {},
                tooltip:   'Filtrar',
              ),
              IconButton(
                icon:      const Icon(Icons.search),
                onPressed: () {},
                tooltip:   'Buscar',
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: cs.primaryContainer,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 56),
                    Icon(Icons.restaurant_menu, size: 48, color: cs.onPrimaryContainer),
                    const SizedBox(height: 8),
                    Text(
                      '8 platos disponibles',
                      style: TextStyle(color: cs.onPrimaryContainer),
                    ),
                  ],
                ),
              ),
            ),
          ),


          SliverPadding(
            padding: const EdgeInsets.all(8),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, i) => Card(
                  child: ListTile(
                    leading:  Icon(Icons.lunch_dining, color: cs.primary),
                    title:    Text(_platos[i]),
                    subtitle: Text('Categoría ${i % 4 == 0 ? "Entrada" : i % 4 == 1 ? "Principal" : i % 4 == 2 ? "Bebida" : "Postre"} · Disponible'),
                    trailing: Chip(
                      label:           const Text('OK'),
                      backgroundColor: cs.primaryContainer,
                      labelStyle:      TextStyle(color: cs.onPrimaryContainer),
                    ),
                    onTap: () {},
                  ),
                ),
                childCount: _platos.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
