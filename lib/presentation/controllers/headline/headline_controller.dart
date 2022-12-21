import 'package:base_source_getx/domain/entities/article.dart';
import 'package:base_source_getx/domain/entities/paging.dart';
import 'package:base_source_getx/domain/usecases/fetch_headline_use_case.dart';
import 'package:get/get.dart';
import 'package:tuple/tuple.dart';

class HeadlineController extends GetxController {
  HeadlineController(this._fetchHeadlineUseCase);

  final FetchHeadlineUseCase _fetchHeadlineUseCase;
  int _currentPage = 1;
  final int _pageSize = 20;
  var _isLoadMore = false;
  final _paging = Rx<Paging?>(null);

  var articles = RxList<Article>([]);

  Future<void> fetchData() async {
    final newPaging = await _fetchHeadlineUseCase.execute(Tuple2(_currentPage, _pageSize));
    articles.assignAll(newPaging.articles);
    _paging.value = newPaging;
  }

  Future<void> loadMore() async {
    final totalResults = _paging.value?.totalResults ?? 0;
    if (totalResults / _pageSize <= _currentPage) return;
    if (_isLoadMore) return;
    _isLoadMore = true;
    _currentPage += 1;
    final newPaging = await _fetchHeadlineUseCase.execute(Tuple2(_currentPage, _pageSize));
    articles.addAll(newPaging.articles);
    _paging.value?.totalResults = newPaging.totalResults;
    _isLoadMore = false;
  }
}
