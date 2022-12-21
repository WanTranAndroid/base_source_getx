import 'package:base_source_getx/app/core/usecases/pram_usecase.dart';
import 'package:base_source_getx/domain/entities/paging.dart';
import 'package:base_source_getx/domain/repositories/article_repository.dart';
import 'package:tuple/tuple.dart';

class FetchNewsUseCase extends ParamUseCase<Paging, Tuple3<String, int, int>> {
  final ArticleRepository _repo;
  FetchNewsUseCase(this._repo);

  @override
  Future<Paging> execute(Tuple3 param) {
    return _repo.fetchNewsByCategory(param.item1, param.item2, param.item3);
  }
}
