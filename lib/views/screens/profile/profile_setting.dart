import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sync_mobile/constants/app_colors.dart';
import 'package:sync_mobile/generated/assets.dart';
import 'package:sync_mobile/views/screens/bottomsheets/bottom_sheets.dart';
import 'package:sync_mobile/views/screens/profile/change_password.dart';
import 'package:sync_mobile/views/screens/profile/edit_profile.dart';
import 'package:sync_mobile/views/screens/profile/language.dart';
import 'package:sync_mobile/views/widget/app_bar.dart';
import 'package:sync_mobile/views/widget/common_image_view_widget.dart';
import 'package:sync_mobile/views/widget/drawer.dart';
import 'package:sync_mobile/views/widget/my_text_widget.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const CustomDrawer(),
      body: Column(
        children: [
          // Header
          CustomAppBar(
            showWelcomeText: false,
            showUserName: true,
            showMenuButton: true,
            centerUserInfo: false, // Text aligns with menu button
            showNotificationButton: false,
            showSearchField: false,
            showMapToggle: false,

            userName: "User Profile",
            onMenuTap: () => _scaffoldKey.currentState?.openDrawer(),
          ),

          // Profile Card
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(width: 40),
                          // Profile Image
                          CommonImageView(
                            imagePath: Assets.imagesChatAvatar,
                            height: 60,
                          ), // Edit Icon
                          Bounce(
                            onTap: () {
                              Get.to(() => EditProfileScreen());
                            },
                            child: CommonImageView(
                              imagePath: Assets.imagesEdit,
                              height: 44,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      MyText(
                        text: 'Christopher Henry',

                        size: 16,
                        color: kBlack,
                        weight: FontWeight.w600,
                      ),

                      const SizedBox(height: 8),
                      MyText(
                        text: 'christopherhenry34@gmail.com',

                        size: 14,
                        color: kSubText2,
                        weight: FontWeight.w400,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                // Settings Label
                Align(
                  alignment: Alignment.centerLeft,
                  child: MyText(
                    text: 'SETTINGS',
                    size: 14,
                    letterSpacing: 1,
                    color: kSubText2,
                    weight: FontWeight.w400,
                  ),
                ),

                const SizedBox(height: 12),

                _buildSettingItem(
                  icon: Assets.imagesPasswordKey,
                  title: 'Change Password',

                  onTap: () {
                    Get.to(() => ChangePasswordScreen());
                  },
                ),
                _buildSettingItem(
                  icon: Assets.imagesGlobal,
                  title: 'Language',

                  onTap: () {
                    Get.to(() => LanguageScreen());
                  },
                ),

                _buildSettingItem(
                  icon: Assets.imagesLogout2,
                  title: 'Logout',

                  onTap: () {
                    LogoutBottomSheet(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingItem({
    required String icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return Bounce(
      onTap: onTap,

      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 4,
          ),
          title: Row(
            spacing: 6,
            children: [
              CommonImageView(imagePath: icon, height: 40),
              MyText(
                text: title,

                size: 16,
                color: kBlack,
                weight: FontWeight.w500,
              ),
            ],
          ),

          trailing: const Icon(Icons.chevron_right, color: kBlack, size: 24),
        ),
      ),
    );
  }
}
