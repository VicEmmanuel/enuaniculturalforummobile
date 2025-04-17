import 'package:enuaniculturalforummobile/view_model/posts/post_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ViewAllBlogsScreen extends ConsumerStatefulWidget {
  const ViewAllBlogsScreen({super.key});

  @override
  ConsumerState<ViewAllBlogsScreen> createState() => _ViewAllBlogsScreenState();
}

class _ViewAllBlogsScreenState extends ConsumerState<ViewAllBlogsScreen> {
  @override
  void didChangeDependencies() {
    var postProvider = ref.watch(postViewModel);
    postProvider.getAllPosts(context);
    postProvider.getAllCategories(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
