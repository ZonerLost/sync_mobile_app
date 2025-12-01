import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:sync_mobile/constants/app_colors.dart';
import 'package:sync_mobile/views/screens/auth/login.dart';
import 'package:sync_mobile/views/screens/launch/splash/onboarding.dart';
import 'package:sync_mobile/views/widget/common_image_view_widget.dart';
import 'package:sync_mobile/views/widget/custom_animated_column.dart';
import 'package:sync_mobile/views/widget/my_text_widget.dart';
import '../../../../generated/assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Using GetX delayed navigation
    Future.delayed(const Duration(seconds: 4), () {
      Get.off(() => const OnBoardingScreen()); // Replace current screen
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 40.0),
            child: MyText(
              text: 'Powered by Syncmobile-AS',
              color: kPrimaryColor,
              size: 16,
              weight: FontWeight.w400,
            ),
          ),
        ],
      ),
      backgroundColor: kbackground,
      body: AnimatedColumn(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Animate(
              effects: const [
                MoveEffect(
                  duration: Duration(milliseconds: 500),
                  begin: Offset(0, 20),
                ),
              ],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CommonImageView(
                    imagePath: Assets.imagesLogoSplash,
                    height: 150,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
