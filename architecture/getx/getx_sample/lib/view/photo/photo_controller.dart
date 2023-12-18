import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_sample/common/code_info.dart';
import 'package:getx_sample/common/const.dart';
import 'package:getx_sample/data/dao/photo_dao.dart';
import 'package:getx_sample/data/dto/photo_bean.dart';

class PhotoController extends GetxController {

  RxBool isLoading = false.obs;

  RxList<PhotoBean> photos = <PhotoBean>[].obs;

  @override
  void onInit() {
    super.onInit();

    _getPhotos();
  }

  onRefresh() {
    _getPhotos();
  }

  Future<void> _getPhotos() async {
    isLoading(true);

    try {
      Map<String, dynamic> result = await PhotoDao.to.getPhotos();
      CodeInfo code = result[gResultCode];

      if (code == CodeInfo.ok) {
        List<PhotoBean> list = result[gResultList];
        photos.clear();
        photos.addAll(list);
      }
    } catch(e) {
      e.printError();
    }

    isLoading(false);
  }

  showPhoto(int index) {
    Get.dialog(
      AlertDialog(
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(photos[index].downloadUrl),
            const SizedBox(height: 16.0),
            const Icon(Icons.person),
            Text(photos[index].author),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text('btn.close'.tr),
          ),
        ],
      ),
    );
  }
}