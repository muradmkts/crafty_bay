class NetworkResponse {
  NetworkResponse(
      {required this.isSuccess,
      required this.responseCode,
      this.responseBody,
      this.errorMessage = "Something Went Wrong"});

  final bool isSuccess;
  final int responseCode;
  dynamic responseBody;
  String? errorMessage;
}
