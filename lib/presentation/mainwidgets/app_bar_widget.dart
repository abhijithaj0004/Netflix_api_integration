import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_api/core/constants.dart';

class AppBarWidget extends StatelessWidget {
  final String title;
  const AppBarWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        kWidth,
        Text(
          title,
          style: GoogleFonts.montserrat(
              textStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        ),
        Spacer(),
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
        kWidth,
        
      ],
    );
  }
}
