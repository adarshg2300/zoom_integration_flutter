import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zoom_sdk_flutter/domain/usecases/fetch_video_list_usecase.dart';
import 'package:zoom_sdk_flutter/main.dart';
import 'package:zoom_sdk_flutter/presentation/bloc/home_data_bloc.dart';
import 'package:zoom_sdk_flutter/presentation/screens/home/video_event.dart';
import 'package:zoom_sdk_flutter/presentation/screens/home/video_state.dart';

import '../../../domain/entities/video_list_data.dart';
import '../../../res/utils/app_style.dart';

class CategoryVideoScreen extends StatefulWidget {
  const CategoryVideoScreen({Key? key}) : super(key: key);

  @override
  State<CategoryVideoScreen> createState() => _CategoryVideoScreenState();
}

class _CategoryVideoScreenState extends State<CategoryVideoScreen> {
  final VideoListBloc videoListBloc = getIt<VideoListBloc>();
  @override
  void initState() {
    super.initState();
    // Fetch data when the screen is initialized
    videoListBloc.add(FetchVideoListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: Container(
          color: Colors.black,
          child: BlocConsumer<VideoListBloc, VideoListState>(
            bloc: videoListBloc,
            listener: (context,state){
            },
            builder: (context, state) {
              print("dfjsdkjksj1${state}");
              if (state is VideoListLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is VideoListLoaded) {
                final posts = state.videoListData.result!.listing;
                return buildPosts(posts);
              } else if (state is VideoListError) {
                return Center(child: Text("Error: ${state.errorMessage}"));
              } else {
                return Center(child: Text("No data available"));
              }
            },
          ),
        ),
      ),
    );
  }

  Widget buildPosts(List<Listing> listing) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          height: 200,
          color: Colors.black,
          child: Image.network(
            listing[0].result![0].thumbnails.isNotEmpty
                ? listing[0].result![0].thumbnails[0].path ?? ''
                : '',
            fit: BoxFit.fill,
          ),
        ),
        SizedBox(height: 10),
        Expanded(
          child: ListView.builder(
            itemCount: listing.length,
            itemBuilder: (context, index) {
              final post = listing[index];
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Text(post.name!, style: AppStyle.titleStyle),
                    SizedBox(height: 5),
                    SizedBox(
                      height: 150, // Set a fixed height for the horizontal list
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: post.result!.length,
                        itemBuilder: (context, subindex) {
                          final subMenu = post.result![subindex];
                          return GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => ShowVideoScreen(
                              //       videoList: subMenu,
                              //     ),
                              //   ),
                              // );
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.4),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Stack(
                                children: [
                                  Image.network(
                                    subMenu.thumbnails.isNotEmpty
                                        ? subMenu.thumbnails[0].path ?? ''
                                        : '',
                                    fit: BoxFit.cover,
                                  ),
                                  Positioned(
                                    bottom: 5,
                                    left: 5,
                                    child: Text(
                                      subMenu.title ?? '',
                                      style: AppStyle.titleStyle,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
