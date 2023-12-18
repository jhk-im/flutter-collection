import 'package:get/get.dart';

class MainController extends GetxController {

  RxString title = 'title'.tr.obs;

  RxInt navBarIndex = 0.obs;

  onChangeNavBar(int index) {
    if (navBarIndex.value != index) {
      navBarIndex(index);
      switch(index) {
        case 1: title('title.post'.tr); break;
        case 2: title('title.photo'.tr); break;
        default : title('title'.tr);
      }
    }
  }
}