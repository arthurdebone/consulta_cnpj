import 'package:consulta_cnpj/core/errors/failures.dart';
import 'package:consulta_cnpj/core/utils/mascaras.dart';
import 'package:consulta_cnpj/core/utils/validacao_cnpj.dart';
import 'package:consulta_cnpj/domain/entities/empresa.dart';
import 'package:consulta_cnpj/presentation/providers/empresa_notifier.dart';
import 'package:consulta_cnpj/presentation/providers/empresa_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class EmpresaView extends ConsumerStatefulWidget {
  const EmpresaView({super.key});

  @override
  ConsumerState<EmpresaView> createState() => _EmpresaViewState();
}

class _EmpresaViewState extends ConsumerState<EmpresaView> {
  final _formKey = GlobalKey<FormState>();
  final _validator = ValidacaoCnpj();
  late final TextEditingController _cnpjController;

  final _cnpjMaskFormatter = MaskTextInputFormatter(
    mask: 'AA.AAA.AAA/AAAA-00',
    filter: {
      "A": RegExp(r'[a-zA-Z0-9]'),
      "0": RegExp(r'[0-9]'),
    },
    type: MaskAutoCompletionType.lazy,
  );

  @override
  void initState() {
    super.initState();
    _cnpjController = TextEditingController();

    final prefs = ref.read(sharedPreferencesProvider);
    final ultimoCnpj = prefs.getString('cnpj');

    if (ultimoCnpj != null && ultimoCnpj.isNotEmpty) {
      _cnpjController.text = ultimoCnpj;
    }
  }

  @override
  void dispose() {
    _cnpjController.dispose();
    super.dispose();
  }

  void _consultar() {
    if (_formKey.currentState?.validate() ?? false) {
      final cnpjUnmasked = _cnpjMaskFormatter.getUnmaskedText();
      ref.read(empresaProvider.notifier).buscarEmpresa(cnpjUnmasked);
    }
  }

  @override
  Widget build(BuildContext context) {
    final estado = ref.watch(empresaProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Consulta CNPJ'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _cnpjController,
                    inputFormatters: [_cnpjMaskFormatter],
                    keyboardType: TextInputType.text,
                    textCapitalization: TextCapitalization.characters,
                    decoration: InputDecoration(
                      labelText: 'CNPJ',
                      hintText: 'A1.B2C.3D4/E5F6-00',
                      border: const OutlineInputBorder(),
                      helperText: 'O novo formato de CNPJ aceita letras e números.',
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: _consultar,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Informe o CNPJ';
                      }
                      if (!_validator.validacaoCnpj(value)) {
                        return 'CNPJ inválido. Verifique os dados.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton.icon(
                      onPressed: estado.isLoading ? null : _consultar,
                      icon: const Icon(Icons.search),
                      label: const Text('Buscar CNPJ'),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            estado.when(
              data: (empresa) {
                if (empresa == null) {
                  return const Center(
                    child: Text('Digite um CNPJ acima para pesquisar.'),
                  );
                }
                return _EmpresaCardDetails(empresa: empresa);
              },
              loading: () => const Center(
                child: Padding(
                  padding: EdgeInsets.all(32.0),
                  child: CircularProgressIndicator(),
                ),
              ),
              error: (error, stackTrace) {
                final mensagem = switch (error) {
                  ServerFailure f => 'Erro no servidor: ${f.message}',
                  NetworkFailure f => 'Erro de conexão: ${f.message}',
                  Failure f => f.message,
                  _ => 'Erro inesperado: $error',
                };

                return Card(
                  color: Theme.of(context).colorScheme.errorContainer,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.error_outline,
                          color: Theme.of(context).colorScheme.onErrorContainer,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            mensagem,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onErrorContainer,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _EmpresaCardDetails extends StatelessWidget {
  final Empresa empresa;

  const _EmpresaCardDetails({required this.empresa});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              empresa.razaoSocial,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            if (empresa.nomeFantasia != null && empresa.nomeFantasia!.isNotEmpty) ...[
              const SizedBox(height: 4),
              Text(
                'Nome Fantasia: ${empresa.nomeFantasia}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
            const Divider(height: 24),
            _infoRow('CNPJ', empresa.cnpj),
            _infoRow('Situação Cadastral', empresa.situacaoCadastral),
            _infoRow('Atividade Principal', empresa.atividadePrincipal),
            _infoRow(
              'Endereço',
              '${empresa.tipoLogradouro ?? ''} ${empresa.logradouro}, ${empresa.numero} - ${empresa.bairro}, ${empresa.cidade}/${empresa.estado}',
            ),
            if (empresa.telefone != null)
              _infoRow(
                'Telefone',
                '(${empresa.ddd ?? ''}) ${empresa.telefone}',
              ),
            if (empresa.email != null) _infoRow('E-mail', empresa.email!),
            if (empresa.capitalSocial != null) _infoRow('Capital Social', formatarMoeda(empresa.capitalSocial)),
            if (empresa.inscricoesEstaduais != null && empresa.inscricoesEstaduais!.isNotEmpty) ...[
              const SizedBox(height: 8),
              const Text(
                'Inscrições Estaduais:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              ...empresa.inscricoesEstaduais!.map(
                (ie) => Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 2.0),
                  child: Text(
                    '• ${ie.inscricaoEstadual} (${ie.estadoSigla}) - ${ie.ativo ? "Ativa" : "Inativa"}',
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(color: Colors.black87, fontSize: 14),
          children: [
            TextSpan(
              text: '$label: ',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(text: Mascaras.mascaraCnpj(value)),
          ],
        ),
      ),
    );
  }

  String formatarMoeda(String? valor) {
    if (valor == null || valor.isEmpty) return 'R\$ 0,00';

    final numero = double.tryParse(valor) ?? 0.0;
    final formatter = NumberFormat.currency(
      locale: 'pt_BR',
      symbol: 'R\$',
      decimalDigits: 2,
    );

    return formatter.format(numero);
  }
}
