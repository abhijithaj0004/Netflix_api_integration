import 'package:flutter/material.dart';
import 'package:netflix_api/core/constants.dart';
import 'package:netflix_api/domain/models/image_fact_repo/image_fact_repo.dart';
import 'package:netflix_api/presentation/homescreen/widgets/main_card.dart';
import 'package:netflix_api/presentation/homescreen/widgets/main_title.dart';

class MainHorizontalListWidget extends StatelessWidget {
  final ImageFactModel imageFactModel;

  final String title;
  const MainHorizontalListWidget(
      {super.key, required this.title, required this.imageFactModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(title: title),
        kheight,
        LimitedBox(
          maxHeight: 240,
          child: ListView.separated(
            separatorBuilder: (context, index) => SizedBox(
              width: 10,
            ),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return MainCardWidget(
                index: index,
                imageFactModel: imageFactModel,
              );
            },
            itemCount: 10,
          ),
        ),
        kheight,
      ],
    );
  }
}
