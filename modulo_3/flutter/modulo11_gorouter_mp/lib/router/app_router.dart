import 'package:go_router/go_router.dart';
import '../screens/pantalla_inicio.dart';
import '../screens/pantalla_platos.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path:    '/',
      name:    'inicio',
      builder: (context, state) => const PantallaInicio(),
    ),
    GoRoute(
      path:    '/platos',
      name:    'platos',
      builder: (context, state) => const PantallaPlatos(),
    ),
  ],
);
