import 'package:flutter/material.dart';
import '../models/plato.dart';

class TarjetaPlatoGrid extends StatelessWidget {
  final Plato        plato;
  final VoidCallback onDestacado;
  final VoidCallback onEliminar;

  const TarjetaPlatoGrid({
    super.key,
    required this.plato,
    required this.onDestacado,
    required this.onEliminar,
  });

  @override
  Widget build(BuildContext context) {
    final cs   = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Row(children: [
              Icon(
                Icons.lunch_dining,
                color: plato.disponible ? cs.primary : cs.outline,
                size: 18,
              ),
              const Spacer(),
              GestureDetector(
                onTap: onDestacado,
                child: Icon(
                  plato.destacado ? Icons.star : Icons.star_border,
                  color: plato.destacado ? Colors.amber : cs.outline,
                  size: 18,
                ),
              ),
            ]),
            const SizedBox(height: 6),


            Text(
              plato.nombre,
              style: text.titleSmall?.copyWith(fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              plato.codigo,
              style: text.bodySmall?.copyWith(color: cs.onSurfaceVariant),
            ),

            const Spacer(),


            Row(children: [
              if (plato.disponible)
                Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: Icon(Icons.check_circle, size: 12, color: cs.primary),
                ),
              Expanded(
                child: Text(
                  plato.categoria,
                  style: text.labelSmall?.copyWith(color: cs.onSurfaceVariant),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              GestureDetector(
                onTap: onEliminar,
                child: Icon(Icons.delete_outline, size: 16, color: cs.error),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
