class InscricaoEstadual {
  final String inscricaoEstadual;
  final bool ativo;
  final String atualizadoEm;
  final int estadoId;
  final String estadoNome;
  final String estadoSigla;
  final int estadoIbgeId;

  const InscricaoEstadual({
    required this.inscricaoEstadual,
    required this.ativo,
    required this.atualizadoEm,
    required this.estadoId,
    required this.estadoNome,
    required this.estadoSigla,
    required this.estadoIbgeId,
  });

  factory InscricaoEstadual.fromJson(Map<String, dynamic> json) {
    final estado = json['estado'] as Map<String, dynamic>? ?? {};

    return InscricaoEstadual(
      inscricaoEstadual: json['inscricao_estadual'] as String,
      ativo: json['ativo'] as bool,
      atualizadoEm: json['atualizado_em'] as String,
      estadoId: estado['id'] as int,
      estadoNome: estado['nome'] as String,
      estadoSigla: estado['sigla'] as String,
      estadoIbgeId: estado['ibge_id'] as int,
    );
  }
}
