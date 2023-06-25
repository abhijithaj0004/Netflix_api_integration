import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_api/core/colors/colors.dart';
import 'package:netflix_api/core/constants.dart';
import 'package:netflix_api/core/strings.dart';
import 'package:netflix_api/domain/models/image_fact_repo/image_fact_repo.dart';
import 'package:netflix_api/presentation/downloads/downloads.dart';
import 'package:netflix_api/presentation/homescreen/widgets/main_horizontal_list.dart';
import 'package:netflix_api/presentation/homescreen/widgets/main_title.dart';
import 'package:netflix_api/presentation/homescreen/widgets/number_card.dart';
import 'package:netflix_api/services/downloadServices/download_services.dart';

ValueNotifier<bool> ScrollNotifier = ValueNotifier(true);

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = true;
  late ImageFactModel imageFactModel;
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      imageFactModel = await DownloadServices().getDownloadsImages();
      setState(() {
        isLoading = false;
      });
    });
    return isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : SafeArea(
            child: Scaffold(
                body: ValueListenableBuilder(
                    valueListenable: ScrollNotifier,
                    builder: (context, index, _) {
                      return NotificationListener<UserScrollNotification>(
                        onNotification: (notification) {
                          final ScrollDirection direction =
                              notification.direction;
                          if (direction == ScrollDirection.reverse) {
                            ScrollNotifier.value = false;
                          } else if (direction == ScrollDirection.forward) {
                            ScrollNotifier.value = true;
                          }
                          return true;
                        },
                        child: Stack(
                          children: [
                            ListView(
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      height: 600,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                '$kImgUrl${imageFactModel.results![1].posterPath}'),
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      left: 0,
                                      right: 0,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          IconTextButton(
                                            icon: Icons.add,
                                            title: 'My List',
                                          ),
                                          playButton(),
                                          IconTextButton(
                                            icon: Icons.info_outline,
                                            title: 'Info',
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                kheight,
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      MainHorizontalListWidget(
                                        imageFactModel: imageFactModel,
                                        title: 'Released in the past',
                                      ),
                                      MainHorizontalListWidget(
                                        imageFactModel: imageFactModel,
                                        title: 'Trending Now',
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          MainTitle(
                                              title:
                                                  'Top 10 TV shows in India Today'),
                                          kheight,
                                          LimitedBox(
                                            maxHeight: 240,
                                            child: ListView.separated(
                                              separatorBuilder:
                                                  (context, index) => SizedBox(
                                                width: 10,
                                              ),
                                              shrinkWrap: true,
                                              scrollDirection: Axis.horizontal,
                                              itemBuilder: (context, index) {
                                                return NumberCardWidget(
                                                    imageFactModel:
                                                        imageFactModel,
                                                    index: index + 1);
                                              },
                                              itemCount: 10,
                                            ),
                                          ),
                                          kheight,
                                        ],
                                      ),
                                      MainHorizontalListWidget(
                                        imageFactModel: imageFactModel,
                                        title: 'Tense Dramas',
                                      ),
                                      MainHorizontalListWidget(
                                        imageFactModel: imageFactModel,
                                        title: 'south Indian Cinema',
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            ScrollNotifier.value
                                ? SizedBox(
                                    width: double.infinity,
                                    height: 100,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Row(
                                            children: [
                                              Image.asset(
                                                'assets/images/netflix.png',
                                                width: 60,
                                              ),
                                              const Spacer(),
                                              const Icon(
                                                Icons.cast,
                                                color: kWhite,
                                              ),
                                              kWidth,
                                              Container(
                                                width: 25,
                                                height: 25,
                                                color: Colors.blue,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              'TV Shows',
                                              style: textHomeBar,
                                            ),
                                            Text(
                                              'Movies',
                                              style: textHomeBar,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  'Categories',
                                                  style: textHomeBar,
                                                ),
                                                Icon(
                                                  Icons.arrow_drop_down,
                                                  color: kWhite,
                                                )
                                              ],
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                : kheight
                          ],
                        ),
                      );
                    })),
          );
  }

  TextButton playButton() {
    return TextButton.icon(
      onPressed: () {},
      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(kWhite)),
      icon: Icon(
        Icons.play_arrow,
        color: Colors.black,
      ),
      label: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Text(
          'Play',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class IconTextButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final double iconSize;
  final double textsize;
  final Color textColor;
  const IconTextButton(
      {super.key,
      required this.title,
      required this.icon,
      this.iconSize = 30,
      this.textsize = 15,
      this.textColor = kWhite});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: kWhite,
          size: iconSize,
        ),
        Text(
          title,
          style: TextStyle(fontSize: textsize, color: textColor),
        ),
      ],
    );
  }
}
