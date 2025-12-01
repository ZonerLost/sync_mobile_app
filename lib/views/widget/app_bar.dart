import 'package:bounce/bounce.dart';
import 'package:sync_mobile/constants/app_colors.dart';
import 'package:sync_mobile/generated/assets.dart';
import 'package:sync_mobile/views/screens/notifications/notifications.dart';
import 'package:sync_mobile/views/widget/common_image_view_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sync_mobile/views/widget/my_text_widget.dart';
import 'package:sync_mobile/views/widget/my_textfeild.dart';

class HeaderAppBar extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  final Widget? lastItem;
  final double? paddingTop;
  final double? paddingLeft;
  final double? paddingRight;
  final double? paddingBottom;

  const HeaderAppBar({
    super.key,
    required this.title,
    this.onTap,
    this.lastItem,
    this.paddingTop,
    this.paddingLeft,
    this.paddingRight,
    this.paddingBottom,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: paddingTop ?? 50,
        left: paddingLeft ?? 16,
        right: paddingRight ?? 16,
        bottom: paddingBottom ?? 16,
      ),
      child: Row(
        children: [
          Bounce(
            onTap: onTap ?? () => Get.back(),
            child: CommonImageView(
              imagePath: Assets.imagesBackArrowAppbar,
              height: 34,
            ),
          ),
          Expanded(
            child: MyText(
              text: title,
              size: 20,
              weight: FontWeight.w600,
              textAlign: TextAlign.center,
            ),
          ),
          lastItem ?? const Gap(24), // Keeps title centered if no last item
        ],
      ),
    );
  }
}

class CustomAppBar extends StatefulWidget {
  final bool showWelcomeText;
  final bool showUserName;
  final bool showMenuButton;
  final bool showNotificationButton;
  final bool showSearchField;
  final bool showMapToggle;
  final bool centerUserInfo;
  final Widget? customSearchSuffix;
  final String? welcomeText;
  final String? searchText;
  final String? userName;
  final String? menuIcon; // Customizable menu icon
  final String? notificationIcon; // Customizable notification icon
  final String? searchIcon; // Customizable search icon
  final VoidCallback? onMenuTap;
  final VoidCallback? onNotificationTap;
  final VoidCallback? onMapToggleTap;
  final Function(String)? onSearchChanged;
  final bool isMapView;

  const CustomAppBar({
    super.key,
    this.showWelcomeText = true,
    this.showUserName = true,
    this.showMenuButton = true,
    this.showNotificationButton = true,
    this.showSearchField = true,
    this.showMapToggle = true,
    this.centerUserInfo = true,
    this.welcomeText = "Welcome Back!",
    this.userName = "Christopher Henry",
    this.menuIcon, // If null, uses default
    this.notificationIcon, // If null, uses default
    this.searchIcon, // If null, uses default
    this.onMenuTap,
    this.onNotificationTap,
    this.onMapToggleTap,
    this.onSearchChanged,
    this.isMapView = false,
    this.searchText,
    this.customSearchSuffix,
  });

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
      color: kWhite,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Gap(50),
          Row(
            mainAxisAlignment:
                widget.centerUserInfo
                    ? MainAxisAlignment.spaceBetween
                    : MainAxisAlignment.start,
            children: [
              // Menu Button and User Info together when not centered
              if (!widget.centerUserInfo) ...[
                if (widget.showMenuButton)
                  Bounce(
                    onTap: widget.onMenuTap ?? () {},
                    child: CommonImageView(
                      imagePath: widget.menuIcon ?? Assets.imagesMenu,
                      height: 50,
                    ),
                  ),
                Gap(15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (widget.showWelcomeText)
                      MyText(
                        text: widget.welcomeText ?? "Welcome Back!",
                        size: 14,
                        color: kSubText,
                        weight: FontWeight.w500,
                      ),
                    if (widget.showUserName)
                      MyText(
                        text: widget.userName ?? "Christopher Henry",
                        size: 16,
                        weight: FontWeight.w600,
                      ),
                  ],
                ),
                Spacer(),
              ],

              // Centered layout (original)
              if (widget.centerUserInfo) ...[
                // Menu Button
                if (widget.showMenuButton)
                  Bounce(
                    onTap: widget.onMenuTap ?? () {},
                    child: CommonImageView(
                      imagePath: widget.menuIcon ?? Assets.imagesMenu,
                      height: 50,
                    ),
                  )
                else
                  SizedBox(width: 50),

                // Welcome and User Name (Centered)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (widget.showWelcomeText)
                      MyText(
                        text: widget.welcomeText ?? "Welcome Back!",
                        size: 14,
                        color: kSubText,
                        weight: FontWeight.w500,
                      ),
                    if (widget.showUserName)
                      MyText(
                        text: widget.userName ?? "Christopher Henry",
                        size: 16,
                        weight: FontWeight.w600,
                      ),
                  ],
                ),
              ],

              // Notification Button (always on the right)
              if (widget.showNotificationButton)
                Row(
                  spacing: 10,
                  children: [
                    Bounce(
                      onTap:
                          widget.onNotificationTap ??
                          () => Get.to(() => NotificationScreen()),
                      child: CommonImageView(
                        imagePath:
                            widget.notificationIcon ??
                            Assets.imagesNotificationBlack,
                        height: 50,
                      ),
                    ),
                  ],
                )
              else
                SizedBox(width: 50),
            ],
          ),

          if (widget.showSearchField) ...[
            Gap(20),
            MyTextField(
              backgroundColor: kbackground,
              hint: widget.searchText ?? "Search here...",
              hintColor: kSubText2,
              isObSecure: false,
              radius: 25,
              hintWeight: FontWeight.w400,
              prefix: CommonImageView(
                imagePath: widget.searchIcon ?? Assets.imagesMynauiSearch,
                height: 24,
              ),
              suffix:
                  widget.showMapToggle
                      ? Bounce(
                        onTap: widget.onMapToggleTap ?? () {},
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 20,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: kWhite,
                          ),
                          child: MyText(
                            text:
                                widget.isMapView
                                    ? "Back to List"
                                    : "Explore on Map",
                            size: 12,
                            weight: FontWeight.w600,
                          ),
                        ),
                      )
                      : widget.customSearchSuffix, // This is the only new line!
              onChanged: widget.onSearchChanged ?? (_) => setState(() {}),
            ),
          ],
        ],
      ),
    );
  }
}
