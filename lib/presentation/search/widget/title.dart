import 'package:flutter/material.dart';

class TopTitleSearch extends StatelessWidget {
  final String title;
  const TopTitleSearch({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
