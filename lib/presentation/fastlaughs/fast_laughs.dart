import 'package:flutter/material.dart';
import 'package:netflix_api/presentation/fastlaughs/widget/video_list_item.dart';

class FastLaughsScreen extends StatelessWidget {
  const FastLaughsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 10,
        itemBuilder: (context, index) {
          return VideoListItem(
            index: index,
          );
        },
      )),
    );
  }
}
