import 'package:base_source_getx/data/repositories/auth_repository.dart';
import 'package:base_source_getx/domain/usecases/signup_use_case.dart';
import 'package:base_source_getx/presentation/controllers/auth/auth_controller.dart';
import 'package:get/get.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpUseCase(Get.find<AuthenticationRepositoryIml>()));
    Get.put(AuthController(Get.find()), permanent: true);
  }
}
