import 'package:base_source_getx/presentation/controllers/headline/headline_controller.dart';
import 'package:base_source_getx/presentation/pages/detail/detail_page.dart';
import 'package:base_source_getx/presentation/pages/headline/views/article_cell.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HeadlinePage extends GetView<HeadlineController> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return GetX(
      init: controller,
      initState: (state) {
        controller.fetchData();
      },
      didUpdateWidget: (old, newState) {
        _scrollController.addListener(_scrollListener);
      },
      dispose: (state) {
        _scrollController.removeListener(_scrollListener);
      },
      builder: (_) {
        return CupertinoPageScaffold(
          navigationBar: const CupertinoNavigationBar(
            middle: Text('Headline'),
          ),
          child: ListView.builder(
            controller: _scrollController,
            itemCount: controller.articles.length,
            itemBuilder: (context, index) {
              final article = controller.articles[index];
              return GestureDetector(
                onTap: () {
                  Get.to(() => DetailPage(article: article));
                },
                child: ArticleCell(article: article),
              );
            },
          ),
        );
      },
    );
  }

  void _scrollListener() {
    if (_scrollController.position.extentAfter < 500) {
      controller.loadMore();
    }
  }
}
