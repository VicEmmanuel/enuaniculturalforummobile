import 'package:enuaniculturalforummobile/src/components.dart';
import 'package:enuaniculturalforummobile/src/config.dart';
import 'package:enuaniculturalforummobile/src/models.dart';
import 'package:enuaniculturalforummobile/utils/alerts.dart';
import 'package:enuaniculturalforummobile/utils/custom_print.dart';
import 'package:enuaniculturalforummobile/utils/navigators.dart';
import 'package:enuaniculturalforummobile/utils/util_functions.dart';
import 'package:enuaniculturalforummobile/view/screens/dashboard/home_screen/create_post_screen.dart';
import 'package:enuaniculturalforummobile/view/screens/dashboard/home_screen/edit_post/edit_post_screen.dart';
import 'package:enuaniculturalforummobile/view_model/posts/post_view_model.dart';
import 'package:enuaniculturalforummobile/view_model/theme_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BlogDetailsScreen extends ConsumerStatefulWidget {
  final String title;
  final String blogDetails;
  final String createdAt;
  final String author;
  final String category;
  final String slug;
  final String imagePath;
  const BlogDetailsScreen(
      {super.key,
      required this.title,
      required this.blogDetails,
      required this.createdAt,
      required this.author,
        required this.slug,
        required this.category,
      required this.imagePath});

  @override
  ConsumerState<BlogDetailsScreen> createState() => _BlogDetailsScreenState();
}

class _BlogDetailsScreenState extends ConsumerState<BlogDetailsScreen> {
  late QuillController _editQuillController;

  @override
  void initState() {

    var provider = ref.read(postViewModel);

    provider.editPostNameController.text = widget.title;
    provider.editAuthorController.text = widget.author ;
    provider.editSelectedItem = widget.category;
    provider.editDetails = widget.blogDetails;
    var delta = provider.htmlToQuillDelta(widget.blogDetails);
    var doc =Document.fromDelta(delta);
    provider.editQuillMainController = QuillController(document: doc, selection: const TextSelection.collapsed(offset: 0));
    provider.slug = widget.slug;
    logger.wtf(provider.editQuillMainController);


    // provider.downloadImages();
    // provider.setEditIndex();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var themeProvider = ref.watch(themeViewModel).themeMode;

    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBars.mainAppBar(
        context,
        backgroundColor: theme.scaffoldBackgroundColor,
        arrowBackColor: theme.colorScheme.primary,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 15.h,),
                Container(
                  height: 200.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      image: DecorationImage(
                          image: NetworkImage(widget.imagePath),
                          fit: BoxFit.cover)),
                ),
                SizedBox(
                  height: 10.h,
                ),
                TextView(
                  text: widget.title,
                  fontSize: 18.spMin,
                  fontWeight: FontWeight.w600,
                  maxLines: 3,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Icon(
                      Icons.person,
                      color: AppColors.kPrimary1,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    TextView(
                      text: widget.author,
                      fontSize: 12.spMin,
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      // width: 67.w,
                      width: 50.w,
                      decoration: BoxDecoration(
                          color: AppColors.kErrorPrimary,
                          borderRadius: BorderRadius.circular(40.r)),
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: TextView(
                          text: widget.category,
                          fontFamily: monaSansFont,
                          fontSize: 10.spMin,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      )),
                    ),
                    TextView(
                      text:
                          '${UtilFunctions.formatDate(widget.createdAt)} ${UtilFunctions.formatTime(widget.createdAt)}',
                      fontFamily: monaSansFont,
                      fontSize: 10.spMin,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                Divider(),
                Center(
                  child: Html(
                    data: """
                      ${widget.blogDetails}
                                  
                                  """,
            
                  ),
                )
              ],
            ),
          ),
        ),
      ),
        floatingActionButton:DummyData.accessToken!=null?  SizedBox(
          height: 50,
          width: 50,
          child: FloatingActionButton(
            backgroundColor: AppColors.kPrimary1,
            elevation: 0,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5))),
            onPressed: () async {

              if( DummyData.accessToken != null){
                logger.wtf(DummyData.role);
                if(DummyData.role == 1.toString()){
                  navigatePush(context, EditPostScreen());
                }else{
                  displayAdminEditPermissionDialog(context,
                      themeMode: themeProvider, theme: theme);
                }

              }else{
                displayLoginPermissionDialog(context,
                    themeMode: themeProvider, theme: theme);
              }
              // DummyData.accessToken != null
              //     ? navigatePush(context, EditPostScreen())
              //     : displayLoginPermissionDialog(context,
              //     themeMode: themeProvider, theme: theme);
            },
            child: const Icon(
              Icons.edit,
              color: Colors.white,
            ),
          ),
        ): null
    );
  }
}
