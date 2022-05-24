class ServerException implements Exception {
  final int code;
  final String message;

  ServerException({required this.message, required this.code});
}
