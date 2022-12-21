import 'package:base_source_getx/app/core/usecases/pram_usecase.dart';
import 'package:base_source_getx/domain/entities/paging.dart';
import 'package:base_source_getx/domain/repositories/article_repository.dart';
import 'package:tuple/tuple.dart';

class FetchHeadlineUseCase extends ParamUseCase<Paging, Tuple2<int, int>> {
  final ArticleRepository _repo;
  FetchHeadlineUseCase(this._repo);

  @override
  Future<Paging> execute(Tuple2 param) {
    return _repo.fetchHeadline(param.item1, param.item2);
  }
}
