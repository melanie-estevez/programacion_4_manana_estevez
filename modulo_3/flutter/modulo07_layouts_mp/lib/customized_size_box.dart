import 'package:flutter/material.dart';

class CustomizedSizeBox extends StatelessWidget {

  const CustomizedSizeBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.hardEdge,
      children: [

         const Text('SizedBox', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text('Primer elemento'),
          const SizedBox(height: 32),
          const Text('Segundo elemento (después de 32px)'),

          const Divider(height: 32),


          const Text('Padding', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Container(
            color: Colors.deepOrange.shade50,
            child: const Padding(
              padding: EdgeInsets.only(left: 24),
              child:   Text('Texto con Padding izquierdo'),
            ),
          ),

          const Divider(height: 32),


          const Text('Align', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Align(
            alignment: Alignment.centerRight,
            child: Icon(Icons.settings, color: Colors.deepOrange),
          ),

          const Divider(height: 32),


          const Text('Wrap', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Wrap(
            spacing:    8,
            runSpacing: 8,
            children: ['Entradas', 'Principales', 'Bebidas', 'Postres', 'Vegano', 'Picante', 'Sin gluten']
                .map((t) => Chip(label: Text(t)))
                .toList(),
          ),
      ],
    );
  }
}
