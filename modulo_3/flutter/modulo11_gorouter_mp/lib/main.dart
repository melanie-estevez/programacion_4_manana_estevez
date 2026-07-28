import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modulo11_gorouter_mp/providers/auth_provider.dart';
import 'package:modulo11_gorouter_mp/router/approuterpaso2.dart';
import 'package:modulo11_gorouter_mp/router/approuterpaso3.dart';
import 'package:modulo11_gorouter_mp/router/approuterpaso4.dart';
import 'package:modulo11_gorouter_mp/router/approuterpaso5.dart';
import 'router/app_router.dart';

const int paso = 5;

void main() {
  runApp(
    ProviderScope(
      child: AppRestaurante(paso: paso),
    ),
  );
}

class AppRestaurante extends ConsumerWidget {
  final int paso;
  const AppRestaurante({super.key, required this.paso});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    ref.watch(authProvider);

    final router = switch (paso) {
      1 => appRouter,
      2 => appRouterPaso2,
      3 => appRouterPaso3,
      4 => appRouterPaso4,
      5 => appRouterPaso5(ref),
      _ => appRouter,
    };

    return MaterialApp.router(
      title:        'Sabor Local',
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFBF360C)),
        useMaterial3: true,
      ),
    );
  }
}
