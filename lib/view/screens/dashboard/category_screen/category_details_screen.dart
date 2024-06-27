import 'package:enuaniculturalforummobile/config/app_strings.dart';
import 'package:enuaniculturalforummobile/src/components.dart';
import 'package:enuaniculturalforummobile/src/config.dart';
import 'package:enuaniculturalforummobile/utils/navigators.dart';
import 'package:enuaniculturalforummobile/view/components/blog_card.dart';
import 'package:enuaniculturalforummobile/view/components/shared/responsive_wrap.dart';
import 'package:enuaniculturalforummobile/view/screens/dashboard/home_screen/blog_details_screen.dart';
import 'package:enuaniculturalforummobile/view_model/posts/post_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../src/providers.dart';

class CategoryDetailsScreen extends ConsumerStatefulWidget {
  final String title;
  final String slug;
  const CategoryDetailsScreen(
      {super.key, required this.title, required this.slug});

  @override
  ConsumerState<CategoryDetailsScreen> createState() =>
      _CategoryDetailsScreenState();
}

class _CategoryDetailsScreenState extends ConsumerState<CategoryDetailsScreen> {
  @override
  void didChangeDependencies() {
    ref.watch(postViewModel).getPostByCategories(context, slug: widget.slug);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var postProvider = ref.watch(postViewModel);
    var themeProvider = ref.watch(themeViewModel).themeMode;
    var theme = Theme.of(context);
    return postProvider.isGettingPostsByCategory
        ? SuccessLoadingScreen(
            informationText: 'Fetching ${widget.title} Category')
        : Scaffold(
            appBar: AppBars.mainAppBar(
              context,
              backgroundColor: Colors.white,
              arrowBackColor: theme.colorScheme.primary,
            ),
            backgroundColor: Colors.white,
            body: postProvider.categoryResponseType!.data!.posts!.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ImageView.asset(
                          AppImages.emptyListIconPng,
                          width: 150.w,
                        ),
                        TextView(
                          text: 'No post found in ${widget.title} category',
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(
                          height: 70.h,
                        )
                      ],
                    ),
                  )
                : SafeArea(
                    child: XResponsiveWrap.mobile(
                      onRefresh: () => postProvider.getPostByCategories(context,
                          slug: widget.slug),
                      // loading: provider.isGettingPersonalListings,
                      // loadFailed:  recycleProvider.recycleHistoryResponse!.data == [],
                      children: [
                        SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    TextView(
                                      text: '${widget.title} Category',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20.spMin,
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    posts(),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
          );
  }

  posts() {
    var postProvider = ref.watch(postViewModel);
    return postProvider.isGettingPosts
        ? ShimmerLoader()
        : ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: postProvider.categoryResponseType!.data!.posts!.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              var item = postProvider.categoryResponseType!.data!.posts![index];
              // DateTime renewalDate = DateTime.parse(item.renewalDate.toString());
              // int formattedRenewalDate = postProvider.daysBetween(renewalDate);
              return InkWell(
                  onTap: () {
                    navigatePush(
                        context,
                        BlogDetailsScreen(
                          title: item.title.toString(),
                          blogDetails: item.description.toString(),
                          createdAt: item.createdAt.toString(),
                          author: item.author.toString(),
                          category: item.categoryType.toString(),
                          imagePath: item.filePath.toString(),
                        ));
                  },
                  child: BlogCard(
                    imageText: item.filePath.toString(),
                    title: item.title.toString(),
                    categoryType: item.categoryType.toString(),
                    author: item.author.toString(),
                    timeStamp: item.createdAt.toString(),
                    canTap: true,
                  ));
            },
          );
  }
}
