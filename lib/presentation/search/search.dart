import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_api/core/constants.dart';
import 'package:netflix_api/presentation/search/widget/search_idle.dart';
import 'package:netflix_api/presentation/search/widget/search_result_page.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CupertinoSearchTextField(
                backgroundColor: Color.fromARGB(255, 56, 56, 56),
                style: TextStyle(color: Colors.white),
                prefixIcon: Icon(
                  CupertinoIcons.search,
                  color: Colors.grey,
                ),
                suffixIcon: Icon(
                  CupertinoIcons.xmark_circle_fill,
                  color: Colors.grey,
                ),
              ),
              kheight,
              // Text(
              //   'Top Searches',
              //   style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              // ),
              kheight,
              Expanded(child: SearchIdleWidget()),
            ],
          ),
        ),
      ),
    );
  }
}
