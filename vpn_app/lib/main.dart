//** MAIN */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn_app/core/routes/pages.dart';
import 'package:vpn_app/core/routes/routes.dart';
import 'package:vpn_app/core/theme/theme_controller.dart';

Future<void> main() async {
  Get.put(ThemeController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    return Obx(
      () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.INITIAL,
        getPages: AppPages.routes,
        title: 'VPN App',
        theme: themeController.currentTheme,
      ),
    );
  }
}

//** WITH DEVICE PREVIEW */
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:device_preview/device_preview.dart';
// import 'package:vpn_app/core/routes/routes.dart';
// import 'package:vpn_app/core/routes/pages.dart';
// import 'package:vpn_app/core/theme/theme_controller.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   Get.put(ThemeController());

//   runApp(DevicePreview(enabled: true, builder: (context) => const MyApp()));
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final ThemeController themeController = Get.find();

//     return Obx(
//       () => GetMaterialApp(
//         useInheritedMediaQuery: true,
//         debugShowCheckedModeBanner: false,
//         locale: DevicePreview.locale(context),
//         builder: DevicePreview.appBuilder,
//         initialRoute: AppRoutes.INITIAL,
//         getPages: AppPages.routes,
//         title: 'VPN App',
//         theme: themeController.currentTheme,
//       ),
//     );
//   }
// }
