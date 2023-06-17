import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_api/core/constants.dart';
import 'package:netflix_api/presentation/search/widget/title.dart';

final imageUrl =
    'https://www.themoviedb.org/t/p/w250_and_h141_face/9n2tJBplPbgR2ca05hS5CKXwP2c.jpg';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({super.key});

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
            itemBuilder: (context, index) => TopSearch(),
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
  const TopSearch({super.key});

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
                fit: BoxFit.cover, image: NetworkImage(imageUrl)),
          ),
        ),
        SizedBox(
          width: screenWidth * 0.3,
          child: Text(
            'Movie Name',
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
