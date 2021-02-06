class MyNetworkError implements Exception {
  final String errorMessage;
  final String responseStatusCode;

  MyNetworkError(this.errorMessage, {this.responseStatusCode});
}
