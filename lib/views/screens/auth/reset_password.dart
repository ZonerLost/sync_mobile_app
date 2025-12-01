// ignore_for_file: prefer_const_constructors
import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sync_mobile/constants/app_colors.dart';
import 'package:sync_mobile/generated/assets.dart';
import 'package:sync_mobile/views/screens/auth/login.dart';
import 'package:sync_mobile/views/screens/bottomsheets/bottom_sheets.dart';
import 'package:sync_mobile/views/widget/common_image_view_widget.dart';
import 'package:sync_mobile/views/widget/my_button_new.dart';
import 'package:sync_mobile/views/widget/my_text_widget.dart';
import 'package:sync_mobile/views/widget/my_textfeild.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final FocusNode _focusNodePassword = FocusNode();
  final FocusNode _focusNodeConfirmPassword = FocusNode();

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool get _isButtonActive =>
      _passwordController.text.trim().isNotEmpty &&
      _confirmPasswordController.text.trim().isNotEmpty &&
      _passwordController.text.trim() == _confirmPasswordController.text.trim();

  @override
  void dispose() {
    _focusNodePassword.dispose();
    _focusNodeConfirmPassword.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              MyButton(
                onTap: () {
                  Get.offAll(() => LoginScreen());
                },
                fontSize: 18,
                radius: 30,
                height: 60,
                buttonText: "Confirm",
                hasiconRight: true,
                isRight: true,
                choiceIconRight: Assets.imagesRightArrowUpdate,
                backgroundColor:
                    _isButtonActive ? kPrimaryColor : kPrimaryColor50,
                fontColor: Colors.white,
                hasgrad: false,
              ),
              Gap(40),
            ],
          ),
        ),
        body: ListView(
          physics: BouncingScrollPhysics(),
          padding: const EdgeInsets.all(16),
          children: [
            Gap(50),
            // Back Button
            Align(
              alignment: Alignment.centerLeft,
              child: Bounce(
                onTap: () => Get.back(),
                child: CommonImageView(
                  imagePath: Assets.imagesBack,
                  height: 50,
                ),
              ),
            ),
            Gap(20),
            Center(
              child: CommonImageView(
                imagePath: Assets.imagesLogoSimple,
                height: 100,
              ),
            ),
            Gap(24),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MyText(
                  text: "Reset Password",
                  size: 24,
                  color: kFontText,
                  textAlign: TextAlign.center,

                  weight: FontWeight.w700,
                ),
                Gap(8),
                MyText(
                  text:
                      "Please create your new password and try not to share with anyone.",
                  size: 14,
                  color: kSubText2,
                  textAlign: TextAlign.center,

                  weight: FontWeight.w500,
                ),
              ],
            ),
            Gap(32),

            // New Password Field
            MyTextField(
              hint: "Create new password",
              hintColor: kBlack,
              controller: _passwordController,
              isObSecure: true,
              focusNode: _focusNodePassword,
              radius: 24,
              suffix: Padding(
                padding: const EdgeInsets.all(12.0),
                child:
                    _passwordController.text.trim().isNotEmpty
                        ? Container(
                          width: 20,
                          height: 20,
                          decoration: const BoxDecoration(
                            color: kPrimaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 14,
                          ),
                        )
                        : CommonImageView(
                          imagePath: Assets.imagesEye,
                          height: 20,
                          width: 20,
                        ),
              ),
              onChanged: (value) => setState(() {}),
            ),

            // Confirm Password Field
            MyTextField(
              hint: "Confirm new password",
              hintColor: kBlack,
              controller: _confirmPasswordController,
              isObSecure: true,
              focusNode: _focusNodeConfirmPassword,
              radius: 24,
              suffix: Padding(
                padding: const EdgeInsets.all(12.0),
                child:
                    _confirmPasswordController.text.trim().isNotEmpty
                        ? (_confirmPasswordController.text.trim() ==
                                _passwordController.text.trim()
                            ? Container(
                              width: 20,
                              height: 20,
                              decoration: const BoxDecoration(
                                color: kPrimaryColor,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 14,
                              ),
                            )
                            : const Icon(
                              Icons.close,
                              color: Colors.red,
                              size: 20,
                            ))
                        : CommonImageView(
                          imagePath: Assets.imagesEye,
                          height: 20,
                          width: 20,
                        ),
              ),
              onChanged: (value) => setState(() {}),
            ),
          ],
        ),
      ),
    );
  }
}
