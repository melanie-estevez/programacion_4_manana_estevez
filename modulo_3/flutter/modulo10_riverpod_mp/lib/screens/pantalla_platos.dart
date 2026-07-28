import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modulo10_riverpod_mp/models/plato.dart';
import '../providers/platos_provider.dart';

class PantallaPlatos extends ConsumerWidget {
  const PantallaPlatos({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final platos = ref.watch(platosProvider);
    final cs         = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title:           Text('Platos (${platos.length})'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: platos.isEmpty
          ? const Center(child: Text('Sin platos'))
          : ListView.separated(
              itemCount:        platos.length,
              separatorBuilder: (_, __) =>
                  const Divider(height: 1, indent: 72),
              itemBuilder: (context, i) {
                final s = platos[i];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: s.disponible
                        ? Colors.green.shade50
                        : Colors.grey.shade100,
                    child: Icon(Icons.lunch_dining,
                        color: s.disponible ? Colors.green : Colors.grey),
                  ),
                  title:    Text(s.nombre,
                      style: const TextStyle(fontWeight: FontWeight.w600)),
                  subtitle: Text('${s.codigo} · ${s.tiempoPrep} min'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(
                          s.destacado ? Icons.star : Icons.star_border,
                          color: s.destacado ? Colors.amber : null,
                        ),
                        onPressed: () => ref
                            .read(platosProvider.notifier)
                            .toggleDestacado(s.id),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete_outline,
                            color: Colors.red),
                        onPressed: () => ref
                            .read(platosProvider.notifier)
                            .eliminar(s.id),
                      ),
                    ],
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final id = DateTime.now().millisecondsSinceEpoch.toString();
          ref.read(platosProvider.notifier).agregar(
            Plato(
              id:         id,
              nombre:     'Nuevo plato $id',
              codigo:     'PLT-${platos.length + 1}',
              tiempoPrep: 15,
              disponible: true,
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
