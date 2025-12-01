import 'package:sync_mobile/constants/app_colors.dart';
import 'package:get/get.dart';
import 'package:sync_mobile/config/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:sync_mobile/constants/user_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(UserController()); // Add this line

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: kbackground,
      ),
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      initialRoute: AppLinks.splash_screen,
      getPages: AppRoutes.pages,
      defaultTransition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
    );
  }
}
