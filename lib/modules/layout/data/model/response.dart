import 'package:collection/collection.dart';

import 'data.dart';

class ResponseMovies {
  String? status;
  String? statusMessage;
  Data? data;

  ResponseMovies({this.status, this.statusMessage, this.data});

  factory ResponseMovies.fromJson(Map<String, dynamic> json) => ResponseMovies(
    status: json['status'] as String?,
    statusMessage: json['status_message'] as String?,
    data: json['data'] == null
        ? null
        : Data.fromJson(json['data'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    'status_message': statusMessage,
    'data': data?.toJson(),
  };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! ResponseMovies) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

}
