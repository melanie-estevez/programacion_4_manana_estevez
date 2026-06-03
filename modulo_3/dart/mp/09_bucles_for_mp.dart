void main() {
  for (int i = 1; i <= 5; i++) {
    print('Preparando postre $i');
  }

  for (int i = 0; i <= 100; i += 20) {
    print('Progreso de preparacion: $i%');
  }

  for (int i = 5; i >= 1; i--) {
    print('Ordenes restantes: $i');
  }
}