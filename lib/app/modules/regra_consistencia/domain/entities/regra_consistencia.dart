class RegraConsistencia {
  int? id;
  String? uuid;
  String? descricao;
  String? tipo;
  String? ativoInativoEnum;
  String? dataCriacao;
  String? ultimaAtualizacao;

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
    tipo = json['tipo'];
    ativoInativoEnum = json['ativoInativoEnum'];
    dataCriacao = json['dataCriacao'];
    if (json['ultimaAtualizacao'] == null) {
      ultimaAtualizacao = null;
    } else {
      ultimaAtualizacao = json['ultimaAtualizacao'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['uuid'] = uuid;
    data['descricao'] = descricao;
    data['tipo'] = tipo;
    data['ativoInativoEnum'] = ativoInativoEnum;
    data['dataCriacao'] = dataCriacao;
    data['ultimaAtualizacao'] = ultimaAtualizacao;
    return data;
  }
}
