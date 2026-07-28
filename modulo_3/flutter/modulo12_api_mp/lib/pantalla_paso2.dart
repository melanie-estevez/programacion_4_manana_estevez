import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

import 'pedido_dto.dart';

class PantallaPaso2 extends StatelessWidget {
  const PantallaPaso2({super.key});

  Future<List<PedidoDto>> _fetchPedidos() async {
    final res = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/todos?_limit=15'),
    );
    final lista = jsonDecode(res.body) as List<dynamic>;
    return lista
        .map((e) => PedidoDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paso 2 · Pedidos (DTO)'),
        leading: BackButton(onPressed: () => context.go('/')),
      ),
      body: FutureBuilder<List<PedidoDto>>(
        future: _fetchPedidos(),
        builder: (context, snap) {
          if (snap.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snap.hasError) {
            return Center(child: Text('Error: ${snap.error}'));
          }

          final pedidos = snap.data!;
          return Column(
            children: [

              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Chip(
                      label: Text(
                          '${pedidos.where((t) => t.completed).length} listos'),
                      backgroundColor: Colors.green[100],
                    ),
                    const SizedBox(width: 8),
                    Chip(
                      label: Text(
                          '${pedidos.where((t) => !t.completed).length} pendientes'),
                      backgroundColor: Colors.orange[100],
                    ),
                  ],
                ),
              ),


              Expanded(
                child: ListView.builder(
                  itemCount: pedidos.length,
                  itemBuilder: (context, i) {
                    final t = pedidos[i];
                    return CheckboxListTile(
                      title: Text(t.title),
                      subtitle: Text('Pedido #${t.id}'),
                      value: t.completed,
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
