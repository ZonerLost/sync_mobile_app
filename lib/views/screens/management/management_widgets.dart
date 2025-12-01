import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sync_mobile/constants/app_colors.dart';
import 'package:sync_mobile/views/widget/my_text_widget.dart';

class LocksmithDetailsCard extends StatelessWidget {
  final String name;
  final String email;
  final String phoneNumber;
  final String status;
  final Color statusColor;
  final Color? avatarBackgroundColor;
  final VoidCallback? onTap;

  const LocksmithDetailsCard({
    super.key,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.status,
    this.statusColor = kPrimaryColor,
    this.avatarBackgroundColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Bounce(
      onTap: onTap ?? () {},
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: kWhite,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Row with Avatar, Name and Status
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Avatar and Name
                Row(
                  children: [
                    // Circular Avatar with Initial
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color:
                            avatarBackgroundColor ??
                            kPrimaryColor.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: MyText(
                          text: 'D',
                          size: 20,
                          weight: FontWeight.w600,
                          color: kPrimaryColor,
                        ),
                      ),
                    ),
                    Gap(12),
                    // Name
                    MyText(text: name, size: 18, weight: FontWeight.w600),
                  ],
                ),
                // Status Badge
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: MyText(
                    text: status,
                    size: 14,
                    color: statusColor,
                    weight: FontWeight.w600,
                  ),
                ),
              ],
            ),

            Gap(10),
            Divider(height: 1, color: kBlack200.withOpacity(0.2)),
            Gap(10),

            // Email and Phone Number Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Email Section
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      text: "Email address",
                      size: 14,
                      color: kBlack200,
                      weight: FontWeight.w400,
                    ),
                    Gap(5),
                    MyText(text: email, size: 14, weight: FontWeight.w500),
                  ],
                ),

                // Phone Number Section
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      text: "Phone number",
                      size: 14,
                      color: kBlack200,
                      weight: FontWeight.w400,
                    ),
                    Gap(5),
                    MyText(
                      text: phoneNumber,
                      size: 14,
                      weight: FontWeight.w500,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class LocksmithDetailsCard2 extends StatelessWidget {
  final String name;
  final String email;
  final String phoneNumber;
  final String status;
  final Color statusColor;
  final Color? avatarBackgroundColor;
  final VoidCallback? onTap;

  const LocksmithDetailsCard2({
    super.key,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.status,
    this.statusColor = kPrimaryColor,
    this.avatarBackgroundColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Bounce(
      onTap: onTap ?? () {},
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: kWhite,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Row with Avatar, Name and Status
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Avatar and Name
                Column(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Name
                    MyText(text: name, size: 16, weight: FontWeight.w600),
                    MyText(text: email, size: 14, weight: FontWeight.w400),
                  ],
                ),
                // Status Badge
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: MyText(
                    text: status,
                    size: 14,
                    color: statusColor,
                    weight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
