import 'package:flutter/material.dart';
import 'package:netflix_api/core/constants.dart';
import 'package:netflix_api/core/strings.dart';
import 'package:netflix_api/domain/models/searchImage/search_img_model/search_img_model.dart';
import 'package:netflix_api/presentation/search/widget/title.dart';

const imageURL = '/8Vt6mWEReuy4Of61Lnj5Xj704m8.jpg';

class SearchResultPage extends StatelessWidget {
  final SearchImgModel searchImgModel;
  const SearchResultPage({super.key, required this.searchImgModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
            alignment: Alignment.topLeft,
            child: const TopTitleSearch(title: 'Movies & TV')),
        kheight,
        Expanded(
            child: GridView.builder(
          shrinkWrap: true,
          itemCount: searchImgModel.results?.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1 / 1.5),
          itemBuilder: (context, index) {
            return SearchResultItemTile(
              imgP: searchImgModel.results![index].posterPath ?? "$imageURL",
            );
          },
        )),
      ],
    );
  }
}

class SearchResultItemTile extends StatelessWidget {
  final String imgP;
  const SearchResultItemTile({
    super.key,
    required this.imgP,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
              image: NetworkImage('$kImgUrl$imgP'), fit: BoxFit.cover)),
    );
  }
}
