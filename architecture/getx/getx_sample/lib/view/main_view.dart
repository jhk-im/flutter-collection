import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_sample/component/drawer_widget.dart';
import 'package:getx_sample/controller/main_controller.dart';
import 'package:getx_sample/route/route_info.dart';

class MainView extends GetView<MainController> {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(controller.title.value)),
      ),
      body: SafeArea(
        child: PageTransitionSwitcher(
          transitionBuilder: (Widget child, Animation<double> anim, Animation<double> secondaryAnimation) {
            return FadeThroughTransition(animation: anim, secondaryAnimation: secondaryAnimation, child: child,);
          },
          child: Obx(() => RouteInfo.navBarPages[controller.navBarIndex.value]),
        ),
      ),
      drawer: const DrawerWidget(),
      bottomNavigationBar: Obx(() => NavigationBar(
        selectedIndex: controller.navBarIndex.value,
        onDestinationSelected: controller.onChangeNavBar,
        destinations: [
          NavigationDestination(icon: const Icon(Icons.home_filled), label: 'navBar.home'.tr),
          NavigationDestination(icon: const Icon(Icons.list_alt), label: 'navBar.post'.tr),
          NavigationDestination(icon: const Icon(Icons.photo), label: 'navBar.photo'.tr),
        ],
      )),
    );
  }
}
