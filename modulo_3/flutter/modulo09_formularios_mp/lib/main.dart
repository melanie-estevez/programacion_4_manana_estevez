import 'package:flutter/material.dart';
import 'widgets/formulario_plato.dart';
import 'models/plato.dart';
import 'widgets/fila_plato.dart';
import 'screens/pantalla_platos.dart';
import 'widgets/tarjeta_plato_grid.dart';
import 'screens/pantalla_busqueda.dart';

const int paso = 2;

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFBF360C),
    ),
    useMaterial3: true,
  ),
  home: switch (paso) {
    1 => const _Paso1(),
    2 => const _Paso2(),
    3 => const _Paso3(),
    4 => const PantallaPlatos(),
    5 => const PantallaBusqueda(),
    _ => Scaffold(
        body: Center(child: Text('Paso $paso: crea el widget primero'))),
  },
));

class _Paso1 extends StatefulWidget {
  const _Paso1();
  @override
  State<_Paso1> createState() => _Paso1State();
}

class _Paso1State extends State<_Paso1> {
  final _ctrlNombre = TextEditingController();
  final _ctrlCodigo = TextEditingController();
  final _ctrlTiempo = TextEditingController(text: '15');
  final _focusCodigo = FocusNode();
  final _focusTiempo = FocusNode();

  @override
  void dispose() {
    _ctrlNombre.dispose();
    _ctrlCodigo.dispose();
    _ctrlTiempo.dispose();
    _focusCodigo.dispose();
    _focusTiempo.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title:           const Text('Nuevo pedido'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller:      _ctrlNombre,
              decoration:      const InputDecoration(
                labelText:  'Nombre del plato',
                hintText:   'Lomo Saltado',
                prefixIcon: Icon(Icons.lunch_dining),
                border:     OutlineInputBorder(),
              ),
              textInputAction: TextInputAction.next,
              onSubmitted:     (_) => _focusCodigo.requestFocus(),
            ),
            const SizedBox(height: 12),
            TextField(
              controller:      _ctrlCodigo,
              focusNode:       _focusCodigo,
              decoration:      const InputDecoration(
                labelText:  'Código',
                hintText:   'PLT-001',
                prefixIcon: Icon(Icons.qr_code),
                border:     OutlineInputBorder(),
              ),
              textInputAction: TextInputAction.next,
              onSubmitted:     (_) => _focusTiempo.requestFocus(),
            ),
            const SizedBox(height: 12),
            TextField(
              controller:  _ctrlTiempo,
              focusNode:   _focusTiempo,
              decoration:  const InputDecoration(
                labelText:  'Tiempo de prep (min)',
                prefixIcon: Icon(Icons.timer),
                border:     OutlineInputBorder(),
              ),
              keyboardType:    TextInputType.number,
              textInputAction: TextInputAction.done,
              onSubmitted:     (_) => FocusScope.of(context).unfocus(),
            ),
            const SizedBox(height: 20),
            FilledButton.icon(
              onPressed: () {
                FocusScope.of(context).unfocus();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Enviando a cocina: ${_ctrlNombre.text} '
                      '(${_ctrlCodigo.text} · ${_ctrlTiempo.text} min)',
                    ),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
              icon:  const Icon(Icons.receipt_long),
              label: const Text('Tomar pedido'),
            ),
            const SizedBox(height: 8),
            OutlinedButton(
              onPressed: () {
                _ctrlNombre.clear();
                _ctrlCodigo.clear();
                _ctrlTiempo.text = '15';
              },
              child: const Text('Limpiar campos'),
            ),
          ],
        ),
      ),
    );
  }
}

class _Paso2 extends StatelessWidget {
  const _Paso2();

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title:           const Text('Nuevo plato'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: FormularioPlato(
          onGuardar: (datos) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                    'Guardado: ${datos['nombre']} — ${datos['codigo']} · ${datos['tiempoPrep']} min'),
                behavior: SnackBarBehavior.floating,
              ),
            );
          },
        ),
      ),
    );
  }
}

class _Paso3 extends StatefulWidget {
  const _Paso3();
  @override
  State<_Paso3> createState() => _Paso3State();
}

class _Paso3State extends State<_Paso3> {
  final _platos = [
    Plato(id:'1', nombre:'Ceviche Clásico',  codigo:'PLT-001', tiempoPrep:15, chef:'Chef Ana',   categoria:'Entrada',   disponible:true,  destacado:true, tipo:'Cocina fría'),
    Plato(id:'2', nombre:'Lomo Saltado',   codigo:'PLT-002', tiempoPrep:25, chef:'Chef Luis', categoria:'Principal', disponible:true, tipo:'Parrilla'),
    Plato(id:'3', nombre:'Ají de Gallina',  codigo:'PLT-003', tiempoPrep:20, chef:'Chef Ana',   categoria:'Principal', disponible:false, tipo:'Parrilla'),
    Plato(id:'4', nombre:'Arroz con Mariscos',  codigo:'PLT-004', tiempoPrep:30, chef:'Chef Rosa',  categoria:'Principal', disponible:true, tipo:'Cocina fría'),
    Plato(id:'5', nombre:'Pisco Sour',  codigo:'PLT-005', tiempoPrep:5, chef:'Barra',  categoria:'Bebida', disponible:true, tipo:'Barra'),
  ];

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title:           Text('Platos (${_platos.length})'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: _platos.isEmpty
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.restaurant_menu_outlined, size: 56, color: cs.onSurfaceVariant),
                  const SizedBox(height: 12),
                  Text('Sin platos',
                      style: TextStyle(color: cs.onSurfaceVariant)),
                ],
              ),
            )
          : ListView.separated(
              itemCount:        _platos.length,
              separatorBuilder: (_, __) =>
                  const Divider(height: 1, indent: 72),
              itemBuilder: (ctx, i) => FilaPlato(
                plato:       _platos[i],
                onDestacado: () => setState(() =>
                    _platos[i].destacado = !_platos[i].destacado),
                onEliminar: () => setState(() => _platos.removeAt(i)),
              ),
            ),
    );
  }
}
