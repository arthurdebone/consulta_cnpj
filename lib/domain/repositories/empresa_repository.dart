import 'package:consulta_cnpj/core/errors/failures.dart';
import 'package:consulta_cnpj/core/result/result.dart';
import 'package:consulta_cnpj/domain/entities/empresa.dart';

abstract class EmpresaRepository {
  Future<Result<Empresa, Failure>> getEmpresa({required String cnpj});
}
