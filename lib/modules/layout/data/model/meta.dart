import 'package:collection/collection.dart';

class Meta {
  int? apiVersion;
  String? executionTime;

  Meta({this.apiVersion, this.executionTime});

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    apiVersion: json['api_version'] as int?,
    executionTime: json['execution_time'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'api_version': apiVersion,
    'execution_time': executionTime,
  };

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Meta) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => apiVersion.hashCode ^ executionTime.hashCode;
}
