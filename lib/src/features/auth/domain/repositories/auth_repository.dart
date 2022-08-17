import 'package:data_extractor/src/core/error/error.dart';
import 'package:dartz/dartz.dart';

mixin AuthRepository {
  Future<Either<Failure, String?>> getToken();

  Future<Either<Failure, void>> saveToken(String token);
}
