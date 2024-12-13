import 'dart:convert';
import 'dart:developer';

void urlLogger(String url, Map<String, dynamic> params) {
  var time = DateTime.now();
  log(
    "GET : $url",
    name: "HEAT_URL",
    time: time,
  );
  log(
    jsonEncode(params),
    name: "PARAMS",
    time: time,
  );
}

void dataLogger(String tag, Object data) => log(
      "$tag => ${jsonEncode(data)}",
      name: "DATA",
      time: DateTime.now(),
    );

void infoLogger(String tag, String message) => log(
      "$tag => $message",
      name: "INFO",
      time: DateTime.now(),
    );

void errorLogger(Object? error, StackTrace? stackTrack, String message) => log(
      message,
      name: "ERROR",
      error: error,
      stackTrace: stackTrack,
      time: DateTime.now(),
    );
