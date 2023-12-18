import 'package:get/get.dart';
import 'package:getx_sample/controller/main_controller.dart';
import 'package:getx_sample/view/home/home_controller.dart';
import 'package:getx_sample/view/photo/photo_controller.dart';
import 'package:getx_sample/view/post/post_controller.dart';

class InitBind implements Bindings {

  @override
  void dependencies() {
    Get.put(MainController());
    Get.put(HomeController());
    Get.put(PostController());
    Get.put(PhotoController());
  }
}