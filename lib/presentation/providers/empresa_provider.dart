import 'package:consulta_cnpj/data/datasources/empresa_remote_datasource.dart';
import 'package:consulta_cnpj/data/repositories/empresa_repository_impl.dart';
import 'package:consulta_cnpj/domain/repositories/empresa_repository.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'empresa_provider.g.dart';

@Riverpod(keepAlive: true)
http.Client httpClient(Ref ref) {
  return http.Client();
}

@Riverpod(keepAlive: true)
EmpresaRemoteDatasource empresaRemoteDatasource(Ref ref) {
  return EmpresaRemoteDatasourceImpl(ref.watch(httpClientProvider));
}

@Riverpod(keepAlive: true)
EmpresaRepository empresaRepository(Ref ref) {
  return EmpresaRepositoryImpl(ref.watch(empresaRemoteDatasourceProvider));
}
