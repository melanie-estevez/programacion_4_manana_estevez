import 'package:flutter/material.dart';

class PantallaNavegacion extends StatefulWidget {
  const PantallaNavegacion({super.key});

  @override
  State<PantallaNavegacion> createState() => _PantallaNavegacionState();
}

class _PantallaNavegacionState extends State<PantallaNavegacion> {
  int _indice = 0;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title:           const Text('Sabor Local'),
        backgroundColor: cs.surfaceContainerHighest,
      ),
      body: IndexedStack(
        index: _indice,
        children: const [
          _PantallaMenu(),
          _PantallaPedidos(),
          _PantallaCocina(),
          _PantallaAjustes(),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex:         _indice,
        onDestinationSelected: (i) => setState(() => _indice = i),
        indicatorColor: cs.tertiaryContainer,
        destinations: const [
          NavigationDestination(
            icon:         Icon(Icons.restaurant_menu_outlined),
            selectedIcon: Icon(Icons.restaurant_menu),
            label:        'Menú',
          ),
          NavigationDestination(
            icon:         Icon(Icons.receipt_long_outlined),
            selectedIcon: Icon(Icons.receipt_long),
            label:        'Pedidos',
          ),
          NavigationDestination(
            icon:         Badge(label: Text('3'), child: Icon(Icons.soup_kitchen_outlined)),
            selectedIcon: Badge(label: Text('3'), child: Icon(Icons.soup_kitchen)),
            label:        'Cocina',
          ),
          NavigationDestination(
            icon:         Icon(Icons.settings_outlined),
            selectedIcon: Icon(Icons.settings),
            label:        'Ajustes',
          ),
        ],
      ),
    );
  }
}

class _PantallaMenu extends StatelessWidget {
  const _PantallaMenu();

  @override
  Widget build(BuildContext context) {
    final cs   = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text('Resumen', style: text.headlineSmall),
        const SizedBox(height: 16),

        Row(children: [
          Expanded(child: _TarjetaMetrica(titulo: 'Platos', valor: '8',  icono: Icons.lunch_dining, color: cs.primaryContainer)),
          const SizedBox(width: 8),
          Expanded(child: _TarjetaMetrica(titulo: 'Urgentes', valor: '3',  icono: Icons.priority_high, color: cs.tertiaryContainer)),
        ]),
        const SizedBox(height: 8),
        Row(children: [
          Expanded(child: _TarjetaMetrica(titulo: 'Mesas',   valor: '12', icono: Icons.table_bar, color: cs.tertiaryContainer)),
          const SizedBox(width: 8),
          Expanded(child: _TarjetaMetrica(titulo: 'Stock',  valor: '86%', icono: Icons.inventory_2, color: cs.secondaryContainer)),
        ]),
      ],
    );
  }
}

class _TarjetaMetrica extends StatelessWidget {
  final String titulo;
  final String valor;
  final IconData icono;
  final Color    color;

  const _TarjetaMetrica({
    required this.titulo,
    required this.valor,
    required this.icono,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;

    return Card(
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icono, size: 28),
            const SizedBox(height: 8),
            Text(valor,  style: text.headlineMedium?.copyWith(fontWeight: FontWeight.bold)),
            Text(titulo, style: text.bodySmall),
          ],
        ),
      ),
    );
  }
}

class _PantallaPedidos extends StatelessWidget {
  const _PantallaPedidos();

  static const _platos = [
    'Ceviche Clásico',
    'Lomo Saltado',
    'Ají de Gallina',
    'Arroz con Mariscos',
    'Causa Limeña',
    'Suspiro a la Limeña',
  ];

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: _platos.length,
      itemBuilder: (ctx, i) => Card(
        child: ListTile(
          leading:  Icon(Icons.lunch_dining, color: cs.primary),
          title:    Text(_platos[i]),
          subtitle: Text('Mesa ${i + 1} · En cocina'),
          trailing: Icon(Icons.chevron_right, color: cs.onSurfaceVariant),
          onTap: () {},
        ),
      ),
    );
  }
}

class _PantallaCocina extends StatelessWidget {
  const _PantallaCocina();

  @override
  Widget build(BuildContext context) {
    final cs   = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    const pedidos = [
      (plato: 'Lomo Saltado',  mensaje: 'Prep > 20 min',         nivel: 'URGENTE'),
      (plato: 'Ceviche Clásico', mensaje: 'Stock bajo',      nivel: 'AVISO'),
      (plato: 'Arroz con Mariscos', mensaje: 'Sin mariscos frescos', nivel: 'URGENTE'),
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: pedidos.length,
      itemBuilder: (ctx, i) {
        final pedido = pedidos[i];
        final esUrgente = pedido.nivel == 'URGENTE';

        return Card(
          color: esUrgente ? cs.errorContainer : cs.tertiaryContainer,
          child: ListTile(
            leading: Icon(
              esUrgente ? Icons.error : Icons.warning,
              color: esUrgente ? cs.onErrorContainer : cs.onTertiaryContainer,
            ),
            title: Text(pedido.plato,
                style: text.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
            subtitle: Text(pedido.mensaje),
            trailing: Chip(
              label: Text(pedido.nivel, style: const TextStyle(fontSize: 11)),
              backgroundColor: esUrgente ? cs.error : cs.tertiary,
              labelStyle: TextStyle(
                color: esUrgente ? cs.onError : cs.onTertiary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }
}

class _PantallaAjustes extends StatelessWidget {
  const _PantallaAjustes();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        ListTile(
          leading: Icon(Icons.notifications_outlined),
          title:   Text('Notificaciones'),
          trailing: Icon(Icons.chevron_right),
        ),
        ListTile(
          leading: Icon(Icons.restaurant_outlined),
          title:   Text('Datos del local'),
          trailing: Icon(Icons.chevron_right),
        ),
        ListTile(
          leading: Icon(Icons.info_outline),
          title:   Text('Acerca de'),
          trailing: Icon(Icons.chevron_right),
        ),
      ],
    );
  }
}
