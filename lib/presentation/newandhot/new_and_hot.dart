import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_api/core/colors/colors.dart';
import 'package:netflix_api/core/constants.dart';
import 'package:netflix_api/presentation/downloads/downloads.dart';
import 'package:netflix_api/presentation/homescreen/home_screen.dart';
import 'package:netflix_api/presentation/mainwidgets/app_bar_widget.dart';
import 'package:netflix_api/presentation/search/widget/search_idle.dart';

class NewAndHotScreen extends StatelessWidget {
  const NewAndHotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: Text(
                'New & Hot',
                style: GoogleFonts.montserrat(
                    textStyle:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
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
                  labelStyle:
                      TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                _buildComingSoon(),
                _buildEveryOnesWatching(),
              ],
            )),
      ),
    );
  }
}

_buildComingSoon() {
  return ListView.builder(
    itemBuilder: (context, index) {
      return comingSoonPageList();
    },
    itemCount: 3,
  );
}

class comingSoonPageList extends StatelessWidget {
  const comingSoonPageList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 50,
          child: Column(
            children: [
              Text(
                'FEB',
                style: TextStyle(
                    fontSize: 16,
                    color: const Color.fromARGB(255, 116, 115, 115)),
              ),
              Text(
                '11',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: SizedBox(
            width: size.width - 50,
            height: 500,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://www.themoviedb.org/t/p/w533_and_h300_bestv2/wRxLAw4l17LqiFcPLkobriPTZAw.jpg'),
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
                    Text(
                      'TALL GIRL 2',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
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
                  'Coming on Friday',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 190, 188, 188)),
                ),
                kheight,
                Text(
                  'Tall Girl 2',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                kheight,
                Text(
                  'Landing the lead in the school musical is a \ndream come true for Jodi, until the pressure \nsends her confidence -- and her relationship--\ninto a tailspin.',
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
}

_buildEveryOnesWatching() {
  return ListView.builder(
    itemBuilder: (context, index) {
      return EveryOnesWatchingList(
        imgurl: imageList[index],
      );
    },
    itemCount: 3,
  );
}

class EveryOnesWatchingList extends StatelessWidget {
  final String imgurl;
  const EveryOnesWatchingList({
    super.key,
    this.imgurl =
        'https://www.themoviedb.org/t/p/w250_and_h141_face/9n2tJBplPbgR2ca05hS5CKXwP2c.jpg',
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
            'Friends',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          kheight,
          Text(
            'This hit sitcom follows the merry misadvantages of six 20-somthing pals as they navigate the pitfalls of \nwork, life and love in 1990s Manhattan.',
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
                  image: NetworkImage(imgurl), fit: BoxFit.cover),
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
