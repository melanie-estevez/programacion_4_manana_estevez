import 'package:flutter/material.dart';
import '../models/plato.dart';

class FilaPlato extends StatelessWidget {
  final Plato        plato;
  final VoidCallback onDestacado;
  final VoidCallback onEliminar;

  const FilaPlato({
    super.key,
    required this.plato,
    required this.onDestacado,
    required this.onEliminar,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return ListTile(

      leading: CircleAvatar(
        backgroundColor: plato.disponible
            ? cs.primaryContainer
            : cs.surfaceContainerHighest,
        child: Icon(
          Icons.lunch_dining,
          color: plato.disponible ? cs.onPrimaryContainer : cs.onSurfaceVariant,
        ),
      ),
      title: Text(
        plato.nombre,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        '${plato.chef} · ${plato.codigo} · ${plato.tiempoPrep} min · ${plato.tipo}',
        style: TextStyle(fontSize: 12, color: cs.onSurfaceVariant),
      ),


      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(
              plato.destacado ? Icons.star : Icons.star_border,
              color: plato.destacado ? Colors.amber : cs.outline,
            ),
            onPressed:     onDestacado,
            visualDensity: VisualDensity.compact,
            tooltip:       plato.destacado ? 'Quitar destacado' : 'Marcar destacado',
          ),
          IconButton(
            icon:          Icon(Icons.delete_outline, color: cs.error),
            onPressed:     onEliminar,
            visualDensity: VisualDensity.compact,
            tooltip:       'Eliminar',
          ),
        ],
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
    );
  }
}
