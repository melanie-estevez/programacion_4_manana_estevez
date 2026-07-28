import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:modulo11_gorouter_mp/screens/pantallaajustes.dart';
import 'package:modulo11_gorouter_mp/screens/pantalladashboard.dart';
import 'package:modulo11_gorouter_mp/screens/pantallacocina.dart';
import 'package:modulo11_gorouter_mp/screens/scaffoldconnav.dart';
import '../providers/auth_provider.dart';
import '../screens/pantalla_platos.dart';
import '../screens/pantalla_detalle.dart';
import '../screens/pantalla_login.dart';
import '../models/plato.dart';

GoRouter appRouterPaso5(WidgetRef ref) => GoRouter(
  initialLocation: '/platos',
  debugLogDiagnostics: true,
  redirect: (context, state) {
    final authState     = ref.read(authProvider);
    final autenticado   = authState is Autenticado;
    final enLogin       = state.matchedLocation == '/login';


    if (!autenticado && !enLogin) return '/login';

    if (autenticado && enLogin)   return '/platos';

    return null;
  },
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
              builder: (context, state) => PantallaDetalle(
                id:    state.pathParameters['id']!,
                plato: state.extra as Plato?,
              ),
            ),
          ],
        ),
        GoRoute(path: '/cocina', builder: (_, __) => const PantallaCocina()),
        GoRoute(path: '/ajustes',  builder: (_, __) => const PantallaAjustes()),
        GoRoute(path: '/dashboard',  builder: (_, __) => const PantallaDashboard()),
      ],
    ),
    GoRoute(
      path:    '/login',
      builder: (_, __) => const PantallaLogin(),
    ),
  ],
);
