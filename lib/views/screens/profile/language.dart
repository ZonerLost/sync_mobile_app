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
import 'package:bounce/bounce.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String _selected = "en"; // default English

  final List<Map<String, dynamic>> _langs = [
    {"code": "en", "flag": "🇬🇧", "name": "English"},
    {"code": "de", "flag": "🇩🇪", "name": "German"},
    {"code": "zh", "flag": "🇨🇳", "name": "Chinese"},
    {"code": "nl", "flag": "🇳🇱", "name": "Dutch"},
    {"code": "fr", "flag": "🇫🇷", "name": "French"},
    {"code": "ar", "flag": "🇸🇦", "name": "Arabic"},
  ];

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
            userName: "Language",
            onMenuTap: () => Get.back(),
          ),

          // Language List
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.all(20),
              shrinkWrap: true,
              itemCount: _langs.length,
              separatorBuilder: (_, __) => const Gap(12),
              itemBuilder: (_, i) {
                final lang = _langs[i];
                final bool isSelected = _selected == lang["code"];
                return Bounce(
                  onTap: () => setState(() => _selected = lang["code"]),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 10,
                    ),
                    decoration: BoxDecoration(
                      color: kWhite,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        MyText(
                          text: lang["flag"],
                          size: 32,
                          color: kBlack,
                          weight: FontWeight.w500,
                        ),

                        const Gap(16),
                        MyText(
                          text: lang["name"],
                          size: 16,
                          color: kBlack,
                          weight: FontWeight.w500,
                        ),
                        const Spacer(),
                        if (isSelected)
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: const Icon(
                              Icons.check_circle,
                              color: kgreenColor,
                              size: 24,
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
