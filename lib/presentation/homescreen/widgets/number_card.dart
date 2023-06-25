import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_api/core/strings.dart';
import 'package:netflix_api/domain/models/image_fact_repo/image_fact_repo.dart';
import 'package:outlined_text/outlined_text.dart';

class NumberCardWidget extends StatelessWidget {
  final ImageFactModel imageFactModel;
  const NumberCardWidget(
      {super.key, required this.index, required this.imageFactModel});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            SizedBox(
              width: 40,
              height: 250,
            ),
            Container(
              width: 150,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                    image: NetworkImage(
                        '$kImgUrl${imageFactModel.results![index].posterPath ?? ''}'),
                    fit: BoxFit.cover),
              ),
            ),
          ],
        ),
        Positioned(
          bottom: -26,
          left: 0,
          child: OutlinedText(
            strokes: [
              OutlinedTextStroke(
                  color: Color.fromARGB(255, 255, 255, 255), width: 3)
            ],
            text: Text(
              '$index',
              style: GoogleFonts.inter(
                  textStyle: TextStyle(
                      fontSize: 120,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
            ),
          ),
        ),
      ],
    );
  }
}
