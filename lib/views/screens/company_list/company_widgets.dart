import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sync_mobile/constants/app_colors.dart';
import 'package:sync_mobile/generated/assets.dart';
import 'package:sync_mobile/views/widget/common_image_view_widget.dart';
import 'package:sync_mobile/views/widget/my_text_widget.dart';

class LocksmithCard extends StatelessWidget {
  final String title;
  final String commission;
  final String status;
  final Color statusColor;
  final String? editIcon;
  final String? deleteIcon;
  final VoidCallback? onEditTap;
  final VoidCallback? onDeleteTap;
  final Color? backgroundColor;
  final Color? editBackgroundColor;
  final Color? deleteBackgroundColor;

  const LocksmithCard({
    super.key,
    required this.title,
    required this.commission,
    required this.status,
    this.statusColor = kPrimaryColor,
    this.editIcon,
    this.deleteIcon,
    this.onEditTap,
    this.onDeleteTap,
    this.backgroundColor,
    this.editBackgroundColor,
    this.deleteBackgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: backgroundColor ?? kWhite,
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
          // Title and Action Buttons Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: MyText(text: title, size: 18, weight: FontWeight.w500),
              ),
              Gap(10),
              Row(
                spacing: 10,
                children: [
                  // Edit Button
                  Bounce(
                    onTap: onEditTap ?? () {},
                    child: CommonImageView(
                      imagePath: editIcon ?? Assets.imagesEdit,
                      height: 32,
                    ),
                  ),
                  // Delete Button
                  Bounce(
                    onTap: onDeleteTap ?? () {},
                    child: CommonImageView(
                      imagePath: deleteIcon ?? Assets.imagesTrash,
                      height: 32,
                    ),
                  ),
                ],
              ),
            ],
          ),

          Divider(),
          // Commission and Status Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Commission Section
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    text: "Commission",
                    size: 14,
                    color: kBlack200,
                    weight: FontWeight.w500,
                  ),
                  Gap(5),
                  MyText(text: commission, size: 20, weight: FontWeight.w600),
                ],
              ),

              // Status Section
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    text: "Status",
                    size: 14,
                    color: kBlack200,
                    weight: FontWeight.w400,
                  ),
                  Gap(5),
                  Row(
                    children: [
                      Container(
                        width: 4,
                        height: 4,
                        decoration: BoxDecoration(
                          color: statusColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      Gap(8),
                      MyText(
                        text: status,
                        size: 16,
                        color: statusColor,
                        weight: FontWeight.w600,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CompanyDailyHeader extends StatelessWidget {
  final String title;
  final String periodText;

  const CompanyDailyHeader({
    super.key,
    required this.title,
    required this.periodText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(text: title, size: 24, weight: FontWeight.bold),
        Gap(8),
        MyText(text: periodText, size: 14, color: kBlack200),
      ],
    );
  }
}

// ============================================
// FILE 3: daily_locksmith_report_card.dart
// ============================================
class DailyLocksmithReportCard extends StatelessWidget {
  final String totalJobs;
  final String totalWorkCost;
  final String totalMaterials;
  final String totalTechPay;
  final String totalCompanyPay;
  final String totalProfit;

  const DailyLocksmithReportCard({
    super.key,
    required this.totalJobs,
    required this.totalWorkCost,
    required this.totalMaterials,
    required this.totalTechPay,
    required this.totalCompanyPay,
    required this.totalProfit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(16),
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
            spacing: 10,
            children: [
              MyText(
                text: "Daily Locksmith Report",
                size: 20,
                paddingBottom: 10,
                weight: FontWeight.w500,
              ),
              Row(
                spacing: 10,

                children: [
                  Expanded(
                    child: StatCard(title: "Total Jobs", value: totalJobs),
                  ),
                  Expanded(
                    child: StatCard(
                      title: "Total Work Cost",
                      value: totalWorkCost,
                    ),
                  ),
                  Expanded(
                    child: StatCard(
                      title: "Total Materials",
                      value: totalMaterials,
                    ),
                  ),
                ],
              ),

              Row(
                spacing: 10,

                children: [
                  Expanded(
                    child: StatCard(
                      title: "Total Tech Pay",
                      value: totalTechPay,
                    ),
                  ),

                  Expanded(
                    child: StatCard(
                      title: "Total Co. Pay",
                      value: totalCompanyPay,
                    ),
                  ),
                  Expanded(
                    child: StatCard(title: "Total Profit", value: totalProfit),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class StatCard extends StatelessWidget {
  final String title;
  final String value;

  const StatCard({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: kbackground,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(text: value, size: 20, weight: FontWeight.bold),
          Gap(5),
          MyText(text: title, size: 12, color: kBlack200),
        ],
      ),
    );
  }
}

class PaymentProfileTable extends StatelessWidget {
  final String profileText;
  final List<Map<String, String>> rows;
  final String totalCompanyPay;
  final String platformProfit;

  const PaymentProfileTable({
    super.key,
    required this.profileText,
    required this.rows,
    required this.totalCompanyPay,
    required this.platformProfit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(12),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // HEADER
            Container(
              width: 900,
              padding: const EdgeInsets.only(bottom: 8),
              child: MyText(
                text: profileText, // dynamic now
                size: 18,
                color: kBlack200,
                weight: FontWeight.bold,
              ),
            ),

            // TABLE
            SizedBox(
              width: 900,
              child: DataTable(
                headingRowColor: MaterialStateProperty.all(kbackground),
                columnSpacing: 20,
                horizontalMargin: 12,
                columns: const [
                  DataColumn(
                    label: MyText(text: "Sr. no.", size: 14, color: kBlack200),
                  ),
                  DataColumn(
                    label: MyText(
                      text: "Locksmith Name",
                      size: 14,
                      color: kBlack200,
                    ),
                  ),
                  DataColumn(
                    label: MyText(text: "Initials", size: 14, color: kBlack200),
                  ),
                  DataColumn(
                    label: MyText(
                      text: "Salary Profile",
                      size: 14,
                      color: kBlack200,
                    ),
                  ),
                  DataColumn(
                    label: MyText(text: "Jobs", size: 14, color: kBlack200),
                  ),
                  DataColumn(
                    label: MyText(
                      text: "Work Cost",
                      size: 14,
                      color: kBlack200,
                    ),
                  ),
                  DataColumn(
                    label: MyText(text: "Tech Pay", size: 14, color: kBlack200),
                  ),
                ],
                rows:
                    rows.map((row) {
                      return DataRow(
                        cells: [
                          DataCell(
                            MyText(
                              text: row["sr"]!,
                              size: 16,
                              color: kBlack,
                              weight: FontWeight.w500,
                            ),
                          ),
                          DataCell(
                            MyText(
                              text: row["name"]!,
                              size: 16,
                              color: kBlack,
                              weight: FontWeight.w500,
                            ),
                          ),
                          DataCell(
                            MyText(
                              text: row["initials"]!,
                              size: 16,
                              color: kBlack,
                              weight: FontWeight.w500,
                            ),
                          ),
                          DataCell(
                            MyText(
                              text: row["salary"]!,
                              size: 16,
                              color: kBlack,
                              weight: FontWeight.w500,
                            ),
                          ),
                          DataCell(
                            MyText(
                              text: row["jobs"]!,
                              size: 16,
                              color: kBlack,
                              weight: FontWeight.w500,
                            ),
                          ),
                          DataCell(
                            MyText(
                              text: row["workCost"]!,
                              size: 16,
                              color: kBlack,
                              weight: FontWeight.w500,
                            ),
                          ),
                          DataCell(
                            MyText(
                              text: row["techPay"]!,
                              size: 16,
                              color: kBlack,
                              weight: FontWeight.w500,
                            ),
                          ),
                        ],
                      );
                    }).toList(),
              ),
            ),

            // FOOTER
            Container(
              width: 900,
              color: kbackground,
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Expanded(
                        child: MyText(
                          text: "Total Company Pay",
                          size: 14,
                          color: kPrimaryColor,
                          weight: FontWeight.w600,
                        ),
                      ),
                      MyText(
                        text: totalCompanyPay,
                        size: 14,
                        color: kPrimaryColor,
                        weight: FontWeight.bold,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Expanded(
                        child: MyText(
                          text: "Platform Profit",
                          color: kPrimaryColor,
                          weight: FontWeight.w600,
                        ),
                      ),
                      MyText(
                        text: platformProfit,
                        size: 14,
                        color: kPrimaryColor,
                        weight: FontWeight.bold,
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
