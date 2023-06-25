import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_api/core/constants.dart';
import 'package:netflix_api/domain/models/image_fact_repo/image_fact_repo.dart';
import 'package:netflix_api/domain/models/searchImage/search_img_model/search_img_model.dart';
import 'package:netflix_api/presentation/search/widget/search_idle.dart';
import 'package:netflix_api/presentation/search/widget/search_result_page.dart';
import 'package:netflix_api/services/downloadServices/download_services.dart';
import 'package:netflix_api/services/searchservices/search_services.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  SearchServices searchServices = SearchServices();
  SearchImgModel? searchImgModel;
  bool isSearch = false;
  bool isLoading = true;
  late ImageFactModel imageFactModel;
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      imageFactModel = await DownloadServices().getDownloadsImages();
      setState(() {
        isLoading = false;
      });
    });
    return isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : SafeArea(
            child: Scaffold(
              body: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CupertinoSearchTextField(
                      onChanged: (value) async {
                        if (value.isEmpty) {
                          setState(() {
                            isSearch = false;
                          });
                        }
                        searchImgModel =
                            await searchServices.getSearchImg(value);
                        if (searchImgModel != null &&
                            searchImgModel?.results != null &&
                            searchImgModel!.results!.isNotEmpty) {
                          setState(() {
                            isSearch = true;
                          });
                        }
                      },
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
                    Expanded(
                        child: isSearch
                            ? SearchResultPage(
                                searchImgModel: searchImgModel!,
                              )
                            : SearchIdleWidget(imageFactModel: imageFactModel)),
                  ],
                ),
              ),
            ),
          );
  }
}
