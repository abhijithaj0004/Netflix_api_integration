import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_api/core/constants.dart';
import 'package:netflix_api/core/strings.dart';
import 'package:netflix_api/domain/models/image_fact_repo/image_fact_repo.dart';
import 'package:netflix_api/presentation/search/widget/title.dart';

final imageUrl =
    'https://www.themoviedb.org/t/p/w250_and_h141_face/9n2tJBplPbgR2ca05hS5CKXwP2c.jpg';

class SearchIdleWidget extends StatelessWidget {
  final ImageFactModel imageFactModel;
  const SearchIdleWidget({super.key, required this.imageFactModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TopTitleSearch(
          title: 'Top Searches',
        ),
        kheight,
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) => TopSearch(
              index: index,
              imageFactModel: imageFactModel,
            ),
            separatorBuilder: (context, index) => SizedBox(
              height: 10,
            ),
            itemCount: 10,
          ),
        ),
      ],
    );
  }
}

class TopSearch extends StatelessWidget {
  final int index;
  final ImageFactModel imageFactModel;
  const TopSearch(
      {super.key, required this.imageFactModel, required this.index});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: screenWidth * 0.4,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    '$kImgUrl${imageFactModel.results![index].backdropPath ?? 'https://www.themoviedb.org/t/p/w220_and_h330_face/7gKI9hpEMcZUQpNgKrkDzJpbnNS.jpg'}')),
          ),
        ),
        SizedBox(
          width: screenWidth * 0.3,
          child: Text(
            (imageFactModel.results![index].title == null)
                ? imageFactModel.results![index].name ?? 'Name error'
                : imageFactModel.results![index].title ?? 'Name error',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Icon(
          Icons.play_circle_outline,
          color: Colors.white,
          size: 60,
        )
      ],
    );
  }
}
