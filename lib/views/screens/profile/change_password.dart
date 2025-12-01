// ignore_for_file: prefer_const_constructors
import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sync_mobile/constants/app_colors.dart';
import 'package:sync_mobile/generated/assets.dart';
import 'package:sync_mobile/views/widget/app_bar.dart';
import 'package:sync_mobile/views/widget/common_image_view_widget.dart';
import 'package:sync_mobile/views/widget/my_button_new.dart';
import 'package:sync_mobile/views/widget/my_text_widget.dart';
import 'package:sync_mobile/views/widget/my_textfeild.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController _currentCtrl = TextEditingController(
    text: "Test19970000",
  );
  final TextEditingController _newCtrl = TextEditingController(
    text: "Test19970000",
  );
  final TextEditingController _confirmCtrl = TextEditingController(
    text: "Test19970000",
  );

  final FocusNode _focusCurrent = FocusNode();
  final FocusNode _focusNew = FocusNode();
  final FocusNode _focusConfirm = FocusNode();

  @override
  void dispose() {
    _currentCtrl.dispose();
    _newCtrl.dispose();
    _confirmCtrl.dispose();
    _focusCurrent.dispose();
    _focusNew.dispose();
    _focusConfirm.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MyButton(
              height: 60,
              buttonText: "Update",
              onTap: () {},
              backgroundColor: kPrimaryColor,
              fontColor: kWhite,
              radius: 30,
              hasiconRight: true,
              isRight: true,
              choiceIconRight: Assets.imagesRightArrowUpdate,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
            const Gap(50),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(
            showWelcomeText: false,
            showUserName: true,
            showMenuButton: true,

            centerUserInfo: false, // Text aligns with menu button
            showNotificationButton: false,
            showSearchField: false,
            showMapToggle: false,
            menuIcon: Assets.imagesBgBack,
            userName: "Change Password",
            onMenuTap: () => Get.back(),
          ),

          // Profile Photo Section
          ListView(
            padding: EdgeInsets.all(20),
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            children: [
              Gap(20),
              // Current Password
              MyTextField(
                label: "Current Password",
                labelColor: kSubText2,
                hint: "Current Password",
                hintColor: kBlack.withOpacity(0.4),
                controller: _currentCtrl,
                focusNode: _focusCurrent,
                suffix: CommonImageView(
                  imagePath: Assets.imagesEye,
                  height: 20,
                  width: 20,
                ),
                radius: 25,
                isObSecure: true,
                onChanged: (_) => setState(() {}),
              ),
              const Gap(20),

              // New Password
              MyTextField(
                label: "Create new password",
                labelColor: kSubText2,
                hint: "Create new password",
                hintColor: kBlack.withOpacity(0.4),
                controller: _newCtrl,
                focusNode: _focusNew,
                radius: 25,
                suffix: CommonImageView(
                  imagePath: Assets.imagesEye,
                  height: 20,
                  width: 20,
                ),
                isObSecure: true,
                onChanged: (_) => setState(() {}),
              ),
              const Gap(20),

              // Confirm New Password
              MyTextField(
                label: "Confirm new password",
                labelColor: kSubText2,
                hint: "Confirm new password",
                hintColor: kBlack.withOpacity(0.4),
                controller: _confirmCtrl,
                focusNode: _focusConfirm,
                suffix: CommonImageView(
                  imagePath: Assets.imagesEye,
                  height: 20,
                  width: 20,
                ),
                radius: 25,
                isObSecure: true,
                onChanged: (_) => setState(() {}),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
