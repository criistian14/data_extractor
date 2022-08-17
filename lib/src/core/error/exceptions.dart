class ApiException implements Exception {
  const ApiException({
    required this.error,
    this.code,
  });

  final String error;
  final int? code;
}

class CacheException implements Exception {
  CacheException({
    required this.error,
  });

  final String error;
}
