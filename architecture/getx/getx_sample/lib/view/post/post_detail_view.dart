import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_sample/view/post/post_controller.dart';

class PostDetailView extends GetView<PostController> {
  const PostDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('title.post.detail'.tr),
      ),
      body: SafeArea(
        child: _detail(),
      ),
    );
  }

  Widget _detail() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            controller.postDetail.value.title,
            style: TextStyle(
              color: Get.theme.colorScheme.primary,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(height: 48),
          Text(controller.postDetail.value.body),
        ],
      ),
    );
  }
}
