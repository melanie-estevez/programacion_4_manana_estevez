import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import '../models/plato.dart';

class PlatosNotifier extends Notifier<List<Plato>> {
  @override
  List<Plato> build() => [
    Plato(id:'1', nombre:'Ceviche Clásico', codigo:'PLT-001', tiempoPrep:15,   disponible:true,  destacado:true),
    Plato(id:'2', nombre:'Lomo Saltado',  codigo:'PLT-002', tiempoPrep:25,   disponible:true),
    Plato(id:'3', nombre:'Ají de Gallina', codigo:'PLT-003', tiempoPrep:20, disponible:false),
    Plato(id:'4', nombre:'Arroz con Mariscos', codigo:'PLT-004', tiempoPrep:30, disponible:true),
  ];

  void toggleDestacado(String id) {
    state = state.map((s) =>
        s.id == id
          ? Plato(id:s.id, nombre:s.nombre, codigo:s.codigo,
                        tiempoPrep:s.tiempoPrep, disponible:s.disponible,
                        destacado:!s.destacado)
          : s
    ).toList();
  }

  void eliminar(String id) {
    state = state.where((s) => s.id != id).toList();
  }

  void agregar(Plato plato) {
    state = [...state, plato];
  }
}

final platosProvider =
    NotifierProvider<PlatosNotifier, List<Plato>>(
  PlatosNotifier.new,
);

final busquedaProvider = StateProvider<String>((ref) => '');

final platosFiltradosProvider = Provider<List<Plato>>((ref) {
  final todos    = ref.watch(platosProvider);
  final busqueda = ref.watch(busquedaProvider);

  if (busqueda.isEmpty) return todos;

  final q = busqueda.toLowerCase();
  return todos.where((s) =>
      s.nombre.toLowerCase().contains(q) || s.codigo.toLowerCase().contains(q)
  ).toList();


});
