// lib/widgets/formulario_servidor.dart
import 'package:flutter/material.dart';

class FormularioServidor extends StatefulWidget {
  final void Function(Map<String, String> datos) onGuardar;

  const FormularioServidor({super.key, required this.onGuardar});

  @override
  State<FormularioServidor> createState() => _FormularioServidorState();
}

class _FormularioServidorState extends State<FormularioServidor> {
  final _formKey = GlobalKey<FormState>();

  final _ctrlNombre = TextEditingController();
  final _ctrlIp = TextEditingController();
  final _ctrlMac = TextEditingController();
  final _ctrlPuerto = TextEditingController(text: '22');
  final _ctrlUsuario = TextEditingController(text: 'root');

  final _focusIp = FocusNode();
  final _focusMac = FocusNode();
  final _focusPuerto = FocusNode();
  final _focusUsuario = FocusNode();

  String _service = 'web';
  String _so = 'Ubuntu 24.04';
  bool _ssl = true;

  static final _regexIp = RegExp(r'^(\d{1,3}\.){3}\d{1,3}$');
  static final _regexMac = RegExp(r'^(\d{1,3}\.){3}\d{1,3}$');
  @override
  void dispose() {
    _ctrlNombre.dispose();
    _ctrlIp.dispose();
    _ctrlMac.dispose();
    _ctrlPuerto.dispose();
    _ctrlUsuario.dispose();
    _focusIp.dispose();
    _focusMac.dispose();
    _focusPuerto.dispose();
    _focusUsuario.dispose();
    super.dispose();
  }

  void _guardar() {
    if (!_formKey.currentState!.validate()) return;

    widget.onGuardar({
      'nombre': _ctrlNombre.text,
      'ip': _ctrlIp.text,
      'mac': _ctrlMac.text,
      'puerto': _ctrlPuerto.text,
      'usuario': _ctrlUsuario.text,
      'so': _so,
      'service': _service,
      'ssl': _ssl.toString(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Nombre servidor
          TextFormField(
            controller: _ctrlNombre,
            decoration: const InputDecoration(
              labelText: 'Nombre del servidor',
              prefixIcon: Icon(Icons.dns),
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

          // IP
          TextFormField(
            controller: _ctrlIp,
            focusNode: _focusIp,
            decoration: const InputDecoration(
              labelText: 'Dirección IP',
              prefixIcon: Icon(Icons.router),
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
            validator: (v) {
              if (v == null || v.isEmpty) return 'La IP es obligatoria';
              if (!_regexIp.hasMatch(v)) return 'IPv4 inválida';

              final octetos = v.split('.').map(int.parse);
              if (octetos.any((o) => o > 255)) {
                return 'Octeto fuera de rango (0–255)';
              }
              return null;
            },
          ),

          const SizedBox(height: 12),

          TextFormField(
            controller: _ctrlMac,
            focusNode: _focusMac,
            decoration: const InputDecoration(
              labelText: 'Dirección MAC',
              prefixIcon: Icon(Icons.router),
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
            validator: (v) {
              if (v == null || v.isEmpty) return 'Direccion mac obligatoria';
              if (!_regexMac.hasMatch(v)) return 'direccion inválida';

              final octetos = v.split('.').map(int.parse);
              if (octetos.any((o) => o > 255)) {
                return 'Octeto fuera de rango (0–255)';
              }
              return null;
            },
          ),

          const SizedBox(height: 12),

          // Puerto
          TextFormField(
            controller: _ctrlPuerto,
            focusNode: _focusPuerto,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Puerto',
              prefixIcon: Icon(Icons.lock_outline),
              border: OutlineInputBorder(),
            ),
            validator: (v) {
              final puerto = int.tryParse(v ?? '');
              if (puerto == null) return 'Debe ser número';
              if (puerto < 1 || puerto > 65535) {
                return '1–65535';
              }
              return null;
            },
          ),

          const SizedBox(height: 12),

          // Usuario
          TextFormField(
            controller: _ctrlUsuario,
            focusNode: _focusUsuario,
            decoration: const InputDecoration(
              labelText: 'Usuario',
              prefixIcon: Icon(Icons.person),
              border: OutlineInputBorder(),
            ),
            validator: (v) =>
                v == null || v.isEmpty ? 'Obligatorio' : null,
          ),

          const SizedBox(height: 12),

          // SO
          DropdownButtonFormField<String>(
            value: _so,
            decoration: const InputDecoration(
              labelText: 'Sistema Operativo',
              border: OutlineInputBorder(),
            ),
            items: const [
              'Ubuntu 24.04',
              'Debian 12',
              'CentOS Stream 9',
              'Rocky Linux 9',
              'Alpine Linux',
            ].map((s) {
              return DropdownMenuItem(
                value: s,
                child: Text(s),
              );
            }).toList(),
            onChanged: (v) {
              if (v == null) return;
              setState(() => _so = v);
            },
          ),

          const SizedBox(height: 12),

          // Service
          DropdownButtonFormField<String>(
            value: _service,
            decoration: const InputDecoration(
              labelText: 'Servicio',
              border: OutlineInputBorder(),
            ),
            items: const [
              'web',
              'movil',
              'api',
              'base de datos',
              'ssh',
            ].map((s) {
              return DropdownMenuItem(
                value: s,
                child: Text(s),
              );
            }).toList(),
            onChanged: (v) {
              if (v == null) return;
              setState(() => _service = v);
            },
          ),

          const SizedBox(height: 12),

          // SSL
          SwitchListTile(
            title: const Text('SSL/TLS'),
            value: _ssl,
            onChanged: (v) => setState(() => _ssl = v),
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