import 'package:json_annotation/json_annotation.dart';

import 'result.dart';

part 'search_img_model.g.dart';

@JsonSerializable()
class SearchImgModel {
  List<Result>? results;

  SearchImgModel({this.results});

  factory SearchImgModel.fromJson(Map<String, dynamic> json) {
    return _$SearchImgModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchImgModelToJson(this);
}
