import 'package:data_extractor/src/core/error/error.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

mixin UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
