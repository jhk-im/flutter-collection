import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_sample/common/code_info.dart';
import 'package:getx_sample/common/const.dart';
import 'package:getx_sample/data/dao/post_dao.dart';
import 'package:getx_sample/data/dto/post_bean.dart';
import 'package:getx_sample/route/route_info.dart';

class PostController extends GetxController {

  RxBool isLoading = false.obs;

  RxList<PostBean> posts = <PostBean>[].obs;

  Rx<PostBean> postDetail = PostBean().obs;

  @override
  void onInit() {
    super.onInit();

    _getPosts();
  }

  onRefresh() {
    _getPosts();
  }

  Future<void> _getPosts() async {
    isLoading(true);

    try {
      Map<String, dynamic> result = await PostDao.to.getPosts();
      CodeInfo code = result[gResultCode];

      if (code == CodeInfo.ok) {
        List<PostBean> list = result[gResultList];
        posts.clear();
        posts.addAll(list);
      }
    } catch(e) {
      e.printError();
    }

    isLoading(false);
  }

  Future<void> toPostDetail(int id) async {
    isLoading(true);

    try {
      Map<String, dynamic> result = await PostDao.to.getPost(id);
      CodeInfo code = result[gResultCode];
      PostBean bean = result[gResultBean];

      if (code == CodeInfo.ok && bean.id >= 0) {
        postDetail(bean);
        Get.toNamed(RouteInfo.routePostDetail);
      } else {
        Get.snackbar(
          'error.info'.tr,
          'error.try'.tr,
          icon: const Icon(Icons.error),
        );
      }
    } catch(e) {
      Get.snackbar(
        'error.title'.tr,
        'error.try'.tr,
        icon: const Icon(Icons.error),
      );
    }

    isLoading(false);
  }
}