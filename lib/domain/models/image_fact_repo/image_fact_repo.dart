import 'package:json_annotation/json_annotation.dart';

import 'result.dart';

part 'image_fact_repo.g.dart';

@JsonSerializable()
class ImageFactModel {
  List<Result>? results;

  ImageFactModel({this.results});

  factory ImageFactModel.fromJson(Map<String, dynamic> json) {
    return _$ImageFactRepoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ImageFactRepoToJson(this);
}
