class EstadoArvore {
  final String id;
  final int index;
  final String description;

  EstadoArvore({
    required this.id,
    required this.description,
    required this.index,
  });

  @override
  String toString() {
    return 'id: $id - index: $index - estado: $description';
  }
}
