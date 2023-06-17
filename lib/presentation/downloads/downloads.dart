import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix_api/core/colors/colors.dart';
import 'package:netflix_api/core/constants.dart';
import 'package:netflix_api/presentation/mainwidgets/app_bar_widget.dart';

class DownloadsScreen extends StatelessWidget {
  DownloadsScreen({super.key});
  final _widgetList = [
    const _SmartDownloads(),
    Section2(),
    Section3(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            child: AppBarWidget(
              title: 'Downloads',
            ),
            preferredSize: Size.fromHeight(50)),
        body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListView.separated(
              itemBuilder: (context, index) => _widgetList[index],
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 20,
                );
              },
              itemCount: _widgetList.length,
            )),
      ),
    );
  }
}

class Section2 extends StatelessWidget {
  Section2({super.key});
  final imageList = [
    'https://www.themoviedb.org/t/p/w220_and_h330_face/7gKI9hpEMcZUQpNgKrkDzJpbnNS.jpg',
    'https://www.themoviedb.org/t/p/w220_and_h330_face/fiVW06jE7z9YnO4trhaMEdclSiC.jpg',
    'https://www.themoviedb.org/t/p/w220_and_h330_face/8Vt6mWEReuy4Of61Lnj5Xj704m8.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const Text(
          'Introducing Downloads for you',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: kWhite, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        kheight,
        Text(
          "We will download a personalised selection of movies and shows for you, so there's \nalways something watch on your \ndevice",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
        SizedBox(
          width: size.width,
          height: size.width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Color.fromARGB(255, 86, 86, 86),
                radius: size.width * 0.38,
              ),
              DownloadsCenterImage(
                imageList: imageList[0],
                margins: EdgeInsets.only(left: 150, bottom: 20),
                size: Size(size.width * 0.4, size.width * 0.58),
                angle: 20,
              ),
              DownloadsCenterImage(
                imageList: imageList[2],
                margins: EdgeInsets.only(right: 150, bottom: 20),
                size: Size(size.width * 0.4, size.width * 0.58),
                angle: -20,
              ),
              DownloadsCenterImage(
                imageList: imageList[1],
                margins: EdgeInsets.only(left: 0, top: 20),
                size: Size(size.width * 0.45, size.height * 0.30),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: SizedBox(
            width: double.infinity,
            child: MaterialButton(
                height: 50,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7)),
                color: Color.fromARGB(255, 55, 83, 210),
                onPressed: () {},
                child: Text(
                  'Set up',
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold, color: kWhite),
                )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: MaterialButton(
              height: 50,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7)),
              color: buttonColorWhite,
              onPressed: () {},
              child: Text(
                'See what you can download',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
        )
      ],
    );
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.settings,
          color: kWhite,
        ),
        kWidth,
        Text('Smart Downloads'),
      ],
    );
  }
}

class DownloadsCenterImage extends StatelessWidget {
  DownloadsCenterImage({
    super.key,
    required this.imageList,
    required this.margins,
    required this.size,
    this.angle = 0,
  });

  final String imageList;
  final double angle;
  final EdgeInsets margins;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle * pi / 180,
      child: Container(
        margin: margins,
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9),
            image: DecorationImage(
              image: NetworkImage(imageList),
              fit: BoxFit.cover,
            )),
      ),
    );
  }
}