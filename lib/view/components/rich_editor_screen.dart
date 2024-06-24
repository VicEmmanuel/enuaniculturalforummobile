import 'dart:convert';

import 'package:enuaniculturalforummobile/src/config.dart';
import 'package:enuaniculturalforummobile/view_model/posts/post_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_quill/flutter_quill.dart';
import 'package:rich_editor/rich_editor.dart';

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
    return Scaffold(
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
                controller: _controller,
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                // readOnly: false,
                sharedConfigurations: const QuillSharedConfigurations(
                  locale: Locale('en'),
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
