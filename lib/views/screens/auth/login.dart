// ignore_for_file: prefer_const_constructors

import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sync_mobile/constants/app_colors.dart';
import 'package:sync_mobile/generated/assets.dart';
import 'package:sync_mobile/views/screens/auth/forgot_password.dart';
import 'package:sync_mobile/views/screens/auth/role_selection.dart';
import 'package:sync_mobile/views/widget/common_image_view_widget.dart';
import 'package:sync_mobile/views/widget/custom_animated_column.dart';
import 'package:sync_mobile/views/widget/custom_checkbox_widget.dart';
import 'package:sync_mobile/views/widget/my_button_new.dart';
import 'package:sync_mobile/views/widget/my_text_widget.dart';
import 'package:sync_mobile/views/widget/my_textfeild.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FocusNode _focusNodeEmail = FocusNode();
  final FocusNode _focusNodePassword = FocusNode();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool get _isButtonActive =>
      _emailController.text.trim().isNotEmpty &&
      _passwordController.text.trim().isNotEmpty;

  @override
  void dispose() {
    _focusNodeEmail.dispose();
    _focusNodePassword.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_focusNodeEmail.hasFocus || _focusNodePassword.hasFocus) {
          _focusNodeEmail.unfocus();
          _focusNodePassword.unfocus();
        }
      },
      child: Scaffold(
        body: AnimatedListView(
          physics: BouncingScrollPhysics(),
          padding: const EdgeInsets.all(20),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Gap(100),
                CommonImageView(
                  imagePath: Assets.imagesLogoSimple,
                  height: 100,
                ),
                Gap(24),
                MyText(
                  text: "Login to your account",
                  size: 24,
                  color: kFontText,
                  weight: FontWeight.w600,
                ),
                const Gap(8),
                MyText(
                  text: "Please enter your credentials to get started.",
                  size: 14,
                  color: kSubText2,
                  weight: FontWeight.w500,
                ),
                const Gap(24),

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

                // Password Field
                MyTextField(
                  hint: "Password",
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

                // Forgot Password
                Align(
                  alignment: Alignment.centerRight,
                  child: Bounce(
                    onTap: () {
                      Get.to(() => ForgotPasswordScreen());
                    },
                    child: MyText(
                      text: "Forgot Password?",
                      size: 16,
                      letterSpacing: 0.5,
                      color: kPrimaryColor,
                      weight: FontWeight.w600,
                    ),
                  ),
                ),
                const Gap(22),
                CustomCheckbox(
                  text: "Keep me sign in",
                  textcolor: kBlack,
                  onChanged: (value) {
                    // Handle checkbox state change if needed
                  },
                ),
                Gap(10),
                MyButton(
                  onTap: () {
                    Get.to(() => RoleSelectionScreen());
                  },
                  fontSize: 18,
                  radius: 24,
                  height: 60,
                  buttonText: "Continue",
                  hasiconRight: true,
                  isRight: true,
                  choiceIconRight: Assets.imagesRightArrowUpdate,

                  backgroundColor:
                      _isButtonActive ? kPrimaryColor : kPrimaryColor50,
                  fontColor: Colors.white,
                  hasgrad: false,
                ),
                const Gap(40),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
