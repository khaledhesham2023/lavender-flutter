import 'package:freezed_annotation/freezed_annotation.dart';
part 'api_error_model.g.dart';
@JsonSerializable()
class ApiErrorModel {
  final String? message;
  final int? code;
  final String? status;

  ApiErrorModel({
    required this.message,
    this.code,
    this.status
  });

  factory ApiErrorModel.fromJson(Map<String,dynamic> json) => _$ApiErrorModelFromJson(json);



  Map<String,dynamic> toJson() => _$ApiErrorModelToJson(this);

}