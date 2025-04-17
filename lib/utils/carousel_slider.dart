import 'package:cached_network_image/cached_network_image.dart';
import 'package:enuaniculturalforummobile/src/config.dart';
import 'package:enuaniculturalforummobile/src/utils.dart';
import 'package:enuaniculturalforummobile/view/screens/dashboard/home_screen/blog_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:async';

import '../view_model/posts/post_view_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends ConsumerStatefulWidget {
  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<String> items = ['Item 1', 'Item 2', 'Item 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Auto-Scrolling Carousel with Indicators'),
      ),
      body: CarouselWithIndicators(items: items),
    );
  }
}

///
///
///
///

class CarouselWithIndicators extends ConsumerStatefulWidget {
  final List<String> items;

  CarouselWithIndicators({required this.items});

  @override
  _CarouselWithIndicatorsState createState() => _CarouselWithIndicatorsState();
}

class _CarouselWithIndicatorsState
    extends ConsumerState<CarouselWithIndicators> {
  int _currentIndex = 0;
  CarouselSliderController _controller = CarouselSliderController();
  late Timer _timer;
  bool _isLoadingFuture = true;

  bool isLoading = false;
  late Future<void> _eventsData;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      _controller.nextPage();
    });
    // _eventsData = EventsBackend().getAllEventsAvailable();
    // _eventsData.then((_) {
    //   setState(() {
    //     _isLoadingFuture = false;
    //   });
    // });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var postProvider = ref.watch(postViewModel);
    var item = postProvider.postResponseModel!.data!.posts;

    return Column(
      children: [
        Column(
          children: [
            CarouselSlider(
              items: widget.items.map((item) {
                int index =
                    widget.items.indexOf(item); // Get the index of the item

                return GestureDetector(
                  onTap: () {
                    //navigate
                    navigatePush(
                        context,
                        BlogDetailsScreen(
                          title: postProvider
                              .postResponseModel!.data!.posts![index].title
                              .toString(),
                          blogDetails: postProvider.postResponseModel!.data!
                              .posts![index].description
                              .toString(),
                          createdAt: postProvider
                              .postResponseModel!.data!.posts![index].createdAt
                              .toString(),
                          author: postProvider
                              .postResponseModel!.data!.posts![index].author
                              .toString(),
                          category: postProvider.postResponseModel!.data!
                              .posts![index].categoryType
                              .toString(),
                          imagePath: postProvider
                              .postResponseModel!.data!.posts![index].filePath
                              .toString(),
                          slug: postProvider
                              .postResponseModel!.data!.posts![index].slug
                              .toString(),
                        ));
                  },
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          image: DecorationImage(
                            image: CachedNetworkImageProvider(postProvider
                                .postResponseModel!.data!.posts![index].filePath
                                .toString()),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: SizedBox(
                          height: 185.5.h,
                          child: Stack(
                            children: [
                              Positioned(
                                bottom: 10,
                                right: 10,
                                child: Container(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
              carouselController: _controller,
              options: CarouselOptions(
                height: 214.0.h,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 5),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                pauseAutoPlayOnTouch: true,
                enlargeCenterPage: true,
                viewportFraction: 1,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.items.map((item) {
                int index = widget.items.indexOf(item);
                return Container(
                  width: 10.0,
                  height: 10.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == index
                        ? AppColors.kPrimary1
                        : Colors.grey,
                  ),
                );
              }).toList(),
            ),
          ],
        )
      ],
    );
  }
}

///
///
///
///
