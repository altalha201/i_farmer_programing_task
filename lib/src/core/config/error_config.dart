class _AppException implements Exception {
  final String _prefix;
  final String? _message;

  _AppException({required String prefix, String? message})
      : _prefix = prefix,
        _message = message;

  @override
  String toString() {
    var m = _message != null ? " : $_message" : "";
    return "$_prefix$m";
  }
}

class FetchDataException extends _AppException {
  final String? message;

  FetchDataException({this.message})
      : super(prefix: "Error Fetching Data", message: message);
}

class TimeExpiredException extends _AppException {
  TimeExpiredException() : super(prefix: "Taking to much time");
}

class NotFoundException extends _AppException {
  NotFoundException() : super(prefix: "Not Found");
}
