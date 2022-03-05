enum EstadoArvoreEnum {
  NORMAL,
  DOMINANTE,
  MORTA,
  FALHA,
  QUEBRADA,
  INCLINADA,
  DOMINADA,
  BIFURCADA,
  TRIFURCADA,
  CORTADO,
}

class Arvore {
  dynamic id;
  dynamic medicaoId;
  dynamic parcelaId;
  dynamic projetoId;
  int numArvore;
  double dap;
  double alturaTotal;
  String latitude;
  String longitude;
  EstadoArvoreEnum estadoArvore;
  String estadoDescription;
  String observacao;
  DateTime? dataCriacao;
  DateTime? ultimaAtualizacao;

  Arvore({
    this.id,
    this.medicaoId,
    this.parcelaId,
    this.projetoId,
    required this.numArvore,
    required this.dap,
    required this.alturaTotal,
    required this.latitude,
    required this.longitude,
    required this.estadoArvore,
    required this.estadoDescription,
    required this.observacao,
    this.dataCriacao,
    this.ultimaAtualizacao,
  });

  factory Arvore.fromMap(Map<String, dynamic> json) => Arvore(
        id: json['id'],
        medicaoId: json['medicaoId'],
        parcelaId: json['parcelaId'],
        projetoId: json['projetoId'],
        numArvore: json['numArvore'],
        dap: double.parse(json['dap'].toString()),
        alturaTotal: double.parse(json['alturaTotal'].toString()),
        latitude: json['latitude'],
        longitude: json['longitude'],
        estadoArvore: json['estadoArvore'],
        estadoDescription: json['estadoDescription'],
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
    data['projetoId'] = projetoId;
    data['numArvore'] = numArvore;
    data['dap'] = dap;
    data['alturaTotal'] = alturaTotal;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['estadoArvore'] = estadoArvore.index;
    data['estadoDescription'] = estadoDescription;
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
    data['estadoArvore'] = estadoArvore.index;
    data['estadoDescription'] = estadoDescription;
    data['observacao'] = observacao;
    data['ultimaAtualizacao'] = ultimaAtualizacao;
    return data;
  }

  bool isEstadoValido(final Arvore arvoreAtual) {
    if (estadoArvore == EstadoArvoreEnum.NORMAL &&
        (arvoreAtual.estadoArvore == EstadoArvoreEnum.NORMAL ||
            arvoreAtual.estadoArvore == EstadoArvoreEnum.BIFURCADA ||
            arvoreAtual.estadoArvore == EstadoArvoreEnum.TRIFURCADA ||
            arvoreAtual.estadoArvore == EstadoArvoreEnum.MORTA ||
            arvoreAtual.estadoArvore == EstadoArvoreEnum.QUEBRADA ||
            arvoreAtual.estadoArvore == EstadoArvoreEnum.CORTADO)) {
      return true;
    }

    if (estadoArvore == EstadoArvoreEnum.BIFURCADA &&
        (arvoreAtual.estadoArvore == EstadoArvoreEnum.BIFURCADA ||
            arvoreAtual.estadoArvore == EstadoArvoreEnum.MORTA ||
            arvoreAtual.estadoArvore == EstadoArvoreEnum.QUEBRADA)) {
      return true;
    }

    if (estadoArvore == EstadoArvoreEnum.TRIFURCADA &&
        (arvoreAtual.estadoArvore == EstadoArvoreEnum.TRIFURCADA ||
            arvoreAtual.estadoArvore == EstadoArvoreEnum.MORTA ||
            arvoreAtual.estadoArvore == EstadoArvoreEnum.QUEBRADA)) {
      return true;
    }

    if (estadoArvore == EstadoArvoreEnum.MORTA &&
        arvoreAtual.estadoArvore == EstadoArvoreEnum.MORTA) {
      return true;
    }

    if (estadoArvore == EstadoArvoreEnum.FALHA &&
        arvoreAtual.estadoArvore == EstadoArvoreEnum.FALHA) {
      return true;
    }

    if (estadoArvore == EstadoArvoreEnum.CORTADO &&
        arvoreAtual.estadoArvore == EstadoArvoreEnum.CORTADO) {
      return true;
    }

    if (estadoArvore == EstadoArvoreEnum.DOMINADA &&
        (arvoreAtual.estadoArvore == EstadoArvoreEnum.DOMINADA ||
            arvoreAtual.estadoArvore == EstadoArvoreEnum.BIFURCADA ||
            arvoreAtual.estadoArvore == EstadoArvoreEnum.TRIFURCADA ||
            arvoreAtual.estadoArvore == EstadoArvoreEnum.MORTA ||
            arvoreAtual.estadoArvore == EstadoArvoreEnum.QUEBRADA)) {
      return true;
    }

    if (estadoArvore == EstadoArvoreEnum.DOMINANTE &&
        (arvoreAtual.estadoArvore == EstadoArvoreEnum.DOMINANTE ||
            arvoreAtual.estadoArvore == EstadoArvoreEnum.MORTA ||
            arvoreAtual.estadoArvore == EstadoArvoreEnum.QUEBRADA)) {
      return true;
    }

    return false;
  }

  @override
  String toString() {
    return 'Arvore -> id: $id - numeroArvore: $numArvore - estado: ${EstadoArvoreEnum.values.elementAt(estadoArvore.index).name} - dap: $dap - altura: $alturaTotal - ano: ${dataCriacao?.year}';
  }
}
