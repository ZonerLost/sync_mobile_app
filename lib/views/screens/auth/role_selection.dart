import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sync_mobile/constants/app_colors.dart';
import 'package:sync_mobile/constants/user_controller.dart';
import 'package:sync_mobile/views/screens/auth/login.dart';
import 'package:sync_mobile/views/screens/home/home.dart';
import 'package:sync_mobile/views/widget/common_image_view_widget.dart';
import 'package:sync_mobile/views/widget/my_button_new.dart';
import 'package:sync_mobile/views/widget/my_text_widget.dart';
import '../../../../generated/assets.dart';

class RoleSelectionScreen extends StatefulWidget {
  const RoleSelectionScreen({super.key});

  @override
  State<RoleSelectionScreen> createState() => _RoleSelectionScreenState();
}

class _RoleSelectionScreenState extends State<RoleSelectionScreen> {
  String _selectedRole = 'owner';
  final UserController userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 60, left: 0, right: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CommonImageView(
                  imagePath: Assets.imagesLogoHorizontal,
                  height: 45,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 150, left: 0, right: 0),
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  Assets.imagesOnbaordingBg,
                ), // Your image with card
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            bottom: 40,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
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
                  text: "Please Select your role to get started.",
                  size: 14,
                  textAlign: TextAlign.center,
                  color: kSubText2,
                  weight: FontWeight.w400,
                  letterSpacing: 0,
                ),
                const Gap(24),

                // Owner Role Container
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedRole = 'owner';
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: kWhite,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color:
                            _selectedRole == 'owner'
                                ? kPrimaryColor
                                : kSubText.withOpacity(0.3),
                        width: 2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: kBlack.withOpacity(0.1),
                          blurRadius: 8,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Radio<String>(
                          value: 'owner',
                          groupValue: _selectedRole,
                          onChanged: (value) {
                            setState(() {
                              _selectedRole = value!;
                            });
                          },
                          activeColor: kPrimaryColor,
                        ),
                        Gap(12),
                        MyText(
                          text: 'Owner',
                          size: 16,
                          weight: FontWeight.w600,
                          color: kBlack,
                        ),
                      ],
                    ),
                  ),
                ),

                Gap(16),

                // Engineer Role Container
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedRole = 'engineer';
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: kWhite,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color:
                            _selectedRole == 'engineer'
                                ? kPrimaryColor
                                : kSubText.withOpacity(0.3),
                        width: 2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: kBlack.withOpacity(0.1),
                          blurRadius: 8,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Radio<String>(
                          value: 'engineer',
                          groupValue: _selectedRole,
                          onChanged: (value) {
                            setState(() {
                              _selectedRole = value!;
                            });
                          },
                          activeColor: kPrimaryColor,
                        ),
                        Gap(12),
                        MyText(
                          text: 'Engineer',
                          size: 16,
                          weight: FontWeight.w600,
                          color: kBlack,
                        ),
                      ],
                    ),
                  ),
                ),

                Gap(40),

                // Continue Button
                MyButton(
                  onTap: () async {
                    await userController.saveUserRole(_selectedRole);
                    Get.offAll(() => HomeScreen(userRole: _selectedRole));
                  },
                  fontSize: 18,
                  radius: 24,
                  height: 60,
                  buttonText: "Continue",
                  hasiconRight: true,
                  isRight: true,
                  choiceIconRight: Assets.imagesRightArrowUpdate,

                  backgroundColor: kPrimaryColor,
                  fontColor: Colors.white,
                  hasgrad: false,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
