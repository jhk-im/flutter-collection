import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_sample/component/loading_widget.dart';
import 'package:getx_sample/view/photo/photo_controller.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class PhotoView extends GetView<PhotoController> {
  const PhotoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            _photos(),
            Obx(() => LoadingWidget(controller.isLoading.value)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_a_photo_outlined),
        onPressed: () {
          Get.snackbar(
            'Add',
            'Photo',
            icon: const Icon(Icons.add_a_photo_outlined),
          );
        },
      ),
    );
  }

  Widget _photos() {
    return LiquidPullToRefresh(
      onRefresh: () async {
        controller.onRefresh();
      },
      child: Obx(() => GridView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.all(8.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: controller.photos.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              controller.showPhoto(index);
            },
            child: Card(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  controller.photos[index].downloadUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      )),
    );
  }
}
