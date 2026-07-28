import 'package:go_router/go_router.dart';
import 'package:modulo11_gorouter_mp/screens/pantallaajustes.dart';
import 'package:modulo11_gorouter_mp/screens/pantalladashboard.dart';
import '../screens/scaffoldconnav.dart';
import '../screens/pantalla_platos.dart';
import '../screens/pantalla_detalle.dart';
import '../screens/pantallacocina.dart';

import '../models/plato.dart';

final appRouterPaso4 = GoRouter(
  initialLocation: '/platos',
  debugLogDiagnostics: true,
  routes: [

    ShellRoute(
      builder: (context, state, child) => ScaffoldConNav(child: child),
      routes: [
        GoRoute(
          path:    '/platos',
          builder: (_, __) => const PantallaPlatos(),
          routes: [
            GoRoute(
              path:    ':id',
              builder: (context, state) {
                final id    = state.pathParameters['id']!;
                final plato = state.extra as Plato?;
                return PantallaDetalle(id: id, plato: plato);
              },
            ),
          ],
        ),
        GoRoute(
          path:    '/cocina',
          builder: (_, __) => const PantallaCocina(),
        ),
        GoRoute(
          path:    '/ajustes',
          builder: (_, __) => const PantallaAjustes(),
        ),
        GoRoute(
          path:    '/dashboard',
          builder: (_, __) => const PantallaDashboard(),
        ),
      ],
    ),
  ],
);
