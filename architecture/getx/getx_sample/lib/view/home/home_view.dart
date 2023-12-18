import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_sample/common/const.dart';
import 'package:getx_sample/component/loading_widget.dart';
import 'package:getx_sample/view/home/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Card(
                  margin: const EdgeInsets.all(gMargin),
                  child: Padding(
                    padding: const EdgeInsets.all(gPadding),
                    child: Row(
                      children: [
                        Image.asset('assets/images/flutter.png', width: 24.0),
                        const SizedBox(width: 16),
                        Expanded(child: Text('home.card.1'.tr)),
                      ],
                    ),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.all(gMargin),
                  child: Padding(
                    padding: const EdgeInsets.all(gPadding),
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const FlutterLogo(),
                          const SizedBox(height: 16),
                          Text('home.card.2'.tr),
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.all(gMargin),
                  child: Padding(
                    padding: const EdgeInsets.all(gPadding),
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.flutter_dash, color: Colors.lightBlue,),
                          const SizedBox(height: 16),
                          Text('home.card.3'.tr),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Obx(() => LoadingWidget(controller.isLoading.value)),
          ],
        ),
      ),
    );
  }
}
