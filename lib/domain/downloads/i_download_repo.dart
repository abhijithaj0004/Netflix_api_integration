import 'package:dio/dio.dart';
import 'package:netflix_api/domain/core/api_end_points.dart';
import 'package:netflix_api/domain/models/image_fact_repo/image_fact_repo.dart';

abstract class IDownloadsRepo {
  Future<ImageFactModel> getDownloadsImages();
}
