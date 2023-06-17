import 'package:flutter/material.dart';
import 'package:netflix_api/presentation/downloads/downloads.dart';
import 'package:netflix_api/presentation/fastlaughs/fast_laughs.dart';
import 'package:netflix_api/presentation/homescreen/home_screen.dart';
import 'package:netflix_api/presentation/mainscreen/widgets/bottom_nav.dart';
import 'package:netflix_api/presentation/newandhot/new_and_hot.dart';
import 'package:netflix_api/presentation/search/search.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  final pages = [
    HomeScreen(),
    NewAndHotScreen(),
    FastLaughsScreen(),
    SearchScreen(),
    DownloadsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: changeIndexNotifier,
        builder: (context, index, child) {
          return pages[index];
        },
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
