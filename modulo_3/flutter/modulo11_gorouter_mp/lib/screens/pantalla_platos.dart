import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:modulo11_gorouter_mp/models/plato.dart';

class PantallaPlatos extends StatelessWidget {
  const PantallaPlatos({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final platos = platosSimulados;

    return Scaffold(
      appBar: AppBar(
        title:           const Text('Menú'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: ListView.builder(
        itemCount:   platos.length,
        itemBuilder: (context, i) => ListTile(
          leading: const Icon(Icons.lunch_dining),
          title:   Text(platos[i].nombre),
          onTap: () {

            context.push(
             '/platos/${platos[i].id}',
             extra: platos[i],
            );
          },
        ),
      ),
    );
  }


}
