import 'movies_data_model.dart';

class MoviesResponseModel {
  MoviesResponseModel({this.status, this.statusMessage, this.data});

  MoviesResponseModel.fromJson(dynamic json) {
    status = json['status'];
    statusMessage = json['status_message'];
    data = json['data'] != null ? MoviesDataModel.fromJson(json['data']) : null;
  }
  String? status;
  String? statusMessage;
  MoviesDataModel? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['status_message'] = statusMessage;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}
