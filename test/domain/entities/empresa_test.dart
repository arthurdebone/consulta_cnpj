import 'package:consulta_cnpj/domain/entities/empresa.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Empresa.fromJson', () {
    test('Deve retornar um objeto Empresa válido quando o JSON for populado', () {
      // 1. ARRANGEMENT (Montagem do cenário com dados mockados em Map)
      Map<String, dynamic> empresaAtiva = {
        "cnpj_raiz": "05525406",
        "razao_social": "DBONE INDUSTRIA E COMERCIO DE BEBIDAS LTDA",
        "capital_social": "400000.00",
        "responsavel_federativo": "",
        "atualizado_em": "2026-08-08T03:00:00.000Z",
        "porte": {"id": "03", "descricao": "Empresa de Pequeno Porte"},
        "natureza_juridica": {"id": "2062", "descricao": "Sociedade Empresária Limitada"},
        "qualificacao_do_responsavel": {"id": 49, "descricao": "Sócio-Administrador "},
        "socios": [
          {
            "cpf_cnpj_socio": "***101637**",
            "nome": "WILLIAM MIRANDA BARCELLOS",
            "tipo": "Pessoa Física",
            "data_entrada": "2023-11-08",
            "cpf_representante_legal": "***000000**",
            "nome_representante": null,
            "faixa_etaria": "21 a 30 anos",
            "atualizado_em": "2026-08-08T03:00:00.000Z",
            "pais_id": "1058",
            "qualificacao_socio": {"id": 49, "descricao": "Sócio-Administrador "},
            "qualificacao_representante": null,
            "pais": {"id": "1058", "iso2": "BR", "iso3": "BRA", "nome": "Brasil", "comex_id": "105"}
          },
          {
            "cpf_cnpj_socio": "***448267**",
            "nome": "CARLOS ALBERTO DE BONE",
            "tipo": "Pessoa Física",
            "data_entrada": "2023-11-08",
            "cpf_representante_legal": "***000000**",
            "nome_representante": null,
            "faixa_etaria": "61 a 70 anos",
            "atualizado_em": "2026-08-08T03:00:00.000Z",
            "pais_id": "1058",
            "qualificacao_socio": {"id": 49, "descricao": "Sócio-Administrador "},
            "qualificacao_representante": null,
            "pais": {"id": "1058", "iso2": "BR", "iso3": "BRA", "nome": "Brasil", "comex_id": "105"}
          }
        ],
        "simples": {
          "mei": "Não",
          "simples": "Sim",
          "data_opcao_mei": null,
          "data_exclusao_mei": null,
          "data_opcao_simples": "2007-07-01",
          "data_exclusao_simples": null,
          "atualizado_em": "2026-08-08T03:00:00.000Z"
        },
        "estabelecimento": {
          "cnpj": "05525406000101",
          "atividades_secundarias": [
            {
              "id": "1033301",
              "secao": "C",
              "divisao": "10",
              "grupo": "10.3",
              "classe": "10.33-3",
              "subclasse": "1033-3/01",
              "descricao": "Fabricação de sucos concentrados de frutas, hortaliças e legumes"
            },
            {
              "id": "1033302",
              "secao": "C",
              "divisao": "10",
              "grupo": "10.3",
              "classe": "10.33-3",
              "subclasse": "1033-3/02",
              "descricao": "Fabricação de sucos de frutas, hortaliças e legumes, exceto concentrados"
            },
            {
              "id": "4635401",
              "secao": "G",
              "divisao": "46",
              "grupo": "46.3",
              "classe": "46.35-4",
              "subclasse": "4635-4/01",
              "descricao": "Comércio atacadista de água mineral"
            },
            {
              "id": "4635403",
              "secao": "G",
              "divisao": "46",
              "grupo": "46.3",
              "classe": "46.35-4",
              "subclasse": "4635-4/03",
              "descricao": "Comércio atacadista de bebidas com atividade de fracionamento e acondicionamento associada"
            },
            {
              "id": "4637199",
              "secao": "G",
              "divisao": "46",
              "grupo": "46.3",
              "classe": "46.37-1",
              "subclasse": "4637-1/99",
              "descricao":
                  "Comércio atacadista especializado em outros produtos alimentícios não especificados anteriormente"
            },
            {
              "id": "4723700",
              "secao": "G",
              "divisao": "47",
              "grupo": "47.2",
              "classe": "47.23-7",
              "subclasse": "4723-7/00",
              "descricao": "Comércio varejista de bebidas"
            },
            {
              "id": "4729699",
              "secao": "G",
              "divisao": "47",
              "grupo": "47.2",
              "classe": "47.29-6",
              "subclasse": "4729-6/99",
              "descricao":
                  "Comércio varejista de produtos alimentícios em geral ou especializado em produtos alimentícios não especificados anteriormente"
            }
          ],
          "cnpj_raiz": "05525406",
          "cnpj_ordem": "0001",
          "cnpj_digito_verificador": "01",
          "tipo": "Matriz",
          "nome_fantasia": "TROPICAL SUCOS",
          "situacao_cadastral": "Ativa",
          "data_situacao_cadastral": "2005-08-06",
          "data_inicio_atividade": "2003-02-24",
          "nome_cidade_exterior": null,
          "tipo_logradouro": "RUA",
          "logradouro": "SANTA FE",
          "numero": "240",
          "complemento": null,
          "bairro": "VILA PALESTINA",
          "cep": "29145670",
          "ddd1": "27",
          "telefone1": "32861717",
          "ddd2": null,
          "telefone2": null,
          "ddd_fax": "27",
          "fax": "32861717",
          "email": "dbonecalvi@gmail.com",
          "situacao_especial": null,
          "data_situacao_especial": null,
          "atualizado_em": "2026-08-08T03:00:00.000Z",
          "atividade_principal": {
            "id": "4639701",
            "secao": "G",
            "divisao": "46",
            "grupo": "46.3",
            "classe": "46.39-7",
            "subclasse": "4639-7/01",
            "descricao": "Comércio atacadista de produtos alimentícios em geral"
          },
          "pais": {"id": "1058", "iso2": "BR", "iso3": "BRA", "nome": "Brasil", "comex_id": "105"},
          "estado": {"id": 8, "nome": "Espírito Santo", "sigla": "ES", "ibge_id": 32},
          "cidade": {"id": 3114, "nome": "Cariacica", "ibge_id": 3201308, "siafi_id": "5625"},
          "motivo_situacao_cadastral": null,
          "inscricoes_estaduais": [
            {
              "inscricao_estadual": "082200904",
              "ativo": true,
              "atualizado_em": "2025-11-17T00:00:00.000Z",
              "estado": {"id": 8, "nome": "Espírito Santo", "sigla": "ES", "ibge_id": 32}
            }
          ]
        }
      };

      // 2. ACTION (Execução da linha que queremos testar)
      final resultado = Empresa.fromJson(empresaAtiva);

      // 3. ASSERT (Verificação se o resultado é o esperado)
      expect(resultado, isA<Empresa>());
      expect(resultado.cnpj, 05525406000101);
      expect(resultado.razaoSocial, 'DBONE INDUSTRIA E COMERCIO DE BEBIDAS LTDA');
      expect(resultado.cnpj, '12.345.678/0001-99');
      expect(resultado.situacaoCadastral, 'ativo');
    });

    test('Deve lidar corretamente com campos nulos se o JSON vier incompleto', () {
      Map<String, dynamic> empresaBaixada = {
        "cnpj_raiz": "15603140",
        "razao_social": "MARCOS MENEGUETE QUARESMA 07869074799",
        "capital_social": "1.00",
        "responsavel_federativo": null,
        "atualizado_em": "2026-08-08T03:00:00.000Z",
        "porte": {"id": "01", "descricao": "Micro Empresa"},
        "natureza_juridica": {"id": "2135", "descricao": "Empresário (Individual)"},
        "qualificacao_do_responsavel": {"id": 50, "descricao": "Empresário "},
        "socios": [],
        "simples": {
          "mei": "Não",
          "simples": "Não",
          "data_opcao_mei": "2012-05-27",
          "data_exclusao_mei": "2018-02-01",
          "data_opcao_simples": "2012-05-27",
          "data_exclusao_simples": "2018-02-01",
          "atualizado_em": "2026-08-08T03:00:00.000Z"
        },
        "estabelecimento": {
          "cnpj": "15603140000121",
          "atividades_secundarias": [
            {
              "id": "4929901",
              "secao": "H",
              "divisao": "49",
              "grupo": "49.2",
              "classe": "49.29-9",
              "subclasse": "4929-9/01",
              "descricao": "Transporte rodoviário coletivo de passageiros, sob regime de fretamento, municipal"
            }
          ],
          "cnpj_raiz": "15603140",
          "cnpj_ordem": "0001",
          "cnpj_digito_verificador": "21",
          "tipo": "Matriz",
          "nome_fantasia": null,
          "situacao_cadastral": "",
          "data_situacao_cadastral": "2018-02-01",
          "data_inicio_atividade": "2012-05-27",
          "nome_cidade_exterior": null,
          "tipo_logradouro": "RUA",
          "logradouro": "TIRADENTES",
          "numero": "07",
          "complemento": null,
          "bairro": "VILA PRUDENCIO",
          "cep": "29155009",
          "ddd1": "27",
          "telefone1": "99763251",
          "ddd2": null,
          "telefone2": null,
          "ddd_fax": null,
          "fax": null,
          "email": "h.any.mq@hotmail.com",
          "situacao_especial": null,
          "data_situacao_especial": null,
          "atualizado_em": "2026-08-08T03:00:00.000Z",
          "atividade_principal": {
            "id": "4930201",
            "secao": "H",
            "divisao": "49",
            "grupo": "49.3",
            "classe": "49.30-2",
            "subclasse": "4930-2/01",
            "descricao": "Transporte rodoviário de carga, exceto produtos perigosos e mudanças, municipal"
          },
          "pais": {"id": "1058", "iso2": "BR", "iso3": "BRA", "nome": "Brasil", "comex_id": "105"},
          "estado": {"id": 8, "nome": "Espírito Santo", "sigla": "ES", "ibge_id": 32},
          "cidade": {"id": 3114, "nome": "Cariacica", "ibge_id": 3201308, "siafi_id": "5625"},
          "motivo_situacao_cadastral": null,
          "inscricoes_estaduais": []
        }
      };

      final resultado2 = Empresa.fromJson(empresaBaixada);

      expect(resultado2.situacaoCadastral, isNull);
    });
  });
}
///Abra o terminal na raiz do seu projeto e rode o seguinte comando:
///flutter test test/domain/entities/empresa_test.dart