import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sync_mobile/constants/app_colors.dart';
import 'package:sync_mobile/views/screens/auth/login.dart';
import 'package:sync_mobile/views/widget/common_image_view_widget.dart';
import 'package:sync_mobile/views/widget/my_button_new.dart';
import 'package:sync_mobile/views/widget/my_text_widget.dart';
import '../../../../generated/assets.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

// class _OnBoardingScreenState extends State<OnBoardingScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Padding(
//             padding: EdgeInsets.only(top: 60, left: 0, right: 0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 CommonImageView(
//                   imagePath: Assets.imagesLogoHorizontal,
//                   height: 45,
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             margin: EdgeInsets.only(top: 150, left: 0, right: 0),
//             width: double.infinity,
//             height: double.infinity,
//             decoration: const BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage(
//                   Assets.imagesOnbaordingBg,
//                 ), // Your image with card
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           Positioned(
//             left: 20,
//             right: 20,
//             bottom: 40,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 MyText(
//                   text: "Welcome to Syncmobile-AS",
//                   size: 24,
//                   weight: FontWeight.w500,
//                   textAlign: TextAlign.center,
//                   color: kBlack,
//                 ),
//                 const SizedBox(height: 16),
//                 // Subtitle
//                 MyText(
//                   text: "Please enter the credentials to get started.",
//                   size: 14,
//                   textAlign: TextAlign.center,
//                   color: kSubText2,
//                   weight: FontWeight.w400,
//                   letterSpacing: 0,
//                 ),
//                 const Gap(24),
//                 // Buttons Column
//                 MyButton(
//                   buttonText: "Continue with email address",
//                   onTap: () {
//                     Get.offAll(() => LoginScreen());
//                   },
//                   backgroundColor: kPrimaryColor,
//                   hasgrad: false,
//                   height: 56,
//                   isactive: true,
//                   radius: 30,
//                   fontSize: 18,
//                   fontWeight: FontWeight.w600,
//                   fontColor: Colors.white,
//                 ),
//                 const Gap(16),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: Container(
//                         margin: const EdgeInsets.symmetric(horizontal: 12.0),
//                         height: 1,
//                         color: kDividerColor,
//                       ),
//                     ),
//                     MyText(
//                       text: 'or Sign in',
//                       size: 14,
//                       letterSpacing: 0.5,
//                       weight: FontWeight.w400,
//                       color: kSubText,
//                     ),
//                     Expanded(
//                       child: Container(
//                         margin: const EdgeInsets.symmetric(horizontal: 12.0),
//                         height: 1,
//                         color: kDividerColor,
//                       ),
//                     ),
//                   ],
//                 ),
//                 const Gap(16),
//                 // Login
//                 MyButton(
//                   buttonText: "Continue with Google",
//                   onTap: () {
//                     Get.offAll(() => LoginScreen());
//                   },
//                   backgroundColor: Colors.white,
//                   height: 56,
//                   radius: 30,
//                   hasgrad: false,
//                   isactive: true,
//                   hasicon: true,
//                   choiceIcon: Assets.imagesGoogle,
//                   fontSize: 18,
//                   fontWeight: FontWeight.w600,
//                   fontColor: kBlack,
//                 ),

//                 const SizedBox(height: 16),
//                 MyButton(
//                   buttonText: "Continue with Apple",
//                   onTap: () {
//                     Get.offAll(() => LoginScreen());
//                   },
//                   hasgrad: false,
//                   backgroundColor: kWhite,
//                   outlineColor: Colors.white,
//                   height: 56,
//                   radius: 30,
//                   fontSize: 18,
//                   hasicon: true,
//                   choiceIcon: Assets.imagesApple,
//                   fontWeight: FontWeight.w600,
//                   fontColor: kBlack,
//                 ),
//                 const SizedBox(height: 24),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     MyText(
//                       text: "Already have an Account?",
//                       size: 16,
//                       textAlign: TextAlign.center,
//                       color: kSubText2,
//                       weight: FontWeight.w500,
//                     ),
//                     MyText(
//                       text: " Login",
//                       size: 16,
//                       textAlign: TextAlign.center,
//                       color: kPrimaryColor,
//                       weight: FontWeight.w600,
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 50),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Spacer(),
            CommonImageView(imagePath: Assets.imagesLogoHorizontal, height: 70),
            Spacer(),
            Column(
              children: [
                MyText(
                  text: "Welcome to Syncmobile-AS",
                  size: 24,
                  weight: FontWeight.w500,
                  textAlign: TextAlign.center,
                  color: kBlack,
                ),
                const SizedBox(height: 16),
                // Subtitle
                MyText(
                  text: "Please enter the credentials to get started.",
                  size: 14,
                  textAlign: TextAlign.center,
                  color: kSubText2,
                  weight: FontWeight.w400,
                  letterSpacing: 0,
                ),
                const Gap(24),
                // Buttons Column
                MyButton(
                  buttonText: "Continue with email address",
                  onTap: () {
                    Get.offAll(() => LoginScreen());
                  },
                  backgroundColor: kPrimaryColor,
                  hasgrad: false,
                  height: 56,
                  isactive: true,
                  radius: 30,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  fontColor: Colors.white,
                ),
                const Gap(16),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 12.0),
                        height: 1,
                        color: kDividerColor,
                      ),
                    ),
                    MyText(
                      text: 'or Sign in',
                      size: 14,
                      letterSpacing: 0.5,
                      weight: FontWeight.w400,
                      color: kSubText,
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 12.0),
                        height: 1,
                        color: kDividerColor,
                      ),
                    ),
                  ],
                ),
                const Gap(16),
                // Login
                MyButton(
                  buttonText: "Continue with Google",
                  onTap: () {
                    Get.offAll(() => LoginScreen());
                  },
                  backgroundColor: Colors.white,
                  height: 56,
                  radius: 30,
                  hasgrad: false,
                  isactive: true,
                  hasicon: true,
                  choiceIcon: Assets.imagesGoogle,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  fontColor: kBlack,
                ),

                const SizedBox(height: 16),
                MyButton(
                  buttonText: "Continue with Apple",
                  onTap: () {
                    Get.offAll(() => LoginScreen());
                  },
                  hasgrad: false,
                  backgroundColor: kWhite,
                  outlineColor: Colors.white,
                  height: 56,
                  radius: 30,
                  fontSize: 18,
                  hasicon: true,
                  choiceIcon: Assets.imagesApple,
                  fontWeight: FontWeight.w600,
                  fontColor: kBlack,
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyText(
                      text: "Already have an Account?",
                      size: 16,
                      textAlign: TextAlign.center,
                      color: kSubText2,
                      weight: FontWeight.w500,
                    ),
                    MyText(
                      text: " Login",
                      size: 16,
                      textAlign: TextAlign.center,
                      color: kPrimaryColor,
                      weight: FontWeight.w600,
                    ),
                  ],
                ),
                const SizedBox(height: 50),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
