class CustomNetworkException implements Exception {
  final String? message;

  final int? statusCode;

  CustomNetworkException({this.statusCode, this.message});
}
