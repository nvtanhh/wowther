class ServerException implements Exception {
  final int code;
  final String message;

  ServerException({required this.message, required this.code});
}

extension ServerExceptionExtension on ServerException {
  bool get isBadRequest => code == 400;
  bool get isUnauthorized => code == 401;
  bool get isForbidden => code == 403;
  bool get isNotFound => code == 404;
  bool get isInternalServerError => code == 500;
}
