import 'package:base_source_getx/data/repositories/article_repository.dart';
import 'package:base_source_getx/domain/usecases/fetch_news_use_case.dart';
import 'package:base_source_getx/presentation/controllers/news/news_controller.dart';
import 'package:get/get.dart';

class NewsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FetchNewsUseCase(Get.find<ArticleRepositoryIml>()));
    Get.lazyPut(() => NewsController(Get.find()));
  }
}
