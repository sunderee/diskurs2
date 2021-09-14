class ApiException implements Exception {
  final String error;

  const ApiException(this.error);
}
