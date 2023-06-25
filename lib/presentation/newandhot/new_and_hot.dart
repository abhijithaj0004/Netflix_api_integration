import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_api/core/colors/colors.dart';
import 'package:netflix_api/core/constants.dart';
import 'package:netflix_api/core/strings.dart';
import 'package:netflix_api/domain/models/image_fact_repo/image_fact_repo.dart';
import 'package:netflix_api/presentation/homescreen/home_screen.dart';
import 'package:netflix_api/services/downloadServices/download_services.dart';

class NewAndHotScreen extends StatefulWidget {
  const NewAndHotScreen({super.key});

  @override
  State<NewAndHotScreen> createState() => _NewAndHotScreenState();
}

class _NewAndHotScreenState extends State<NewAndHotScreen> {
  bool isloading = true;
  late ImageFactModel imageFactModel;
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      imageFactModel = await DownloadServices().getDownloadsImages();
      setState(() {
        isloading = false;
      });
    });
    return isloading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : SafeArea(
            child: DefaultTabController(
              length: 2,
              child: Scaffold(
                  appBar: AppBar(
                    backgroundColor: Colors.black,
                    title: Text(
                      'New & Hot',
                      style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold)),
                    ),
                    actions: [
                      Row(
                        children: [
                          Icon(
                            Icons.cast,
                            size: 30,
                            color: Colors.white,
                          ),
                          kWidth,
                          Container(
                            width: 25,
                            height: 25,
                            color: Colors.blue,
                          ),
                        ],
                      ),
                      kWidth,
                    ],
                    bottom: TabBar(
                        unselectedLabelColor: kWhite,
                        labelColor: Colors.black,
                        labelStyle: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                        indicator: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30)),
                        tabs: [
                          Tab(
                            child: Text(
                              '🍿Coming Soon',
                            ),
                          ),
                          Tab(
                            child: Text("👀 Everyone's Watching"),
                          )
                        ]),
                  ),
                  body: TabBarView(
                    children: [
                      _buildComingSoon(imageFactModel),
                      _buildEveryOnesWatching(imageFactModel),
                    ],
                  )),
            ),
          );
  }
}

_buildComingSoon(ImageFactModel imageFactModel) {
  return ListView.builder(
    itemBuilder: (context, index) {
      return comingSoonPageList(
        imageFactModel: imageFactModel,
        index: index,
      );
    },
    itemCount: imageFactModel.results?.length,
  );
}

class comingSoonPageList extends StatelessWidget {
  final int index;
  final ImageFactModel imageFactModel;
  const comingSoonPageList({
    super.key,
    required this.imageFactModel,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    List<String> date = (imageFactModel.results![index].firstAirDate == null)
        ? ["2023", '05', '30']
        : imageFactModel.results![index].firstAirDate!.split('-');
    final size = MediaQuery.of(context).size;
    // final DateTime parsedDate =
    //     DateTime.parse(imageFactModel.results![index].firstAirDate ?? 'Soon');
    // final DateFormat formatter = DateFormat.MMMMEEEEd();
    // final String convertedDate = formatter.format(parsedDate);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 50,
          child: Column(
            children: [
              Text(
                returnMonth(date[1]),
                style: TextStyle(
                    fontSize: 16,
                    color: const Color.fromARGB(255, 116, 115, 115)),
              ),
              Text(
                date[2],
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: SizedBox(
            width: size.width - 50,
            // height: 500,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                          '$kImgUrl${imageFactModel.results![index].backdropPath}' ??
                              'https://www.themoviedb.org/t/p/w220_and_h330_face/7gKI9hpEMcZUQpNgKrkDzJpbnNS.jpg',
                        ),
                        fit: BoxFit.cover),
                  ),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.volume_off_outlined,
                          color: kWhite,
                        )),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                kheight,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      child: Container(
                        width: 200,
                        child: Text(
                          (imageFactModel.results![index].title == null)
                              ? imageFactModel.results![index].name ??
                                  'Name error'
                              : imageFactModel.results![index].title ??
                                  'Name error',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    IconTextButton(
                      title: 'Remind Me',
                      icon: Icons.alarm,
                      textsize: 12,
                      iconSize: 25,
                    ),
                    IconTextButton(
                      title: 'Info',
                      icon: Icons.info_outline,
                      textsize: 12,
                      iconSize: 25,
                    ),
                    SizedBox(
                      width: 5,
                    )
                  ],
                ),
                kheight,
                Text(
                  '${imageFactModel.results![index].firstAirDate ?? 'Coming soon'}',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 190, 188, 188)),
                ),
                kheight,
                Text(
                  (imageFactModel.results![index].title == null)
                      ? imageFactModel.results![index].name ?? 'Name error'
                      : imageFactModel.results![index].title ?? 'Name error',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                kheight,
                Text(
                  imageFactModel.results![index].overview ?? 'Name error',
                  style: TextStyle(
                      color: Color.fromARGB(255, 124, 122, 122),
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      height: 1.5),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  String returnMonth(String month) {
    switch (month) {
      case '01':
        return 'JAN';
      case '02':
        return 'FEB';
      case '03':
        return 'MAR';
      case '04':
        return 'APR';
      case '05':
        return 'MAY';
      case '06':
        return 'JUN';
      case '07':
        return 'JUL';
      case '08':
        return 'AUG';
      case '09':
        return 'JAN';
      case '10':
        return 'SEP';
      case '11':
        return 'OCT';
      case '12':
        return 'NOV';
      default:
        return '??';
    }
  }
}

_buildEveryOnesWatching(ImageFactModel imageFactModel) {
  return ListView.builder(
    itemBuilder: (context, index) {
      return EveryOnesWatchingList(
          index: index, imageFactModel: imageFactModel);
    },
    itemCount: imageFactModel.results!.length,
  );
}

class EveryOnesWatchingList extends StatelessWidget {
  final ImageFactModel imageFactModel;
  final int index;

  const EveryOnesWatchingList({
    super.key,
    required this.imageFactModel,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          kheight,
          Text(
            (imageFactModel.results![index].title == null)
                ? imageFactModel.results![index].name ?? 'Name error'
                : imageFactModel.results![index].title ?? 'Name error',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          kheight,
          Text(
            imageFactModel.results![index].overview ?? 'Name error',
            style: TextStyle(
                color: Color.fromARGB(255, 124, 122, 122),
                fontSize: 15,
                fontWeight: FontWeight.bold,
                height: 1.5),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                    '$kImgUrl${imageFactModel.results![index].backdropPath}' ??
                        'https://www.themoviedb.org/t/p/w220_and_h330_face/7gKI9hpEMcZUQpNgKrkDzJpbnNS.jpg',
                  ),
                  fit: BoxFit.cover),
            ),
            child: Align(
              alignment: Alignment.bottomRight,
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.volume_off_outlined,
                    color: kWhite,
                  )),
            ),
          ),
          kheight,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconTextButton(
                title: 'Share',
                icon: Icons.share,
                textColor: Colors.grey,
              ),
              kWidth,
              IconTextButton(
                title: 'My List',
                icon: Icons.add,
                textColor: Colors.grey,
              ),
              kWidth,
              IconTextButton(
                title: 'Play',
                icon: Icons.play_arrow,
                textColor: Colors.grey,
              ),
              kWidth
            ],
          )
        ],
      ),
    );
  }
}
