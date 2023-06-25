import 'package:flutter/material.dart';
import 'package:netflix_api/core/strings.dart';
import 'package:netflix_api/domain/models/image_fact_repo/image_fact_repo.dart';

class MainCardWidget extends StatelessWidget {
  final int index;
  final ImageFactModel imageFactModel;
  const MainCardWidget(
      {super.key, required this.imageFactModel, required this.index});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.40,
      height: 240,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
              image: NetworkImage(
                  '$kImgUrl${imageFactModel.results![index].posterPath ?? ''}'),
              fit: BoxFit.cover)),
    );
  }
}
