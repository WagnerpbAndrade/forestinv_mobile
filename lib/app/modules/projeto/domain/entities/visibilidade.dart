class Visibilidade {
  final String id;
  final String description;

  Visibilidade({
    required this.id,
    required this.description,
  });

  @override
  String toString() {
    return 'id: $id - visibilidade: $description';
  }
}
