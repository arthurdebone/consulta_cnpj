class Empresa {
  final String cnpj;
  final String razaoSocial;
  final String? nomeFantasia;
  final String situacaoCadastral;
  final String cidade;
  final String bairro;
  final String estado;
  final String? tipoLogradouro;
  final String logradouro;
  final String numero;
  final String? ddd;
  final String? telefone;
  final String? email;
  final String atividadePrincipal;
  final String? capitalSocial;
  final List<dynamic>? inscricoesEstaduais;

  const Empresa({
    required this.cnpj,
    required this.razaoSocial,
    this.nomeFantasia,
    required this.situacaoCadastral,
    required this.cidade,
    required this.estado,
    this.tipoLogradouro,
    required this.logradouro,
    required this.bairro,
    required this.numero,
    this.ddd,
    this.telefone,
    this.email,
    required this.atividadePrincipal,
    this.capitalSocial,
    this.inscricoesEstaduais,
  });

  factory Empresa.fromJson(Map<String, dynamic> json) {
    final estabelecimento = json['estabelecimento'] as Map<String, dynamic>? ?? {};
    final cidade = estabelecimento['cidade'] as Map<String, dynamic>? ?? {};
    final estado = estabelecimento['estado'] as Map<String, dynamic>? ?? {};
    final atividadePrincipal = estabelecimento['atividade_principal'] as Map<String, dynamic>? ?? {};

    return Empresa(
      cnpj: estabelecimento['cnpj'] as String,
      razaoSocial: json['razao_social'] as String,
      nomeFantasia: estabelecimento['nome_fantasia'] as String?,
      situacaoCadastral: estabelecimento['situacao_cadastral'] as String,
      cidade: cidade['nome'] as String,
      bairro: estabelecimento['bairro'] as String,
      estado: estado['sigla'] as String,
      tipoLogradouro: estabelecimento['tipo_logradouro'] as String?,
      logradouro: estabelecimento['logradouro'] as String,
      numero: estabelecimento['numero'] as String,
      ddd: estabelecimento['ddd1'] as String?,
      telefone: estabelecimento['telefone1'] as String?,
      email: estabelecimento['email'] as String?,
      atividadePrincipal: atividadePrincipal['descricao'] as String,
      capitalSocial: json['capital_social'] as String?,
      inscricoesEstaduais: estabelecimento['inscricoes_estaduais'] as List<dynamic>?,
    );
  }
}
