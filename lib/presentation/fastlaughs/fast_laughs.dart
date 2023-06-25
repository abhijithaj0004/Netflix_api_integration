import 'package:flutter/material.dart';
import 'package:netflix_api/domain/models/image_fact_repo/image_fact_repo.dart';
import 'package:netflix_api/presentation/fastlaughs/widget/video_list_item.dart';
import 'package:netflix_api/services/downloadServices/download_services.dart';

class FastLaughsScreen extends StatefulWidget {
  const FastLaughsScreen({super.key});

  @override
  State<FastLaughsScreen> createState() => _FastLaughsScreenState();
}

class _FastLaughsScreenState extends State<FastLaughsScreen> {
  late ImageFactModel imageFactModel;
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        imageFactModel = await DownloadServices().getDownloadsImages();
        setState(() {
          isLoading = false;
        });
      },
    );
    return isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : SafeArea(
            child: Scaffold(
                body: PageView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 10,
              itemBuilder: (context, index) {
                return VideoListItem(
                  imageFactModel: imageFactModel,
                  index: index,
                );
              },
            )),
          );
  }
}
