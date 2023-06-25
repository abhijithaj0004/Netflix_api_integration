import 'package:netflix_api/domain/models/image_fact_repo/image_fact_repo.dart';

abstract class IDownloadsRepo {
  Future<ImageFactModel> getDownloadsImages();
}
