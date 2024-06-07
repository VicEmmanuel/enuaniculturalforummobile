import 'package:flutter/material.dart';

class PaginatedListView extends StatefulWidget {
  const PaginatedListView({
    ///   required this.loadMoreCallback,
    required this.itemBuilder,
    ///  required this.canLoadMore,
    this.itemCount,
    super.key,
  });
  // final void Function() loadMoreCallback;
  final Widget Function(BuildContext, int) itemBuilder;
  final int? itemCount;
//  final bool canLoadMore;

  @override
  State<PaginatedListView> createState() => _PaginatedListViewState();
}

class _PaginatedListViewState extends State<PaginatedListView> {
  // final ScrollController _scrollController = ScrollController();

  @override
  void initState() {

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      //controller: _scrollController,
      itemCount: widget.itemCount,
      itemBuilder: widget.itemBuilder,
    );
  }
}
