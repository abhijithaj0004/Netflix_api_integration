import 'package:dio/dio.dart';
import 'package:netflix_api/domain/core/api_end_points.dart';
import 'package:netflix_api/domain/downloads/i_download_repo.dart';

import 'package:netflix_api/domain/models/image_fact_repo/image_fact_repo.dart';

class DownloadServices extends IDownloadsRepo{
  Dio dio = Dio();
  @override
  Future<ImageFactModel> getDownloadsImages() async {
    final response = await dio.get(ApiEndPoints.downloads);
    if (response.statusCode == 200) {
      return ImageFactModel.fromJson(response.data);
    } else {
      return ImageFactModel(results: []);
    }
  }

  
}