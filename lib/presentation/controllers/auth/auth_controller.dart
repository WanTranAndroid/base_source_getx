import 'package:base_source_getx/app/services/local_storage.dart';
import 'package:base_source_getx/domain/entities/user.dart';
import 'package:base_source_getx/domain/usecases/signup_use_case.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  AuthController(this._loginUseCase);

  final SignUpUseCase _loginUseCase;
  final store = Get.find<LocalStorageService>();
  var isLoggedIn = false.obs;

  User? get user => store.user;

  @override
  Future<void> onInit() async {
    super.onInit();
    isLoggedIn.value = store.user != null;
  }

  Future<void> signUpWith(String username) async {
    try {
      final user = await _loginUseCase.execute(username);
      store.user = user;
      isLoggedIn.value = true;
      isLoggedIn.refresh();
    } catch (error) {}
  }

  void logout() {
    store.user = null;
    isLoggedIn.value = false;
  }
}
