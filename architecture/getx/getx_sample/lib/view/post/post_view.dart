import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_sample/component/loading_widget.dart';
import 'package:getx_sample/view/post/post_controller.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class PostView extends GetView<PostController> {
  const PostView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            _posts(),
            Obx(() => LoadingWidget(controller.isLoading.value)),
          ],
        ),
      )
    );
  }

  Widget _posts() {
    return LiquidPullToRefresh(
      onRefresh: () async {
        controller.onRefresh();
      },
      child: ListView.separated(
        itemCount: controller.posts.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              controller.toPostDetail(controller.posts[index].id);
            },
            child: ListTile(
              leading: const Icon(Icons.article_outlined),
              title: Text(controller.posts[index].title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => const Divider(),
      ),
    );
  }
}
