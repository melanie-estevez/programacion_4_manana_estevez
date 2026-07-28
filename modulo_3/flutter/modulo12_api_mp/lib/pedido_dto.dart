class PedidoDto {
  final int id;
  final String title;
  final bool completed;

  const PedidoDto({
    required this.id,
    required this.title,
    required this.completed,
  });

  factory PedidoDto.fromJson(Map<String, dynamic> json) => PedidoDto(
    id:        json['id']        as int,
    title:     json['title']     as String,
    completed: json['completed'] as bool,
  );
}
