// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_fact_repo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageFactModel _$ImageFactModelFromJson(Map<String, dynamic> json) =>
    ImageFactModel(
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ImageFactModelToJson(ImageFactModel instance) =>
    <String, dynamic>{
      'results': instance.results,
    };
