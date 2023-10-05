import 'package:get/get.dart';
import 'package:getx_sample/view/main_view.dart';

class RouteInfo {

  static const String routeRoot = '/';

  static List<GetPage> pages = [
    GetPage(name: routeRoot, page: () => const MainView())
  ];
}