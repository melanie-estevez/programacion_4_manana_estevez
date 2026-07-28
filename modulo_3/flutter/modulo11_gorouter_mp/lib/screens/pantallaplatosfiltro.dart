import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/plato.dart';

class PantallaPlatosFiltro extends StatelessWidget {
  final bool soloDisponibles;
  const PantallaPlatosFiltro({super.key, this.soloDisponibles = false});

  @override
  Widget build(BuildContext context) {
    final filtrados = soloDisponibles
        ? platosSimulados.where((s) => s.disponible).toList()
        : platosSimulados;

    return Scaffold(
      appBar: AppBar(
        title:   Text('Menú${soloDisponibles ? ' (disponibles)' : ''}'),
        actions: [

          IconButton(
            icon:    Icon(soloDisponibles ? Icons.check_circle : Icons.check_circle_outline),
            tooltip: soloDisponibles ? 'Ver todos' : 'Solo disponibles',
            onPressed: () => soloDisponibles
                ? context.go('/platos')
                : context.go('/platos?soloDisponibles=true'),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount:   filtrados.length,
        itemBuilder: (context, i) {
          final s = filtrados[i];
          return ListTile(
            leading: Icon(Icons.lunch_dining, color: s.disponible ? Colors.green : Colors.grey),
            title:   Text(s.nombre),
            subtitle: Text(s.codigo),
            onTap: () => context.push(
              '/platos/${s.id}',
              extra: s,
            ),
          );
        },
      ),
    );
  }
}
