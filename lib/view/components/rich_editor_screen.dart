import 'dart:convert';

import 'package:enuaniculturalforummobile/src/components.dart';
import 'package:enuaniculturalforummobile/src/config.dart';
import 'package:enuaniculturalforummobile/src/utils.dart';
import 'package:enuaniculturalforummobile/utils/alerts.dart';
import 'package:enuaniculturalforummobile/view/components/app_bars.dart';
import 'package:enuaniculturalforummobile/view_model/posts/post_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_quill/quill_delta.dart';
import 'package:flutter_quill/quill_delta.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_quill/flutter_quill.dart';
import 'package:rich_editor/rich_editor.dart';
import 'package:html/parser.dart' as htmlParser;
import 'package:html/dom.dart' as dom;

import '../../src/providers.dart';

class RichEditorScreen extends StatefulWidget {
  const RichEditorScreen({super.key});

  @override
  State<RichEditorScreen> createState() => _RichEditorScreenState();
}

class _RichEditorScreenState extends State<RichEditorScreen> {
  // QuillController _controller = QuillController.basic();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SizedBox(
          height: 50.h,
        ),
        Expanded(
          child: RichEditor(
            // key: keyEditor,
            value: 'initial html here',
            editorOptions: RichEditorOptions(
              placeholder: 'Start typing',
              // backgroundColor: Colors.blueGrey, // Editor's bg color
              // baseTextColor: Colors.white,
              // editor padding
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              // font name
              baseFontFamily: 'sans-serif',
              // Position of the editing bar (BarPosition.TOP or BarPosition.BOTTOM)
              barPosition: BarPosition.TOP,
            ),
            // You can return a Link (maybe you need to upload the image to your
            // storage before displaying in the editor or you can also use base64
            getImageUrl: (image) {
              String link =
                  'https://avatars.githubusercontent.com/u/24323581?v=4';
              String base64 = base64Encode(image.readAsBytesSync());
              String base64String = 'data:image/png;base64, $base64';
              return base64String;
            },
          ),
        )
      ],
    ));
  }
}

class QuillEditorWidget extends ConsumerStatefulWidget {
  ConsumerState<QuillEditorWidget> createState() => _QuillEditorWidgetState();
}

class _QuillEditorWidgetState extends ConsumerState<QuillEditorWidget> {
  QuillController _controller = QuillController.basic();
  @override
  Widget build(BuildContext context) {
    var postController = ref.watch(postViewModel);
    var theme = Theme.of(context);
    var themeProvider = ref.watch(themeViewModel).themeMode;
    return postController.isCreatingPost?SuccessLoadingScreen(informationText: 'Publishing Post'): Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBars.mainAppBar(
          context,
          backgroundColor: Colors.white,
          arrowBackColor: theme.colorScheme.primary,
        ),
        body: SafeArea(
          child: Column(
            children: [
              QuillToolbar.simple(
                configurations: QuillSimpleToolbarConfigurations(
                  controller: postController.quillController,
                  showInlineCode: false,
                  showBackgroundColorButton: false,
                  showListCheck: false,
                  showCodeBlock: false,
                  showQuote: false,
                  showSearchButton: false,
                  showSubscript: false,
                  showSuperscript: false,
                  showFontFamily: false,
                  // showClearFormat: false,
                  sharedConfigurations: const QuillSharedConfigurations(
                    locale: Locale('en'),
                  ),
                ),
              ),
              Expanded(
                child: QuillEditor.basic(
                  configurations: QuillEditorConfigurations(
                    controller: postController.quillController,
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    // readOnly: false,
                    sharedConfigurations: const QuillSharedConfigurations(
                      locale: Locale('en'),
                    ),
                  ),
                ),
              ),
              SizedBox(
                // width: screenWidth.w,
                height: 50.h,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DefaultButtonMain(
                        color: AppColors.kWhite,
                        borderColor: AppColors.kTextBlack,
                        borderRadius: 38.r,
                        height: 48.h,
                        width: 92.w,
                        fontFamily: monaSansFont,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        textColor: AppColors.kTextBlack,
                        text: back,
                        onPressed: () {
                          setState(() {
                            navigateBack(context);
                          });
                        },
                      ),

                      DefaultButtonMain(
                          color: AppColors.kPrimary1,
                          borderRadius: 38.r,
                          height: 48.h,
                          width: 110.w,
                          fontFamily: monaSansFont,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          textColor: AppColors.kWhite,
                          text: 'Publish Post',
                          onPressed: () {
                            displayPostConfirmationDialog(context,
                                themeMode: themeProvider,
                                theme: theme, onPressed: () {
                              navigateBack(context);
                              ref.watch(postViewModel).createNewPost(context);
                            });
                            // ref.watch(listingViewModel).clearData();
                            // ref.watch(postViewModel).getQuillContent();
                            // setState(() {});
                          }),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}



class EditQuillEditorWidget extends ConsumerStatefulWidget {
  final String detail;
  const EditQuillEditorWidget({required this.detail, super.key});

  ConsumerState<EditQuillEditorWidget> createState() => _EditQuillEditorWidgetState();
}

class _EditQuillEditorWidgetState extends ConsumerState<EditQuillEditorWidget> {
  QuillController _controller = QuillController.basic();
  late final QuillController _editQuillController;

  @override
  void didChangeDependencies() {
    var postController = ref.watch(postViewModel);

    // postController.insertStringAtDocumentBeginning(widget.detail);

    // Convert HTML to Quill Delta and initialize the controller
    // var delta = htmlToQuillDelta('''<div>
    //   <p>This is a <b>bold</b> and <i>italic</i> text.</p>
    //   <p>Another paragraph.</p>
    // </div>''');
    // var doc = Document.fromDelta(delta);
    // _editQuillController= QuillController(document: doc, selection: const TextSelection.collapsed(offset: 0));

    super.didChangeDependencies();
  }

  // @override
  // void initState() {
  //   super.initState();
  //   var postController = ref.watch(postViewModel);
  //
  //
  // }
  @override
  Widget build(BuildContext context) {
    var postController = ref.watch(postViewModel);
    var theme = Theme.of(context);
    var themeProvider = ref.watch(themeViewModel).themeMode;
    return postController.isCreatingPost?SuccessLoadingScreen(informationText: 'Updating Post'): Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBars.mainAppBar(
          context,
          backgroundColor: Colors.white,
          arrowBackColor: theme.colorScheme.primary,
        ),
        body: SafeArea(
          child: Column(
            children: [
              QuillToolbar.simple(
                configurations: QuillSimpleToolbarConfigurations(
                  // controller: _editQuillController,
                  controller: postController.editQuillMainController!,
                  showInlineCode: false,
                  showBackgroundColorButton: false,
                  showListCheck: false,
                  showCodeBlock: false,
                  showQuote: false,
                  showSearchButton: false,
                  showSubscript: false,
                  showSuperscript: false,
                  showFontFamily: false,
                  // showClearFormat: false,
                  sharedConfigurations: const QuillSharedConfigurations(
                    locale: Locale('en'),
                  ),
                ),
              ),
              Expanded(
                child: QuillEditor.basic(
                  configurations: QuillEditorConfigurations(
                    controller: postController.editQuillMainController!,
                    // controller: _editQuillController,
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    // readOnly: false,
                    sharedConfigurations: const QuillSharedConfigurations(
                      locale: Locale('en'),
                    ),
                  ),
                ),
              ),
              SizedBox(
                // width: screenWidth.w,
                height: 50.h,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DefaultButtonMain(
                        color: AppColors.kWhite,
                        borderColor: AppColors.kTextBlack,
                        borderRadius: 38.r,
                        height: 48.h,
                        width: 92.w,
                        fontFamily: monaSansFont,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        textColor: AppColors.kTextBlack,
                        text: back,
                        onPressed: () {
                          setState(() {
                            navigateBack(context);
                          });
                        },
                      ),

                      DefaultButtonMain(
                          color: AppColors.kPrimary1,
                          borderRadius: 38.r,
                          height: 48.h,
                          width: 110.w,
                          fontFamily: monaSansFont,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          textColor: AppColors.kWhite,
                          text: 'Edit Post',
                          onPressed: () {
                            displayPostConfirmationDialog(context,
                                themeMode: themeProvider,
                                theme: theme, onPressed: () {
                                  navigateBack(context);
                                  ref.watch(postViewModel).updatePost(context, slug: postController.slug.toString());
                                });
                            // ref.watch(listingViewModel).clearData();
                            // ref.watch(postViewModel).getQuillContent();
                            // setState(() {});
                          }),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }

  // Function to convert HTML to Quill Delta
  Delta htmlToQuillDelta(String html) {
    var delta = Delta();
    var document = htmlParser.parse(html);
    var body = document.body;

    if (body != null) {
      body.nodes.forEach((node) {
        if (node is dom.Text) {
          delta.insert(node.text);
        } else if (node is dom.Element) {
          switch (node.localName) {
            case 'b':
            case 'strong':
              delta.insert(node.text, {'bold': true});
              break;
            case 'i':
            case 'em':
              delta.insert(node.text, {'italic': true});
              break;
          // Add more cases as needed for other HTML tags
            default:
              delta.insert(node.text);
              break;
          }
        }
      });
    }

    return delta;
  }


}