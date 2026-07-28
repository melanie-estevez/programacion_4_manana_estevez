import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/plato.dart';

class PantallaDetalle extends StatelessWidget {
  final String id;
  final Plato? plato;

  const PantallaDetalle({super.key, required this.id, this.plato});

  @override
  Widget build(BuildContext context) {

    final plt = plato ??
        platosSimulados.where((s) => s.id == id).firstOrNull;

    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title:           Text('Detalle: ${plt?.nombre ?? id}'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: plt == null
          ? Center(child: Text('Plato $id no encontrado'))
          : Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _Fila('ID',       plt.id),
                  _Fila('Nombre',   plt.nombre),
                  _Fila('Código',   plt.codigo),
                  _Fila('Prep',     '${plt.tiempoPrep} min'),
                  _Fila('Estado',   plt.disponible ? 'Disponible' : 'Agotado'),
                  const SizedBox(height: 24),
                  Row(children: [
                    OutlinedButton.icon(
                      onPressed: () => context.pop(),
                      icon:  const Icon(Icons.arrow_back),
                      label: const Text('Volver'),
                    ),
                    const SizedBox(width: 12),
                    FilledButton.icon(
                      onPressed: () => context.push('/platos/${plt.id}/notas'),
                      icon:  const Icon(Icons.receipt_long),
                      label: const Text('Ver notas'),
                    ),
                  ]),
                ],
              ),
            ),
    );
  }
}

class _Fila extends StatelessWidget {
  final String label;
  final String valor;
  const _Fila(this.label, this.valor);

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(children: [
        SizedBox(
          width: 70,
          child: Text(label,
              style: TextStyle(color: cs.onSurfaceVariant,
                  fontWeight: FontWeight.w600, fontSize: 12)),
        ),
        Text(valor, style: const TextStyle(fontSize: 15)),
      ]),
    );
  }
}
