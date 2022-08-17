import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure([this.properties]);

  final List<dynamic>? properties;

  @override
  List<Object> get props => [
        (properties ?? []),
      ];
}

class ServerFailure extends Failure {
  const ServerFailure({
    required this.error,
    this.code,
  });

  final String error;
  final int? code;
}

class CacheFailure extends Failure {
  const CacheFailure({
    required this.error,
  });

  final String error;
}
