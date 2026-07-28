import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:modulo12_api_mp/cliente_dto.dart';

class PantallaPaso2User extends StatelessWidget {
  const PantallaPaso2User({super.key});

  Future<List<ClienteDto>> _fetchClientes() async {
    final res = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users?_limit=15'),
    );
    final lista = jsonDecode(res.body) as List<dynamic>;
    return lista
        .map((e) => ClienteDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paso 2 · Clientes (DTO)'),
        leading: BackButton(onPressed: () => context.go('/')),
      ),
      body: FutureBuilder<List<ClienteDto>>(
        future: _fetchClientes(),
        builder: (context, snap) {
          if (snap.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snap.hasError) {
            return Center(child: Text('Error: ${snap.error}'));
          }

          final clientes = snap.data!;
          return Column(
            children: [

              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Chip(
                      label: Text(
                          '${clientes.where((t) => t.tieneWeb).length} con web'),
                      backgroundColor: Colors.green[100],
                    ),
                    const SizedBox(width: 8),
                    Chip(
                      label: Text(
                          '${clientes.where((t) => !t.tieneWeb).length} sin web'),
                      backgroundColor: Colors.orange[100],
                    ),
                  ],
                ),
              ),


              Expanded(
                child: ListView.builder(
                  itemCount: clientes.length,
                  itemBuilder: (context, i) {
                    final t = clientes[i];
                    return CheckboxListTile(
                      title: Text(t.name),
                      subtitle: Text('email: ${t.email}'),
                      value: t.tieneWeb,
                      onChanged: null,
                      activeColor: Colors.deepOrange,
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
