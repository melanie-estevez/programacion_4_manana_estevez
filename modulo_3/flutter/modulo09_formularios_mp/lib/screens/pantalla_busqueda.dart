import 'package:flutter/material.dart';
import '../models/plato.dart';
import '../widgets/fila_plato.dart';
import '../widgets/tarjeta_plato_grid.dart';

class PantallaBusqueda extends StatefulWidget {
  const PantallaBusqueda({super.key});
  @override
  State<PantallaBusqueda> createState() => _PantallaBusquedaState();
}

class _PantallaBusquedaState extends State<PantallaBusqueda> {
  final _platos = [
    Plato(id:'1', nombre:'Ceviche Clásico',  codigo:'PLT-001', tiempoPrep:15, chef:'Chef Ana',   categoria:'Entrada',   disponible:true,  destacado:true, tipo:'Cocina fría'),
    Plato(id:'2', nombre:'Lomo Saltado',   codigo:'PLT-002', tiempoPrep:25, chef:'Chef Luis', categoria:'Principal', disponible:true, tipo:'Parrilla'),
    Plato(id:'3', nombre:'Ají de Gallina',  codigo:'PLT-003', tiempoPrep:20, chef:'Chef Ana',   categoria:'Principal', disponible:false, tipo:'Parrilla'),
    Plato(id:'4', nombre:'Chicha Morada',  codigo:'PLT-004', tiempoPrep:5, chef:'Barra',  categoria:'Bebida', disponible:true, tipo:'Barra'),
  ];

  String _busqueda = '';
  bool   _modoGrid = false;


  List<Plato> get _filtrados => _platos
      .where((s) =>
          s.nombre.toLowerCase().contains(_busqueda.toLowerCase()) ||
          s.codigo.toLowerCase().contains(_busqueda.toLowerCase()) ||
          s.chef.toLowerCase().contains(_busqueda.toLowerCase()))
      .toList();

  void _toggleDestacado(Plato s) =>
      setState(() => s.destacado = !s.destacado);

  void _eliminar(Plato s) =>
      setState(() => _platos.removeWhere((x) => x.id == s.id));

  @override
  Widget build(BuildContext context) {
    final cs       = Theme.of(context).colorScheme;
    final filtrados = _filtrados;

    return Scaffold(
      appBar: AppBar(
        title:           Text('Menú (${_platos.length})'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
        actions: [
          IconButton(
            icon:      Icon(_modoGrid ? Icons.list : Icons.grid_view),
            onPressed: () => setState(() => _modoGrid = !_modoGrid),
            tooltip:   _modoGrid ? 'Vista lista' : 'Vista cuadrícula',
          ),
        ],
      ),
      body: Column(
        children: [

          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
            child: SearchBar(
              hintText: 'Buscar por nombre, código o chef...',
              leading:  const Icon(Icons.search),
              trailing: _busqueda.isNotEmpty
                  ? [
                      IconButton(
                        icon:      const Icon(Icons.clear),
                        onPressed: () => setState(() => _busqueda = ''),
                      ),
                    ]
                  : null,
              onChanged: (v) => setState(() => _busqueda = v),
              padding: const WidgetStatePropertyAll(
                EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
          ),


          if (_busqueda.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 4),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '${filtrados.length} resultado${filtrados.length == 1 ? '' : 's'}',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: cs.onSurfaceVariant,
                  ),
                ),
              ),
            ),


          Expanded(
            child: filtrados.isEmpty
                ? Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.search_off,
                            size: 56, color: cs.onSurfaceVariant),
                        const SizedBox(height: 12),
                        Text(
                          'Sin resultados para "$_busqueda"',
                          style: TextStyle(color: cs.onSurfaceVariant),
                        ),
                        const SizedBox(height: 8),
                        TextButton(
                          onPressed: () => setState(() => _busqueda = ''),
                          child: const Text('Limpiar búsqueda'),
                        ),
                      ],
                    ),
                  )
                : _modoGrid
                    ? GridView.builder(
                        padding: const EdgeInsets.all(12),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount:   2,
                          childAspectRatio: 1.1,
                          crossAxisSpacing: 8,
                          mainAxisSpacing:  8,
                        ),
                        itemCount:   filtrados.length,
                        itemBuilder: (ctx, i) => TarjetaPlatoGrid(
                          plato:       filtrados[i],
                          onDestacado: () => _toggleDestacado(filtrados[i]),
                          onEliminar:  () => _eliminar(filtrados[i]),
                        ),
                      )
                    : ListView.separated(
                        itemCount:        filtrados.length,
                        separatorBuilder: (_, __) =>
                            const Divider(height: 1, indent: 72),
                        itemBuilder: (ctx, i) => FilaPlato(
                          plato:       filtrados[i],
                          onDestacado: () => _toggleDestacado(filtrados[i]),
                          onEliminar:  () => _eliminar(filtrados[i]),
                        ),
                      ),
          ),
        ],
      ),
    );
  }
}
