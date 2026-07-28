import 'package:flutter/material.dart';

class CatalogoBasicos extends StatelessWidget {
  const CatalogoBasicos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Widgets básicos — Sabor Local')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [


          const Text(
            'Lomo Saltado: Disponible',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.green,
              letterSpacing: 0.5,
              fontStyle: FontStyle.normal,
              decoration: TextDecoration.lineThrough,
              shadows: [Shadow(color: Colors.black26, blurRadius: 4, offset: Offset(2,2))]

            ),
          ),
          const SizedBox(height: 8),


          SizedBox(
            width: double.infinity,
            child: Text(
              'Arroz con Mariscos especial del día → agotado temporalmente',
              textAlign:
                  TextAlign.justify,
              maxLines: 2,
              overflow: TextOverflow.fade,
              softWrap: false
            ),
          ),
          const SizedBox(height: 8),


          const Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Estado: ',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                TextSpan(
                  text: 'URGENTE',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: ' — pedido hace 5 min',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),


          const SelectableText(
            'Mesa 12 · Ticket #5432',
            style: TextStyle(fontFamily: 'monospace', fontSize: 14),
          ),
          const Divider(height: 32),

          Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.check_circle, size: 80, color: Theme.of(context).colorScheme.primary),
              const Icon(Icons.cancel, size: 80, color: Colors.red),
              const Icon(Icons.warning_amber, size: 80, color: Colors.orange),
              const Icon(Icons.restaurant, size: 14, color: Colors.deepOrange),
              const Icon(Icons.soup_kitchen, size: 14, color: Colors.grey),



            ],
          ),
          const SizedBox(height: 8),
          const Icon(
            Icons.settings,
            size: 24,
            color: Colors.blueGrey,
            semanticLabel: 'Configuración',
          ),
          const Divider(height: 32),


        Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text('ElevatedButton'),
              ),
              FilledButton(onPressed: () {}, child: const Text('FilledButton')),
              OutlinedButton(onPressed: () {}, child: const Text('FilledButton'),
              ),
              TextButton(onPressed: () {}, child: const Text('FilledButton')),
              ElevatedButton(onPressed: () {}, child: const Text('Desactivado')),

            ],
          ),
          const SizedBox(height: 12),


          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.refresh, size: 18),
                label: const Text('Actualizar'),
              ),
              FilledButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.stop, size: 18),
                label: const Text('Pausar cocina'),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.settings),
                color: Colors.deepOrange,
                iconSize: 28,
                tooltip: 'Ajustes del restaurante'
              ),
            ],
          ),
          const SizedBox(height: 12),


          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red.shade600,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
              shape: const StadiumBorder(),
              elevation: 0,

            ),
            child: const Text(
              'Pedido urgente',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const Divider(height: 32),

          Card(
            elevation: 0,
            margin: const EdgeInsets.only(bottom: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),

            ),
            color: Colors.deepOrange.shade50,
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              leading: const Icon(Icons.lunch_dining, color: Colors.deepOrange),
              title: const Text('Ceviche Clásico'),
              subtitle: const Text('Fresco del día · estación Cocina fría · 15 min de prep.'),
              trailing: const Icon(Icons.circle, color: Colors.green, size: 12),
              isThreeLine: true,
              onTap: () {},
            ),
          ),
          Card(
            elevation: 12,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.red.shade100,
                child: const Icon(Icons.cancel, color: Colors.red, size: 20),
              ),
              title: const Text('Ají de Gallina'),
              subtitle: const Text('agotado · estación Parrilla'),
              trailing: TextButton(onPressed: () {}, child: const Text('Ver')),
            ),
          ),
          const Divider(height: 32),
          Card(
            child: SwitchListTile(
              value: false,
              onChanged: (_) {},
              title: const Text('Modo solo delivery'),
            ),
          ),
          const Divider(height: 32),

          Wrap(
          spacing: 8, runSpacing: 8,
          children: [
            const Chip(label: Text('Parrilla')),
            const Chip(
              avatar:          Icon(Icons.check, size: 16, color: Colors.white),
              label:           Text('Vegetariano'),
              backgroundColor: Colors.green,
              labelStyle:      TextStyle(color: Colors.white, fontSize: 12),


            ),
            FilterChip(
              label:      const Text('Picante'),
              selected:   false,
              onSelected: (_) {},
              deleteIcon: const Icon(Icons.close, size: 16),
              padding: const EdgeInsets.all(8)


            ),
            ActionChip(
              label:     const Text('Ver tickets'),
              avatar:    const Icon(Icons.receipt_long, size: 16),
              onPressed: () {},

            ),

             const Chip(label: Text('Barra')),
            const Chip(
              avatar:          Icon(Icons.check, size: 16, color: Colors.white),
              label:           Text('Destacado'),
              backgroundColor: Colors.deepOrange,
              labelStyle:      TextStyle(color: Colors.white, fontSize: 12),


            ),
            FilterChip(
              label:      const Text('Postres'),
              selected:   false,
              onSelected: (_) {},
              deleteIcon: const Icon(Icons.close, size: 16),
              padding: const EdgeInsets.all(8)


            ),

          ],
        ),
        const Divider(height: 32),


          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 48,
                height: 48,
                child: CircularProgressIndicator(
                  backgroundColor: Colors.grey.shade200,
                ),
              ),

              SizedBox(
                width: 48,
                height: 48,
                child: Transform.scale(
                  scale: 0.5,
                  child: CircularProgressIndicator(
                    value: 0.7,
                    color: Colors.green,
                    strokeWidth: 6,
                    backgroundColor: Colors.grey.shade200,
                  ),
                ),
              ),

              SizedBox(
                width: 48,
                height: 48,
                child: CircularProgressIndicator(
                  value: 0.3,
                  color: Colors.red,
                  strokeWidth: 3,
                  strokeCap: StrokeCap.round,
                  backgroundColor: Colors.grey.shade200,
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),


          LinearProgressIndicator(
            backgroundColor: Colors.grey,
          ),

          const SizedBox(height: 8),

          LinearProgressIndicator(
            value: 0.6,
            color: Colors.deepOrange,
            minHeight: 12,
          ),

          const SizedBox(height: 8),

          LinearProgressIndicator(
            value: 1.0,
            color: Colors.green,
            minHeight: 12,
          ),

          const Divider(height: 32),
        ],
      ),
    );
  }
}
