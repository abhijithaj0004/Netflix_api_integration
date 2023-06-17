import 'package:flutter/material.dart';
import 'package:netflix_api/core/constants.dart';
import 'package:netflix_api/presentation/downloads/downloads.dart';
import 'package:netflix_api/presentation/homescreen/widgets/main_card.dart';
import 'package:netflix_api/presentation/homescreen/widgets/main_horizontal_list.dart';
import 'package:netflix_api/presentation/homescreen/widgets/main_title.dart';
import 'package:netflix_api/presentation/search/widget/search_idle.dart';
import 'package:netflix_api/presentation/search/widget/search_result_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MainHorizontalListWidget(
                  title: 'Released in the past',
                  homeCardImg: imageList[2],
                ),
                MainHorizontalListWidget(
                    title: 'Released in the past', homeCardImg: imageList[1]),
                MainHorizontalListWidget(
                  title: 'Tense Dramas',
                  homeCardImg: imageList[0],
                ),
                MainHorizontalListWidget(
                  title: 'south Indian Cinema',
                  homeCardImg: imageList[2],
                )
              ],
            ),
          ],
        ),
      )),
    );
  }
}
