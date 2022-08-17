import 'package:data_extractor/src/core/error/failures.dart';
import 'package:data_extractor/src/features/auth/auth.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required AuthLocalDataSource localDataSource,
  }) : _localDataSource = localDataSource;

  final AuthLocalDataSource _localDataSource;

  @override
  Future<Either<Failure, String?>> getToken() async {
    try {
      final token = await _localDataSource.getToken();
      return Right(token);
    } catch (e) {
      return Left(CacheFailure(error: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> saveToken(String token) async {
    try {
      await _localDataSource.saveToken(token);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure(error: e.toString()));
    }
  }
}
