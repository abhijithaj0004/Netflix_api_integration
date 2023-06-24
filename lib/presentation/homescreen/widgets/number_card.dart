import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_api/core/constants.dart';
import 'package:netflix_api/presentation/homescreen/widgets/main_title.dart';
import 'package:netflix_api/presentation/search/widget/search_idle.dart';
import 'package:outlined_text/outlined_text.dart';

class NumberCardWidget extends StatelessWidget {
  const NumberCardWidget({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

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
                    image: NetworkImage(imageUrl), fit: BoxFit.cover),
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
