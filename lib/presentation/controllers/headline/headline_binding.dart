import 'package:base_source_getx/data/repositories/article_repository.dart';
import 'package:base_source_getx/domain/usecases/fetch_headline_use_case.dart';
import 'package:base_source_getx/presentation/controllers/headline/headline_controller.dart';
import 'package:get/get.dart';

class HeadlineBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FetchHeadlineUseCase(Get.find<ArticleRepositoryIml>()));
    Get.lazyPut(() => HeadlineController(Get.find()));
  }
}
