// ignore_for_file: prefer_const_constructors
import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sync_mobile/constants/app_colors.dart';
import 'package:sync_mobile/generated/assets.dart';
import 'package:sync_mobile/views/screens/auth/otp.dart';
import 'package:sync_mobile/views/screens/bottomsheets/bottom_sheets.dart';
import 'package:sync_mobile/views/widget/common_image_view_widget.dart';
import 'package:sync_mobile/views/widget/custom_animated_column.dart';
import 'package:sync_mobile/views/widget/custom_checkbox_widget.dart';
import 'package:sync_mobile/views/widget/custom_dropdown.dart';
import 'package:sync_mobile/views/widget/my_button_new.dart';
import 'package:sync_mobile/views/widget/my_text_widget.dart';
import 'package:sync_mobile/views/widget/my_textfeild.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final FocusNode _focusNodeEmail = FocusNode();

  final TextEditingController _emailController = TextEditingController();

  bool get _isButtonActive => _emailController.text.trim().isNotEmpty;
  bool _agreeToTerms = false;

  @override
  void dispose() {
    _focusNodeEmail.dispose();

    _emailController.dispose();
    _agreeToTerms;

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Terms Checkbox
              MyButton(
                onTap: () {
                  emailSendBottomSheet(context);
                },

                fontSize: 18,
                radius: 30,
                height: 60,
                buttonText: "Send verification link",
                hasiconRight: true,
                isRight: true,
                choiceIconRight: Assets.imagesRightArrowUpdate,
                backgroundColor:
                    _isButtonActive ? kPrimaryColor : kPrimaryColor50,
                fontColor: Colors.white,
                hasgrad: false,
              ),
              Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyText(
                    text: "Back to ",
                    size: 16,
                    color: kSubText2,
                    weight: FontWeight.w600,
                  ),

                  Bounce(
                    onTap: () {
                      Get.back(); // Go back to Login
                    },
                    child: MyText(
                      text: "Login",
                      size: 16,
                      color: kPrimaryColor,
                      weight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Gap(20),
            ],
          ),
        ),
        body: AnimatedListView(
          physics: BouncingScrollPhysics(),
          padding: const EdgeInsets.all(16),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                      text: "Forgot Password",
                      size: 24,
                      color: kFontText,
                      textAlign: TextAlign.center,

                      weight: FontWeight.w700,
                    ),
                    Gap(8),
                    MyText(
                      text:
                          "Please enter the email address you used during registration.",
                      size: 14,
                      paddingLeft: 10,
                      paddingRight: 10,
                      color: kSubText2,
                      textAlign: TextAlign.center,
                      weight: FontWeight.w500,
                    ),
                  ],
                ),
                Gap(32),

                // Email Address
                // Email Field
                MyTextField(
                  hint: "Email address",
                  hintColor: kBlack,
                  controller: _emailController,
                  alwaysShowLabel: true,
                  focusNode: _focusNodeEmail,
                  radius: 24,
                  suffix: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child:
                        _emailController.text.trim().isNotEmpty
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
                                size: 18,
                              ),
                            )
                            : CommonImageView(
                              imagePath: Assets.imagesEmail,
                              height: 20,
                              width: 20,
                            ),
                  ),
                  onChanged: (value) => setState(() {}),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
