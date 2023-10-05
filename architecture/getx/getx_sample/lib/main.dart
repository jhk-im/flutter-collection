import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_sample/bind/init_bind.dart';
import 'package:getx_sample/common/color_schemes.g.dart';
import 'package:getx_sample/common/translations_info.dart';
import 'package:getx_sample/route/route_info.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteInfo.routeRoot,
      initialBinding: InitBind(),
      getPages: RouteInfo.pages,
      defaultTransition: Transition.cupertino,
      translations: TranslationsInfo(),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
      themeMode: ThemeMode.system,
      theme: ThemeData(colorScheme: lightColorScheme, useMaterial3: true, fontFamily: 'NanumGothic'),
      darkTheme: ThemeData(colorScheme: darkColorScheme, useMaterial3: true, fontFamily: 'NanumGothic'),
    );
  }
}
