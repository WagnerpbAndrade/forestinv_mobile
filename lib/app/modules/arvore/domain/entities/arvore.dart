class Arvore {
  dynamic id;
  dynamic medicaoId;
  int numArvore;
  double dap;
  double alturaTotal;
  String latitude;
  String longitude;
  String? estadoArvore;
  String observacao;

  Arvore({
    this.id,
    this.medicaoId,
    required this.numArvore,
    required this.dap,
    required this.alturaTotal,
    required this.latitude,
    required this.longitude,
    this.estadoArvore,
    required this.observacao,
  });

  factory Arvore.fromMap(Map<String, dynamic> json) => Arvore(
        id: json['id'],
        numArvore: json['numArvore'],
        dap: json['dap'],
        alturaTotal: json['alturaTotal'],
        latitude: json['latitude'],
        longitude: json['longitude'],
        estadoArvore: json['estadoArvore'],
        observacao: json['observacao'],
      );

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['medicaoId'] = medicaoId;
    data['numArvore'] = numArvore;
    data['dap'] = dap;
    data['alturaTotal'] = alturaTotal;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['estadoArvore'] = estadoArvore;
    data['observacao'] = observacao;
    return data;
  }
}
