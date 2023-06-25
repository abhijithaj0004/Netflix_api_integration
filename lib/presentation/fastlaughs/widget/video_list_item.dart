import 'package:flutter/material.dart';
import 'package:netflix_api/core/colors/colors.dart';
import 'package:netflix_api/core/strings.dart';
import 'package:netflix_api/domain/models/image_fact_repo/image_fact_repo.dart';

class VideoListItem extends StatelessWidget {
  final ImageFactModel imageFactModel;
  final int index;
  const VideoListItem(
      {super.key, required this.index, required this.imageFactModel});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      '$kImgUrl${imageFactModel.results![index].posterPath ?? 'https://www.themoviedb.org/t/p/w220_and_h330_face/7gKI9hpEMcZUQpNgKrkDzJpbnNS.jpg'}'),
                  fit: BoxFit.cover)),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //left side
                CircleAvatar(
                  backgroundColor: Colors.black,
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.volume_off_outlined,
                        color: kWhite,
                      )),
                ),
                //right side
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            '$kImgUrl${imageFactModel.results![index].posterPath ?? 'https://www.themoviedb.org/t/p/w220_and_h330_face/7gKI9hpEMcZUQpNgKrkDzJpbnNS.jpg'}'),
                        radius: 27,
                      ),
                    ),
                    VideoActionWidget(
                        icon: Icons.sentiment_very_satisfied_sharp,
                        title: 'LOL'),
                    VideoActionWidget(icon: Icons.add, title: 'My List'),
                    VideoActionWidget(icon: Icons.share, title: 'Share'),
                    VideoActionWidget(icon: Icons.play_arrow, title: 'Play'),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class VideoActionWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  const VideoActionWidget({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        children: [
          Icon(
            icon,
            color: kWhite,
          ),
          Text(title),
        ],
      ),
    );
  }
}
