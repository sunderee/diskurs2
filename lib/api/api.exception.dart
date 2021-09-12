class ApiException implements Exception {
  final String error;
  final int? statusCode;
  final String? rawBody;

  const ApiException(
    this.error, {
    this.statusCode,
    this.rawBody,
  });
}
