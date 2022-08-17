import 'package:dartz/dartz.dart';
import 'package:data_extractor/src/core/error/failures.dart';
import 'package:data_extractor/src/core/usecase.dart';
import 'package:data_extractor/src/features/auth/domain/repositories/auth_repository.dart';

class GetToken implements UseCase<String?, NoParams> {
  GetToken(this.repository);

  final AuthRepository repository;

  @override
  Future<Either<Failure, String?>> call(NoParams params) {
    return repository.getToken();
  }
}
