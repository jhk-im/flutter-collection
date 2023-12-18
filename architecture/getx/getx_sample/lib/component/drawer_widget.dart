import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const FlutterLogo(size: 32.0),
                const SizedBox(height: 8.0),
                Text(
                  'drawer.header'.tr,
                  style: const TextStyle(color: Colors.lightBlue),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: Text('drawer.profile'.tr),
          ),
          ListTile(
            leading: const Icon(Icons.message),
            title: Text('drawer.message'.tr),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: Text('drawer.setting'.tr),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.login),
            title: Text('drawer.login'.tr),
          )
        ],
      ),
    );
  }
}
