import 'package:flutter/material.dart';
import 'package:netflix_api/presentation/search/widget/search_result_page.dart';

class MainCardWidget extends StatelessWidget {
  final String HomeCardImg;
  const MainCardWidget({super.key, required this.HomeCardImg});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.40,
      height: 240,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
              image: NetworkImage(HomeCardImg), fit: BoxFit.cover)),
    );
  }
}
