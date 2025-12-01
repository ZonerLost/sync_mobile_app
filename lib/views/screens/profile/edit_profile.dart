// ignore_for_file: prefer_const_constructors
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

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController fullNameController = TextEditingController(
    text: "Chris Henry",
  );
  final TextEditingController emailController = TextEditingController(
    text: "christop234@gmail.com",
  );
  final TextEditingController phoneController = TextEditingController(text: "");

  final FocusNode _focusNodeName = FocusNode();
  final FocusNode _focusNodeEmail = FocusNode();
  final FocusNode _focusNodePhone = FocusNode();

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    _focusNodeName.dispose();
    _focusNodeEmail.dispose();
    _focusNodePhone.dispose();
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
            userName: "Edit Profile",
            onMenuTap: () => Get.back(),
          ),

          // Profile Photo Section
          ListView(
            padding: EdgeInsets.all(20),
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            children: [
              Gap(20),
              Center(
                child: Column(
                  children: [
                    CommonImageView(
                      imagePath: Assets.imagesUpload,
                      height: 120,
                      width: 120,
                    ),
                    const Gap(24),
                    MyText(
                      text: "Upload Profile Photo",
                      size: 18,
                      color: kBlack,
                      weight: FontWeight.w500,
                    ),
                    const Gap(12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        spacing: 20,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: MyButton(
                              buttonText: "Remove Photo",
                              onTap: () {},
                              hasgrad: false,

                              backgroundColor: kWhite,
                              fontColor: kSubText2,
                              radius: 12,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),

                          Expanded(
                            child: MyButton(
                              buttonText: "Change Photo",
                              onTap: () {},
                              hasgrad: false,
                              backgroundColor: kPrimaryColor.withOpacity(0.2),
                              fontColor: kPrimaryColor,
                              radius: 12,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const Gap(40),

              // Personal Information Section
              MyText(
                text: "PERSONAL INFORMATION",
                size: 12,

                color: kBlack.withOpacity(0.5),
                weight: FontWeight.w600,
                letterSpacing: 1.5,
              ),

              const Gap(20),

              // Full Name Field
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyTextField(
                    label: "Full name",
                    labelColor: kSubText2,
                    hint: "Full Name",
                    hintColor: kBlack.withOpacity(0.4),
                    controller: fullNameController,
                    focusNode: _focusNodeName,
                    radius: 25,
                    onChanged: (value) => setState(() {}),
                  ),
                ],
              ),

              MyTextField(
                label: "Email address",
                labelColor: kSubText2,
                hint: "Email address",
                hintColor: kBlack.withOpacity(0.4),
                controller: emailController,
                focusNode: _focusNodeEmail,
                radius: 25,
                onChanged: (value) => setState(() {}),
              ),

              // Phone Number Field
              MyTextField(
                label: "Phone number",
                labelColor: kSubText2,
                hint: "+41 12312323",
                hintColor: kBlack.withOpacity(0.4),
                controller: phoneController,
                focusNode: _focusNodePhone,
                radius: 25,
                onChanged: (value) => setState(() {}),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
