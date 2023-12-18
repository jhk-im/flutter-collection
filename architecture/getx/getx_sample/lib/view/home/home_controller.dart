import 'package:get/get.dart';

class HomeController extends GetxController {

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  Future<void> getData() async {
    isLoading(true);
    // get data
    isLoading(false);
  }
}