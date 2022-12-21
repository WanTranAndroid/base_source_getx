import 'package:base_source_getx/presentation/controllers/auth/auth_binding.dart';
import 'package:base_source_getx/presentation/pages/home/home_page.dart';
import 'package:get/get.dart';

class Routes {
  static const HOME = '/home';
}

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      binding: AuthBinding(),
      transition: Transition.fadeIn,
    ),
  ];
}
