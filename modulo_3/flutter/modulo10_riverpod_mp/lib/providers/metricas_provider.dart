import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/metrica_plato.dart';

class MetricasNotifier extends AsyncNotifier<List<MetricaPlato>> {

  @override
  Future<List<MetricaPlato>> build() => _fetch();

  Future<List<MetricaPlato>> _fetch() async {
    await Future.delayed(const Duration(milliseconds: 800));
    return const [
      MetricaPlato(plato:'Ceviche Clásico', tiempoPrep:45.2, stock:62.1, mesas:70, pedidosActivos:5),
      MetricaPlato(plato:'Lomo Saltado',  tiempoPrep:88.1, stock:91.2, mesas:85, pedidosActivos:8),
      MetricaPlato(plato:'Ají de Gallina', tiempoPrep:22.4, stock:41.0, mesas:50, pedidosActivos:2),
      MetricaPlato(plato:'Arroz con Mariscos', tiempoPrep:22.4, stock:41.0, mesas:60, pedidosActivos:3),
      MetricaPlato(plato:'Pisco Sour', tiempoPrep:22.4, stock:41.0, mesas:40, pedidosActivos:4),
    ];
  }

  Future<void> recargar() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(_fetch);
  }
}

final metricasProvider =
    AsyncNotifierProvider<MetricasNotifier, List<MetricaPlato>>(
  MetricasNotifier.new,
);
