import 'package:flutter/material.dart';
import 'package:netflix_api/core/constants.dart';
import 'package:netflix_api/presentation/search/widget/title.dart';

const imageURL =
    'https://www.themoviedb.org/t/p/w220_and_h330_face/8Vt6mWEReuy4Of61Lnj5Xj704m8.jpg';

class SearchResultPage extends StatelessWidget {
  const SearchResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
            alignment: Alignment.topLeft,
            child: TopTitleSearch(title: 'Movies & TV')),
        kheight,
        Expanded(
            child: GridView.builder(
          shrinkWrap: true,
          itemCount: 20,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1 / 1.5),
          itemBuilder: (context, index) {
            return SearchResultItemTile();
          },
        )),
      ],
    );
  }
}

class SearchResultItemTile extends StatelessWidget {
  const SearchResultItemTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
              image: NetworkImage(imageURL), fit: BoxFit.cover)),
    );
  }
}
