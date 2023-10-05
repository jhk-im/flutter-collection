import 'package:get/get.dart';
import 'package:getx_sample/controller/main_controller.dart';

class InitBind implements Bindings {

  @override
  void dependencies() {
    Get.put(MainController());
  }
}