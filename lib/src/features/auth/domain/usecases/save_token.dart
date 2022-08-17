import 'package:data_extractor/src/core/error/failures.dart';
import 'package:data_extractor/src/core/usecase.dart';
import 'package:data_extractor/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class SaveToken implements UseCase<void, String> {
  SaveToken(this.repository);

  final AuthRepository repository;

  @override
  Future<Either<Failure, void>> call(String params) {
    return repository.saveToken(params);
  }
}
