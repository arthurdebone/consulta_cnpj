import 'package:consulta_cnpj/core/errors/exceptions.dart';
import 'package:consulta_cnpj/core/errors/failures.dart';
import 'package:consulta_cnpj/core/result/result.dart';
import 'package:consulta_cnpj/data/datasources/empresa_remote_datasource.dart';
import 'package:consulta_cnpj/domain/entities/empresa.dart';
import 'package:consulta_cnpj/domain/repositories/empresa_repository.dart';

class EmpresaRepositoryImpl implements EmpresaRepository {
  final EmpresaRemoteDatasource _empresaRemoteDatasource;

  EmpresaRepositoryImpl(this._empresaRemoteDatasource);

  @override
  Future<Result<Empresa, Failure>> getEmpresa({required String cnpj}) async {
    try {
      final empresa = await _empresaRemoteDatasource.getEmpresa(cnpj: cnpj);

      return Result.success(empresa);
    } on ServerException catch (e) {
      return Result.failure(ServerFailure(e.message, statusCode: e.statusCode));
    } on NetworkException catch (e) {
      return Result.failure(NetworkFailure(e.message));
    } catch (e) {
      return Result.failure(UnknownFailure(e.toString()));
    }
  }
}
