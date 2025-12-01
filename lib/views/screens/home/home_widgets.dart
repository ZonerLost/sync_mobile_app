import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sync_mobile/constants/app_colors.dart';
import 'package:sync_mobile/generated/assets.dart';
import 'package:sync_mobile/views/widget/common_image_view_widget.dart';
import 'package:sync_mobile/views/widget/my_button_new.dart';
import 'package:sync_mobile/views/widget/my_text_widget.dart';

// Filter Chip Widget
class FilterChipWidget extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const FilterChipWidget({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Bounce(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? kPrimaryColor : kWhite,
          borderRadius: BorderRadius.circular(25),
        ),
        child: MyText(
          text: label,
          size: 16,
          weight: FontWeight.w600,
          color: isSelected ? kWhite : kSubText,
        ),
      ),
    );
  }
}

// Job Card Widget for Open Jobs
class OpenJobCard extends StatelessWidget {
  final String jobId;
  final String operatorName;
  final String dateTime;
  final String instructions;
  final String status;
  final String statusLabel;

  const OpenJobCard({
    super.key,
    required this.jobId,
    required this.operatorName,
    required this.dateTime,
    required this.instructions,
    required this.status,
    required this.statusLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Bounce(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: kWhite,
          borderRadius: BorderRadius.circular(16),
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
            Row(
              spacing: 6,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  decoration: BoxDecoration(
                    color: kPrimaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: MyText(
                    text: "Z1Z1",
                    size: 12,
                    weight: FontWeight.w600,
                    color: kPrimaryColor,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  decoration: BoxDecoration(
                    color:
                        status == 'accepted'
                            ? Colors.green.withOpacity(0.1)
                            : Colors.orange.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: MyText(
                    text: statusLabel,
                    size: 12,
                    weight: FontWeight.w600,
                    color: status == 'accepted' ? Colors.green : Colors.orange,
                  ),
                ),
              ],
            ),
            Gap(12),
            MyText(text: jobId, size: 20, weight: FontWeight.w700),
            Gap(8),
            MyText(
              text: "$operatorName | $dateTime",
              size: 13,
              color: kSubText,
              weight: FontWeight.w500,
            ),
            Gap(6),
            Divider(color: kDividerColor),
            Gap(6),
            MyText(
              text: "Instructions",
              size: 13,
              weight: FontWeight.w600,
              color: kSubText,
            ),
            Gap(4),
            MyText(text: instructions, size: 14, weight: FontWeight.w500),
          ],
        ),
      ),
    );
  }
}

// Job Card Widget for Completed Jobs
class CompletedJobCard extends StatelessWidget {
  final String avatar;
  final String jobId;
  final String dateTime;
  final String completedBy;
  final String status;
  final String price;

  const CompletedJobCard({
    super.key,
    required this.avatar,
    required this.jobId,
    required this.dateTime,
    required this.completedBy,
    required this.status,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Bounce(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: kWhite,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Avatar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        spacing: 12,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: kPrimaryColor.withOpacity(0.1),
                              shape: BoxShape.circle,
                            ),
                            alignment: Alignment.center,
                            child: MyText(
                              text: avatar,
                              size: 20,
                              weight: FontWeight.w700,
                              color: kPrimaryColor,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyText(
                                text: jobId,
                                size: 18,
                                weight: FontWeight.w700,
                              ),
                              Gap(4),
                              MyText(
                                text: dateTime,
                                size: 13,
                                color: kSubText,
                                weight: FontWeight.w500,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Gap(8),
                      Icon(Icons.chevron_right, color: kBlack, size: 34),
                    ],
                  ),

                  Gap(6),
                  Divider(color: kDividerColor),
                  Gap(6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText(
                            text: "Completed by",
                            size: 12,
                            color: kBlack200,
                            weight: FontWeight.w500,
                          ),
                          MyText(
                            text: completedBy,
                            size: 14,
                            paddingTop: 5,
                            weight: FontWeight.w600,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText(
                            text: "Status",
                            size: 12,
                            color: kBlack200,
                            weight: FontWeight.w500,
                          ),
                          MyText(
                            text: status,
                            size: 14,
                            paddingTop: 5,
                            weight: FontWeight.w600,
                          ),
                        ],
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText(
                            text: "Price",
                            size: 12,
                            color: kBlack200,
                            weight: FontWeight.w500,
                          ),
                          MyText(
                            text: price,
                            size: 14,
                            paddingTop: 5,
                            weight: FontWeight.w600,
                            color: kPrimaryColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Job Card Widget for On Hold Jobs
class OnHoldJobCard extends StatelessWidget {
  final String statusText;
  final String jobId;
  final String addedBy;
  final String addedDateTime;
  final String onHoldBy;
  final String onHoldDateTime;

  const OnHoldJobCard({
    super.key,
    required this.statusText,
    required this.jobId,
    required this.addedBy,
    required this.addedDateTime,
    required this.onHoldBy,
    required this.onHoldDateTime,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(16),
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
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: kPrimaryColor.withOpacity(0.1),
            ),
            child: MyText(
              text: statusText,
              size: 12,
              weight: FontWeight.w600,
              color: kPrimaryColor,
            ),
          ),
          Gap(12),
          MyText(text: jobId, size: 20, weight: FontWeight.w700),
          Gap(12),
          MyText(
            text: "Added by",
            size: 12,
            color: kBlack200,
            weight: FontWeight.w500,
          ),
          Gap(4),
          MyText(
            text: "$addedBy | $addedDateTime",
            size: 13,
            weight: FontWeight.w600,
          ),
          Gap(12),
          MyText(
            text: "On hold by",
            size: 12,
            color: kBlack200,
            weight: FontWeight.w500,
          ),
          Gap(4),
          MyText(
            text: "$onHoldBy | $onHoldDateTime",
            size: 13,
            weight: FontWeight.w600,
          ),
          Gap(16),
          MyButton(
            onTap: () {},
            buttonText: "Cancel Job",
            fontSize: 16,
            radius: 24,
            backgroundColor: kredColor.withOpacity(0.1),
            fontColor: kredColor,
            hasgrad: false,
          ),
        ],
      ),
    );
  }
}

// Job Card Widget for On Hold Jobs
class AppointmentCard extends StatelessWidget {
  final String statusText;
  final String jobId;
  final String addedBy;
  final String addedDateTime;
  final String onHoldBy;
  final String onHoldDateTime;

  const AppointmentCard({
    super.key,
    required this.statusText,
    required this.jobId,
    required this.addedBy,
    required this.addedDateTime,
    required this.onHoldBy,
    required this.onHoldDateTime,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(16),
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
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: kPrimaryColor.withOpacity(0.1),
            ),
            child: MyText(
              text: statusText,
              size: 12,
              weight: FontWeight.w600,
              color: kPrimaryColor,
            ),
          ),
          Gap(12),
          MyText(text: jobId, size: 20, weight: FontWeight.w700),
          Gap(12),
          MyText(
            text: "Added by",
            size: 12,
            color: kBlack200,
            weight: FontWeight.w500,
          ),
          Gap(4),
          MyText(
            text: "$addedBy | $addedDateTime",
            size: 13,
            weight: FontWeight.w600,
          ),
          Gap(12),
          MyText(
            text: "Held by",
            size: 12,
            color: kBlack200,
            weight: FontWeight.w500,
          ),
          Gap(4),
          MyText(
            text: "$onHoldBy | $onHoldDateTime",
            size: 13,
            weight: FontWeight.w600,
          ),
          Gap(16),
          MyButton(
            onTap: () {},
            buttonText: "Make an Appointment",
            fontSize: 16,
            radius: 24,
            backgroundColor: kPrimaryColor.withOpacity(0.1),
            fontColor: kPrimaryColor,
            hasgrad: false,
          ),
        ],
      ),
    );
  }
}

class EngineerCompletedJobCard extends StatelessWidget {
  final String? completedJobs;
  final String? workTotal;
  final String? cashTotal;
  final String? cumulatedMaterials;
  final String? rambursableMaterials;
  final String? earnings;

  const EngineerCompletedJobCard({
    super.key,
    this.completedJobs = "45",
    this.workTotal = "15127",
    this.cashTotal = "1416",
    this.cumulatedMaterials = "664",
    this.rambursableMaterials = "0",
    this.earnings = "2290.22",
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: kWhite,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: kBlack.withOpacity(0.05),
              blurRadius: 10,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with icon, completed jobs count and chevron
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CommonImageView(
                      imagePath: Assets.imagesOnCompleteReciept,
                      height: 40,
                    ),
                    Gap(12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                          text: completedJobs ?? "45",
                          size: 20,
                          weight: FontWeight.w700,
                          color: kBlack,
                        ),
                        Gap(2),
                        MyText(
                          text: "Completed Jobs",
                          size: 13,
                          color: kSubText,
                          weight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ],
                ),
                Icon(Icons.chevron_right, color: kBlack, size: 28),
              ],
            ),

            Gap(16),
            Divider(color: kDividerColor, height: 1),
            Gap(16),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Work Total
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                          text: "Work Total",
                          size: 12,
                          color: kBlack200,
                          weight: FontWeight.w500,
                        ),
                        Gap(6),
                        MyText(
                          text: workTotal ?? "15127",
                          size: 16,
                          weight: FontWeight.w600,
                          color: kBlack,
                        ),
                      ],
                    ),

                    // Cash Total
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyText(
                              text: "Cash Total",
                              size: 12,
                              color: kBlack200,
                              weight: FontWeight.w500,
                            ),
                            Gap(6),
                            MyText(
                              text: cashTotal ?? "1416",
                              size: 16,
                              weight: FontWeight.w600,
                              color: kBlack,
                            ),
                          ],
                        ),
                        Gap(64),
                      ],
                    ),
                  ],
                ),

                Gap(20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Cumulated Materials
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                          text: "Cumulated Materials",
                          size: 12,
                          color: kBlack200,
                          weight: FontWeight.w500,
                        ),
                        Gap(6),
                        MyText(
                          text: cumulatedMaterials ?? "664",
                          size: 16,
                          weight: FontWeight.w600,
                          color: kBlack,
                        ),
                      ],
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyText(
                          text: "Rambursable Materials",
                          size: 12,
                          color: kBlack200,
                          weight: FontWeight.w500,
                        ),
                        Gap(6),
                        MyText(
                          text: rambursableMaterials ?? "0",
                          size: 16,
                          weight: FontWeight.w600,
                          color: kBlack,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),

            Gap(20),

            // Earnings Button
            MyButton(
              radius: 25,
              height: 50,
              onTap: () {},
              buttonText: "My Earnings : \$$earnings",
              backgroundColor: kSecondaryGreenColor.withOpacity(0.2),
              fontColor: kSecondaryGreenColor,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
      ),
    );
  }
}
