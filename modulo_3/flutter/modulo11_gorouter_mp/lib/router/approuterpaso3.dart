import 'package:go_router/go_router.dart';
import '../screens/pantalla_inicio.dart';
import '../screens/pantallaplatosfiltro.dart';
import '../screens/pantalla_detalle.dart';
import '../models/plato.dart';

final appRouterPaso3 = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path:    '/',
      builder: (context, state) => const PantallaInicio(),
    ),
    GoRoute(
      path:    '/platos',
      builder: (context, state) {

        final soloDisponibles = state.uri.queryParameters['soloDisponibles'] == 'true';
        return PantallaPlatosFiltro(soloDisponibles: soloDisponibles);
      },
    ),
    GoRoute(
      path:    '/platos/:id',
      builder: (context, state) {
        final id    = state.pathParameters['id']!;
        final plato = state.extra as Plato?;
        return PantallaDetalle(id: id, plato: plato);
      },
    ),
  ],
);
