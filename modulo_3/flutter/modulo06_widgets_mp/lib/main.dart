import 'package:flutter/material.dart';
import 'package:modulo06_widgets_mp/screens/pantalla_contexto.dart';
import 'package:modulo06_widgets_mp/widgets/catalogo_basicos.dart';
import 'package:modulo06_widgets_mp/widgets/contador_limitado.dart';
import 'package:modulo06_widgets_mp/widgets/etiqueta.dart';
import 'package:modulo06_widgets_mp/widgets/reloj.dart';
import 'package:modulo06_widgets_mp/widgets/servicio_estado.dart';

const int paso = 7;

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    colorScheme:  ColorScheme.fromSeed(
      seedColor:  Colors.deepOrange,
      brightness: Brightness.light,
    ),
    useMaterial3: true,
  ),
  home: switch (paso) {
    1 => const Scaffold(body: Center(child: Saludo())),
    2 => const CatalogoBasicos(),
    3 => const Scaffold(
      body: Center(
        child: Wrap(
          spacing:    12,
          runSpacing: 8,
          children: [
            Etiqueta(texto: 'Disponible', color: Colors.green),
            Etiqueta(texto: 'Agotado',    color: Colors.red,    relleno: true),
            Etiqueta(texto: 'En cocina',  color: Colors.orange),
            Etiqueta(texto: 'Urgente',    color: Colors.red,    fontSize: 16, relleno: true),
            Etiqueta(texto: 'Info',       color: Colors.blue,   fontSize: 11),
          ],
        ),
      ),
    ),
    4 => const Scaffold(
      body: Center(
        child: ServicioEstado(nombre: 'Parrilla'),
      ),
    ),
    5 => Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ContadorLimitado(
              etiqueta: 'Mesas ocupadas',
              limite:   1,
              color:    Colors.deepOrange,
              textoBoton: 'Ocupar',
              onLimite: () => debugPrint('¡Sala llena!'),
            ),
            const SizedBox(height: 40),
            ContadorLimitado(
              etiqueta: 'Pedidos pendientes',
              limite:   10,
              color:    Colors.brown, textoBoton: '',
            ),
          ],
        ),
      ),
    ),
    6 => Scaffold(
      appBar: AppBar(title: const Text('Tiempo de preparación')),
      body: const Center(child: Reloj()),
    ),
    7 => const PantallaContexto(),
    _ => Scaffold(body: Center(child: Text('Paso $paso: crea el widget primero'))),
  },

));

class Saludo extends StatelessWidget {
  const Saludo({super.key});

  @override
  Widget build(BuildContext context) {

    return const SelectableText(
      'Bienvenido a Sabor Local: cocina peruana fresca, mesas listas y pedidos al instante.',
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        letterSpacing: 4,
        color: Colors.deepOrange,
        shadows: [
          Shadow(color: Colors.black26, blurRadius: 4, offset: Offset(4, 4)),
        ]
      ),
      textAlign: TextAlign.left,

      maxLines: 3,
    );
  }
}
