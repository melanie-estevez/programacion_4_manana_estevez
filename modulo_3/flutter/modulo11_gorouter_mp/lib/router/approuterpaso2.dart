import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../screens/pantalla_inicio.dart';
import '../screens/pantalla_platos.dart';
import '../screens/pantalla_detalle.dart';
import '../models/plato.dart';

final appRouterPaso2 = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path:    '/',
      builder: (context, state) => const PantallaInicio(),
    ),
    GoRoute(
      path:    '/platos',
      builder: (context, state) => const PantallaPlatos(),
      routes: [

        GoRoute(
          path:    ':id',
          builder: (context, state) {
            final id    = state.pathParameters['id']!;
            final plato = state.extra as Plato?;
            return PantallaDetalle(id: id, plato: plato);
          },
        ),

        GoRoute(
          path:    ':id/notas',
          builder: (context, state) {
            final id = state.pathParameters['id']!;
            return Scaffold(
              appBar: AppBar(title: Text('Notas de cocina · $id')),
              body:   Center(child: Text('Tickets / notas del plato $id')),
            );
          },
        ),
      ],
    ),
  ],
);
