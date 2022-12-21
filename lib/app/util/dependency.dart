import 'package:base_source_getx/data/repositories/article_repository.dart';
import 'package:base_source_getx/data/repositories/auth_repository.dart';
import 'package:get/get.dart';

class DependencyCreator {
  static void init() {
    Get.lazyPut(() => AuthenticationRepositoryIml());
    Get.lazyPut(() => ArticleRepositoryIml());
  }
}
