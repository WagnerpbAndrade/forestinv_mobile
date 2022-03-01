class Arvore {
  dynamic id;
  dynamic medicaoId;
  dynamic parcelaId;
  int numArvore;
  double dap;
  double alturaTotal;
  String latitude;
  String longitude;
  String? estadoArvore;
  String observacao;
  DateTime? dataCriacao;
  DateTime? ultimaAtualizacao;

  Arvore({
    this.id,
    this.medicaoId,
    this.parcelaId,
    required this.numArvore,
    required this.dap,
    required this.alturaTotal,
    required this.latitude,
    required this.longitude,
    this.estadoArvore,
    required this.observacao,
    this.dataCriacao,
    this.ultimaAtualizacao,
  });

  factory Arvore.fromMap(Map<String, dynamic> json) => Arvore(
        id: json['id'],
        medicaoId: json['medicaoId'],
        parcelaId: json['parcelaId'],
        numArvore: json['numArvore'],
        dap: double.parse(json['dap'].toString()),
        alturaTotal: double.parse(json['alturaTotal'].toString()),
        latitude: json['latitude'],
        longitude: json['longitude'],
        estadoArvore: json['estadoArvore'],
        observacao: json['observacao'],
        dataCriacao: DateTime.parse(json["dataCriacao"]),
        ultimaAtualizacao: json["ultimaAtualizacao"] == null
            ? null
            : DateTime.parse(json["ultimaAtualizacao"]),
      );

  Map<String, dynamic> createToMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['medicaoId'] = medicaoId;
    data['parcelaId'] = parcelaId;
    data['numArvore'] = numArvore;
    data['dap'] = dap;
    data['alturaTotal'] = alturaTotal;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['estadoArvore'] = estadoArvore;
    data['observacao'] = observacao;
    data['dataCriacao'] = dataCriacao;
    data['ultimaAtualizacao'] = ultimaAtualizacao;
    return data;
  }

  Map<String, dynamic> updateToMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['numArvore'] = numArvore;
    data['dap'] = dap;
    data['alturaTotal'] = alturaTotal;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['estadoArvore'] = estadoArvore;
    data['observacao'] = observacao;
    data['ultimaAtualizacao'] = ultimaAtualizacao;
    return data;
  }

  @override
  String toString() {
    return 'Arvore -> id: $id - numeroArvore: $numArvore - dap: $dap - altura: $alturaTotal - ano: ${dataCriacao?.year}';
  }
}
