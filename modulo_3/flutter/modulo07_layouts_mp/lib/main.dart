import 'package:flutter/material.dart';
import 'package:modulo07_layouts_mp/customized_size_box.dart';
import 'package:modulo07_layouts_mp/widgets/avatar_badge.dart';
import 'package:modulo07_layouts_mp/widgets/fila_estado.dart';
import 'package:modulo07_layouts_mp/widgets/tarjeta_log.dart';

const int paso =2;

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
    useMaterial3: true,
  ),
  home: switch (paso) {
    1 => _paso1(),
    2 => Scaffold(
      body: ListView(
        children: [
          TarjetaLog(nivel: 'Urgente', componente: 'Parrilla',
              mensaje:   'Pedido mesa 7 — sin stock de lomo',
              timestamp: DateTime.now()),
          TarjetaLog(nivel: 'Retrasado',  componente: 'Cocina fría',
              mensaje:   'Ceviche Clásico lleva 18 min — meta: 12',
              timestamp: DateTime.now().subtract(const Duration(minutes: 2))),
          TarjetaLog(nivel: 'Listo',  componente: 'Barra',
              mensaje:   'Pisco Sour listo para servir',
              timestamp: DateTime.now().subtract(const Duration(minutes: 5))),
          TarjetaLog(nivel: 'Nota', componente: 'Postres',
              mensaje:   'Suspiro a la limeña · sin gluten solicitado',
              timestamp: DateTime.now().subtract(const Duration(minutes: 8))),
        ],
      ),
    ),
    3 => const Scaffold(
      body: Column(
        children: [
          FilaEstado(nombre: 'Parrilla',   detalle: '4 pedidos · 12 min',          activo: true),
          Divider(height: 1),
          FilaEstado(nombre: 'Cocina fría',    detalle: '2 pedidos · 8 min',           activo: true),
          Divider(height: 1),
          FilaEstado(nombre: 'Barra', detalle: 'sin pedidos · en espera', activo: false),
          Divider(height: 1),
          FilaEstado(nombre: 'Postres',
                     detalle: '1 pedido · 6 min', activo: true),
        ],
      ),
    ),
    4 => const Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AvatarBadge(nombre: 'Ana', alertas: 2,  activo: true),
            SizedBox(width: 24),
            AvatarBadge(nombre: 'Luis',  alertas: 0,  activo: true),
            SizedBox(width: 24),
            AvatarBadge(nombre: 'Mesa', alertas: 0,  activo: false),
            SizedBox(width: 24),
            AvatarBadge(nombre: 'Barra',  alertas: 11, activo: true),
            SizedBox(width: 24),
            AvatarBadge(nombre: 'Chef',  alertas: 11, activo: true),
          ],
        ),
      ),
    ),
    5 => Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [

          CustomizedSizeBox()
        ],
      ),
    ),
    _ => Scaffold(body: Center(child: Text('Paso $paso: crea el widget primero'))),
  },
));

Widget _paso1() => Scaffold(
  body: Center(
    child: Container(
      width: double.infinity,
      height:  80,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      margin: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color:        Colors.deepOrange.shade50,
        borderRadius: BorderRadius.circular(40),
        border:       Border(left: BorderSide(color: Colors.deepOrange, width: 4)),
        boxShadow: [
          BoxShadow(
            color:      Colors.black.withOpacity(0.03),
            blurRadius: 8,
            offset:     const Offset(0, 2),
          ),
        ],
      ),
      child: const Text('Plato: Lomo Saltado',
          style: TextStyle(fontWeight: FontWeight.bold)),
    ),
  ),
);
