import 'package:flutter/material.dart';

class FormularioPlato extends StatefulWidget {
  final void Function(Map<String, String> datos) onGuardar;

  const FormularioPlato({super.key, required this.onGuardar});

  @override
  State<FormularioPlato> createState() => _FormularioPlatoState();
}

class _FormularioPlatoState extends State<FormularioPlato> {
  final _formKey = GlobalKey<FormState>();

  final _ctrlNombre = TextEditingController();
  final _ctrlCodigo = TextEditingController();
  final _ctrlPrecio = TextEditingController();
  final _ctrlTiempo = TextEditingController(text: '15');
  final _ctrlChef = TextEditingController(text: 'Chef Ana');

  final _focusCodigo = FocusNode();
  final _focusPrecio = FocusNode();
  final _focusTiempo = FocusNode();
  final _focusChef = FocusNode();

  String _tipo = 'Parrilla';
  String _categoria = 'Principal';
  bool _disponible = true;

  @override
  void dispose() {
    _ctrlNombre.dispose();
    _ctrlCodigo.dispose();
    _ctrlPrecio.dispose();
    _ctrlTiempo.dispose();
    _ctrlChef.dispose();
    _focusCodigo.dispose();
    _focusPrecio.dispose();
    _focusTiempo.dispose();
    _focusChef.dispose();
    super.dispose();
  }

  void _guardar() {
    if (!_formKey.currentState!.validate()) return;

    widget.onGuardar({
      'nombre': _ctrlNombre.text,
      'codigo': _ctrlCodigo.text,
      'precio': _ctrlPrecio.text,
      'tiempoPrep': _ctrlTiempo.text,
      'chef': _ctrlChef.text,
      'categoria': _categoria,
      'tipo': _tipo,
      'disponible': _disponible.toString(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          TextFormField(
            controller: _ctrlNombre,
            decoration: const InputDecoration(
              labelText: 'Nombre del plato',
              prefixIcon: Icon(Icons.lunch_dining),
              border: OutlineInputBorder(),
            ),
            validator: (v) {
              if (v == null || v.trim().isEmpty) {
                return 'El nombre es obligatorio';
              }
              if (v.length < 3) return 'Mínimo 3 caracteres';
              return null;
            },
          ),

          const SizedBox(height: 12),


          TextFormField(
            controller: _ctrlCodigo,
            focusNode: _focusCodigo,
            decoration: const InputDecoration(
              labelText: 'Código',
              hintText: 'PLT-001',
              prefixIcon: Icon(Icons.qr_code),
              border: OutlineInputBorder(),
            ),
            validator: (v) {
              if (v == null || v.isEmpty) return 'El código es obligatorio';
              if (v.length < 3) return 'Mínimo 3 caracteres';
              return null;
            },
          ),

          const SizedBox(height: 12),

          TextFormField(
            controller: _ctrlPrecio,
            focusNode: _focusPrecio,
            decoration: const InputDecoration(
              labelText: 'Precio (S/)',
              prefixIcon: Icon(Icons.attach_money),
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
            validator: (v) {
              if (v == null || v.isEmpty) return 'Precio obligatorio';
              final precio = double.tryParse(v);
              if (precio == null || precio <= 0) return 'Precio inválido';
              return null;
            },
          ),

          const SizedBox(height: 12),


          TextFormField(
            controller: _ctrlTiempo,
            focusNode: _focusTiempo,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Tiempo de prep (min)',
              prefixIcon: Icon(Icons.timer),
              border: OutlineInputBorder(),
            ),
            validator: (v) {
              final mins = int.tryParse(v ?? '');
              if (mins == null) return 'Debe ser número';
              if (mins < 1 || mins > 120) {
                return '1–120 min';
              }
              return null;
            },
          ),

          const SizedBox(height: 12),


          TextFormField(
            controller: _ctrlChef,
            focusNode: _focusChef,
            decoration: const InputDecoration(
              labelText: 'Chef',
              prefixIcon: Icon(Icons.person),
              border: OutlineInputBorder(),
            ),
            validator: (v) =>
                v == null || v.isEmpty ? 'Obligatorio' : null,
          ),

          const SizedBox(height: 12),


          DropdownButtonFormField<String>(
            value: _categoria,
            decoration: const InputDecoration(
              labelText: 'Categoría',
              border: OutlineInputBorder(),
            ),
            items: const [
              'Entrada',
              'Principal',
              'Bebida',
              'Postre',
            ].map((s) {
              return DropdownMenuItem(
                value: s,
                child: Text(s),
              );
            }).toList(),
            onChanged: (v) {
              if (v == null) return;
              setState(() => _categoria = v);
            },
          ),

          const SizedBox(height: 12),


          DropdownButtonFormField<String>(
            value: _tipo,
            decoration: const InputDecoration(
              labelText: 'Estación',
              border: OutlineInputBorder(),
            ),
            items: const [
              'Parrilla',
              'Cocina fría',
              'Barra',
              'Postres',
              'Fritos',
            ].map((s) {
              return DropdownMenuItem(
                value: s,
                child: Text(s),
              );
            }).toList(),
            onChanged: (v) {
              if (v == null) return;
              setState(() => _tipo = v);
            },
          ),

          const SizedBox(height: 12),


          SwitchListTile(
            title: const Text('Disponible'),
            value: _disponible,
            onChanged: (v) => setState(() => _disponible = v),
          ),

          const SizedBox(height: 16),

          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => _formKey.currentState?.reset(),
                  child: const Text('Limpiar'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                flex: 2,
                child: FilledButton(
                  onPressed: _guardar,
                  child: const Text('Guardar'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
