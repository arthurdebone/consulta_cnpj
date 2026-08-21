import 'package:consulta_cnpj/core/result/result.dart';
import 'package:consulta_cnpj/domain/entities/empresa.dart';
import 'package:consulta_cnpj/presentation/providers/empresa_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'empresa_notifier.g.dart';

//View Moedel que gerencia os estados na UI

@Riverpod(keepAlive: true)
class EmpresaNotifier extends _$EmpresaNotifier {
  ///build() é o estado inicial. Todo Notifier gerado (@riverpod class)
  ///exige um método build() que roda uma vez, na primeira vez que algo observa esse provider.

  @override
  FutureOr<Empresa?> build() {
    return null;
  }

  Future<void> buscarEmpresa(String cnpj) async {
    state = const AsyncLoading();

    final repository = ref.read(empresaRepositoryProvider);
    final result = await repository.getEmpresa(cnpj: cnpj);

    state = switch (result) {
      Ok(value: final empresa) => AsyncValue<Empresa?>.data(empresa),
      Err(error: final failure) => AsyncValue<Empresa?>.error(failure, StackTrace.current),
    };
  }
}
