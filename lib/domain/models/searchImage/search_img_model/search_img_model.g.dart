// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_img_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchImgModel _$SearchImgModelFromJson(Map<String, dynamic> json) =>
    SearchImgModel(
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchImgModelToJson(SearchImgModel instance) =>
    <String, dynamic>{
      'results': instance.results,
    };
