class AuthenticationException implements Exception {
  final String message;
  final String exceptionCode;

  AuthenticationException({
    required this.message,
    required this.exceptionCode,
  });
}

class NetworkConnectionException implements Exception {
  final String message;
  final String exceptionCode;

  NetworkConnectionException({
    required this.message,
    required this.exceptionCode,
  });
}
