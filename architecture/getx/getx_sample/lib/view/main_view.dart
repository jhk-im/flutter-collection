import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_sample/controller/main_controller.dart';

class MainView extends GetView<MainController> {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(controller.title.value)),
      ),
      body: SafeArea(
        child: Container(),
      ),
    );
  }
}
