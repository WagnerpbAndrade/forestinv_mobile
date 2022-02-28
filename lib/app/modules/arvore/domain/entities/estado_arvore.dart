class EstadoArvore {
  final String id;
  final String description;

  EstadoArvore({
    required this.id,
    required this.description,
  });

  @override
  String toString() {
    return 'id: $id - estado: $description';
  }
}
