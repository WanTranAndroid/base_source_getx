import 'package:base_source_getx/app/config/theme.dart';
import 'package:base_source_getx/app/lang/translate_service.dart';
import 'package:base_source_getx/app/routes/routes.dart';
import 'package:base_source_getx/presentation/shared/reponsive_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return ResponsiveApp(
          builder: () {
            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              builder: (context, child) {
                return MediaQuery(
                  data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                  child: child!,
                );
              },
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                DefaultCupertinoLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                RefreshLocalizations.delegate,
              ],
              theme: appThemeData,
              fallbackLocale: TranslationService.fallbackLocale,
              locale: TranslationService.locale,
              translations: TranslationService(),
              getPages: AppPages.pages,
              initialRoute: Routes.HOME,
              defaultTransition: Transition.fadeIn,
            );
          },
        );
      },
    );
  }
}
