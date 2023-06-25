import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:netflix_api/domain/core/api_end_points.dart';
import 'package:netflix_api/domain/models/searchImage/search_img_model/search_img_model.dart';

class SearchServices extends SearchImgModel {
  Dio dio = Dio(BaseOptions(
    headers: {
      'Accept': 'application/json',
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkNjZmNmUyN2ZkMzAyMTNjMjA0Zjk5Y2FkZGNkYTM4MiIsInN1YiI6IjY0OGM1ZDZkYzNjODkxMDBhZTUwMTQ5NCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.FWPoBAE4TCONPjW3jAV7QbAG7G038B5Wle7EhjmJBlY',
    },
  ));

  Future<SearchImgModel> getSearchImg(String name) async {
    final response = await dio.get(
      ApiEndPoints.search,
      queryParameters: {"query": name},
    );
    if (response.statusCode == 200) {
      log(response.data.toString());
      return SearchImgModel.fromJson(response.data);
    } else {
      return SearchImgModel(results: []);
    }
  }
}
