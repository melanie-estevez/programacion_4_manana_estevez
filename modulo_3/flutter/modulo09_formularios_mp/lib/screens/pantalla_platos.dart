import 'package:flutter/material.dart';
import '../models/plato.dart';
import '../widgets/fila_plato.dart';
import '../widgets/tarjeta_plato_grid.dart';

class PantallaPlatos extends StatefulWidget {
  const PantallaPlatos({super.key});
  @override
  State<PantallaPlatos> createState() => _PantallaPlatosState();
}

class _PantallaPlatosState extends State<PantallaPlatos> {
  final _platos = [
    Plato(id:'1', nombre:'Ceviche Clásico',  codigo:'PLT-001', tiempoPrep:15, chef:'Chef Ana',   categoria:'Entrada',   disponible:true,  destacado:true, tipo:'Cocina fría'),
    Plato(id:'2', nombre:'Lomo Saltado',   codigo:'PLT-002', tiempoPrep:25, chef:'Chef Luis', categoria:'Principal', disponible:true, tipo:'Parrilla'),
    Plato(id:'3', nombre:'Ají de Gallina',  codigo:'PLT-003', tiempoPrep:20, chef:'Chef Ana',   categoria:'Principal', disponible:false, tipo:'Parrilla'),
    Plato(id:'4', nombre:'Suspiro a la Limeña',  codigo:'PLT-004', tiempoPrep:10, chef:'Chef Rosa',  categoria:'Postre', disponible:false, tipo:'Postres'),
  ];

  bool _modoGrid = false;

  void _toggleDestacado(int i) =>
      setState(() => _platos[i].destacado = !_platos[i].destacado);

  void _eliminar(int i) => setState(() => _platos.removeAt(i));

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title:           Text('Platos (${_platos.length})'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
        actions: [

          IconButton(
            icon:    Icon(_modoGrid ? Icons.list : Icons.grid_view),
            onPressed: () => setState(() => _modoGrid = !_modoGrid),
            tooltip: _modoGrid ? 'Vista lista' : 'Vista cuadrícula',
          ),
        ],
      ),
      body: _modoGrid
          ? GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:   2,
                childAspectRatio: 1.1,
                crossAxisSpacing: 8,
                mainAxisSpacing:  8,
              ),
              itemCount:   _platos.length,
              itemBuilder: (ctx, i) => TarjetaPlatoGrid(
                plato:       _platos[i],
                onDestacado: () => _toggleDestacado(i),
                onEliminar:  () => _eliminar(i),
              ),
            )
          : ListView.separated(
              itemCount:        _platos.length,
              separatorBuilder: (_, __) =>
                  const Divider(height: 1, indent: 72),
              itemBuilder: (ctx, i) => FilaPlato(
                plato:       _platos[i],
                onDestacado: () => _toggleDestacado(i),
                onEliminar:  () => _eliminar(i),
              ),
            ),
    );
  }
}
