enum AtivoInativoEnum {
  SIM,
  NAO,
}

enum ValidacaoConsistenciaEnum {
  VMEDICAODAPANTERIOR,
  VIDADEDOISMENOSIDADEUMIGUALAUM,
  VESPPARCELADIFIDADE,
  VESTINVALIDO,
}

class RegraConsistencia {
  dynamic id;
  String? uuid;
  String? descricao;
  ValidacaoConsistenciaEnum? tipo;
  AtivoInativoEnum? ativoInativoEnum;
  DateTime? dataCriacao;
  DateTime? ultimaAtualizacao;

  RegraConsistencia(
      {this.id,
      this.uuid,
      this.descricao,
      this.tipo,
      this.ativoInativoEnum,
      this.dataCriacao,
      this.ultimaAtualizacao});

  RegraConsistencia.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uuid = json['uuid'];
    descricao = json['descricao'];
    tipo = ValidacaoConsistenciaEnum.values.elementAt(json['tipo']);
    ativoInativoEnum =
        AtivoInativoEnum.values.elementAt(json['ativoInativoEnum']);
    dataCriacao = DateTime.parse(json["dataCriacao"]);
    ultimaAtualizacao = json["ultimaAtualizacao"] == null
        ? null
        : DateTime.parse(json["ultimaAtualizacao"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uuid'] = uuid;
    data['descricao'] = descricao;
    data['tipo'] = tipo!.index;
    data['ativoInativoEnum'] = ativoInativoEnum!.index;
    data['dataCriacao'] = dataCriacao;
    data['ultimaAtualizacao'] = ultimaAtualizacao;
    return data;
  }

  Map<String, dynamic> updateToJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ativoInativoEnum'] = ativoInativoEnum!.index;
    data['ultimaAtualizacao'] = ultimaAtualizacao;
    return data;
  }

  bool isActive() {
    return ativoInativoEnum == AtivoInativoEnum.SIM;
  }

  static List<RegraConsistencia> createListWithRegrasConsistencia(
          final dynamic uuid) =>
      [
        RegraConsistencia(
          uuid: uuid,
          ativoInativoEnum: AtivoInativoEnum.SIM,
          tipo: ValidacaoConsistenciaEnum.VMEDICAODAPANTERIOR,
          descricao:
              "Identificar árvores com DAP2 < DAP1 entre medições consecutivas i e i+1, sendo i o ano da medição",
          dataCriacao: DateTime.now(),
          ultimaAtualizacao: DateTime.now(),
        ),
        RegraConsistencia(
          uuid: uuid,
          ativoInativoEnum: AtivoInativoEnum.SIM,
          tipo: ValidacaoConsistenciaEnum.VIDADEDOISMENOSIDADEUMIGUALAUM,
          descricao:
              "Identificar árvores que não atendem o cálculo: IDADE ATUAL - IDADE ANTERIOR = 1",
          dataCriacao: DateTime.now(),
          ultimaAtualizacao: DateTime.now(),
        ),
        RegraConsistencia(
          uuid: uuid,
          ativoInativoEnum: AtivoInativoEnum.SIM,
          tipo: ValidacaoConsistenciaEnum.VESPPARCELADIFIDADE,
          descricao:
              "Identificação de parcelas com mais de um espaçamento em idades diferentes",
          dataCriacao: DateTime.now(),
          ultimaAtualizacao: DateTime.now(),
        ),
        RegraConsistencia(
          uuid: uuid,
          ativoInativoEnum: AtivoInativoEnum.SIM,
          tipo: ValidacaoConsistenciaEnum.VESTINVALIDO,
          descricao:
              "Mudança no estado da árvore é irreal. Exemplo: de MORTA para DOMINADA",
          dataCriacao: DateTime.now(),
          ultimaAtualizacao: DateTime.now(),
        ),
      ];
}
