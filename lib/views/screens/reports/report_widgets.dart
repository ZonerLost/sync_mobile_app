import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sync_mobile/constants/app_colors.dart';
import 'package:sync_mobile/generated/assets.dart';
import 'package:sync_mobile/views/screens/bottomsheets/bottom_sheets.dart';
import 'package:sync_mobile/views/widget/common_image_view_widget.dart';
import 'package:sync_mobile/views/widget/custom_dropdown.dart';
import 'package:sync_mobile/views/widget/my_button_new.dart';
import 'package:sync_mobile/views/widget/my_text_widget.dart';
import 'package:sync_mobile/views/widget/my_textfeild.dart';

// ============================================
// WIDGET 1: Filter Card
// ============================================
class FilterCard extends StatelessWidget {
  final String selectedDate;
  final String selectedLocksmith;
  final List<String>? locksmithItems; // Optional custom list
  final VoidCallback onDateTap;
  final Function(String) onLocksmithChanged;
  final VoidCallback onShowReport;

  const FilterCard({
    super.key,
    required this.selectedDate,
    required this.selectedLocksmith,
    this.locksmithItems,
    required this.onDateTap,
    required this.onLocksmithChanged,
    required this.onShowReport,
  });

  @override
  Widget build(BuildContext context) {
    // Default items or use provided items
    final List<String> dropdownItems =
        locksmithItems ??
        ["All Lock smiths", "John Doe", "Jane Smith", "Mike Wilson"];

    // Ensure selectedLocksmith is in the items list
    final List<String> finalItems =
        dropdownItems.contains(selectedLocksmith)
            ? dropdownItems
            : [selectedLocksmith, ...dropdownItems];

    return Container(
      padding: const EdgeInsets.all(20),
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: kbackground,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Date Picker
          MyTextField(
            backgroundColor: kWhite,
            hint: selectedDate,
            hintColor: kBlack,
            radius: 12,
            hintWeight: FontWeight.w500,
            suffix: CommonImageView(
              imagePath: Assets.imagesCalendar,
              height: 24,
            ),
          ),
          const Gap(16),

          // Locksmith Dropdown - FIXED
          CustomDropDown2(
            hint: "Select Locksmith",
            selectedValue: selectedLocksmith,
            items: finalItems,
            onChanged: (value) {
              onLocksmithChanged(value.toString());
            },
            bgColor: kWhite,
          ),
          const Gap(16),

          // Show Report Button
          MyButton(
            onTap: onShowReport,
            buttonText: "Show report",
            fontColor: kWhite,
            backgroundColor: kBlack,
            height: 56,
            radius: 28,
            hasgrad: false,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    );
  }
}

// ============================================
// WIDGET 2: Daily Locksmith Report Card (Expanded)
// ============================================
class DailyLocksmithReportCardExpanded extends StatelessWidget {
  final String completed;
  final String cancelled;
  final String appointments;
  final String work;
  final String matRamburs;
  final String matCumulated;
  final String cash;
  final String credit;
  final String vat;
  final String techPay;
  final String cashDifference;

  const DailyLocksmithReportCardExpanded({
    super.key,
    required this.completed,
    required this.cancelled,
    required this.appointments,
    required this.work,
    required this.matRamburs,
    required this.matCumulated,
    required this.cash,
    required this.credit,
    required this.vat,
    required this.techPay,
    required this.cashDifference,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const MyText(
            text: "Daily Locksmith Report",
            size: 20,
            weight: FontWeight.w600,
          ),
          const Gap(16),

          // First Row - 3 Stats
          Row(
            children: [
              Expanded(
                child: StatCardSmall(value: completed, label: "Completed"),
              ),
              const Gap(10),
              Expanded(
                child: StatCardSmall(value: cancelled, label: "Cancelled"),
              ),
              const Gap(10),
              Expanded(
                child: StatCardSmall(
                  value: appointments,
                  label: "Appointments",
                ),
              ),
            ],
          ),
          const Gap(10),

          // Second Row - 3 Stats
          Row(
            children: [
              Expanded(child: StatCardSmall(value: work, label: "Work")),
              const Gap(10),
              Expanded(
                child: StatCardSmall(value: matRamburs, label: "Mat Ramburs.."),
              ),
              const Gap(10),
              Expanded(
                child: StatCardSmall(
                  value: matCumulated,
                  label: "Mat Cumulated",
                ),
              ),
            ],
          ),
          const Gap(10),

          // Third Row - 3 Stats
          Row(
            children: [
              Expanded(child: StatCardSmall(value: cash, label: "Cash")),
              const Gap(10),
              Expanded(child: StatCardSmall(value: credit, label: "Credit")),
              const Gap(10),
              Expanded(child: StatCardSmall(value: vat, label: "V.A.T")),
            ],
          ),
          const Gap(10),

          // Fourth Row - 2 Stats
          Row(
            children: [
              Expanded(child: StatCardSmall(value: techPay, label: "Tech Pay")),
              const Gap(10),
              Expanded(
                child: StatCardSmall(
                  value: cashDifference,
                  label: "Cash Difference",
                ),
              ),
              const Gap(10),
              const Expanded(child: SizedBox()),
            ],
          ),
        ],
      ),
    );
  }
}

// ============================================
// WIDGET 3: Small Stat Card
// ============================================
class StatCardSmall extends StatelessWidget {
  final String value;
  final String label;

  const StatCardSmall({super.key, required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: kbackground,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(text: value, size: 16, weight: FontWeight.w600),
          const Gap(4),
          MyText(
            text: label,
            size: 12,
            color: kBlack100,
            weight: FontWeight.w400,
          ),
        ],
      ),
    );
  }
}

// ============================================
// WIDGET 4: Jobs Table Card
// ============================================
class JobsTableCard extends StatelessWidget {
  final String locksmithName;
  final String jobCount;
  final List<Map<String, String>> jobs;

  const JobsTableCard({
    super.key,
    required this.locksmithName,
    required this.jobCount,
    required this.jobs,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with name and count badge
          Row(
            children: [
              MyText(text: locksmithName, size: 20, weight: FontWeight.w600),
              const Gap(10),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: kPrimaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: MyText(
                  text: jobCount,
                  size: 14,
                  color: kPrimaryColor,
                  weight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const Gap(16),

          // Table
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              headingRowColor: MaterialStateProperty.all(kbackground),
              columnSpacing: 40,
              horizontalMargin: 12,
              columns: const [
                DataColumn(
                  label: MyText(
                    text: "Sr no.",
                    size: 14,
                    color: kBlack200,
                    weight: FontWeight.w500,
                  ),
                ),
                DataColumn(
                  label: MyText(
                    text: "Actions",
                    size: 14,
                    color: kBlack200,
                    weight: FontWeight.w500,
                  ),
                ),
                DataColumn(
                  label: MyText(
                    text: "Post Code",
                    size: 14,
                    color: kBlack200,
                    weight: FontWeight.w500,
                  ),
                ),
              ],
              rows:
                  jobs.map((job) {
                    return DataRow(
                      cells: [
                        DataCell(
                          MyText(
                            text: job["sr"]!,
                            size: 16,
                            color: kBlack,
                            weight: FontWeight.w500,
                          ),
                        ),
                        DataCell(
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  // View Photos
                                },
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: kYellowColor.withOpacity(0.2),
                                  ),
                                  child: const MyText(
                                    text: "View Photos",
                                    size: 14,
                                    color: Colors.orange,
                                    weight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              const Gap(16),
                              GestureDetector(
                                onTap: () {
                                  // View Details
                                },
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: kPrimaryColor.withOpacity(0.2),
                                  ),
                                  child: const MyText(
                                    text: "View Details",
                                    size: 14,
                                    color: kPrimaryColor,
                                    weight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        DataCell(
                          MyText(
                            text: job["postCode"]!,
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

          // Total Section
          Container(
            width: Get.width,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: kPrimaryColor.withOpacity(0.2)),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                  text: "Total",
                  size: 16,
                  color: kPrimaryColor,
                  weight: FontWeight.w600,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================
// WIDGET 5: weekly Locksmith Report Card
// ============================================
class WeeklyLocksmithReportCardExpanded extends StatelessWidget {
  final String completed;
  final String cancelled;
  final String onhold;

  const WeeklyLocksmithReportCardExpanded({
    super.key,
    required this.completed,
    required this.cancelled,
    required this.onhold,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const MyText(
            text: "Weekly Locksmith Report",
            size: 20,
            weight: FontWeight.w600,
          ),
          const Gap(16),

          // First Row - 3 Stats
          Row(
            children: [
              Expanded(
                child: StatCardSmall(value: completed, label: "Completed"),
              ),
              const Gap(10),
              Expanded(child: StatCardSmall(value: onhold, label: "on Hold")),
              const Gap(10),
              Expanded(
                child: StatCardSmall(value: cancelled, label: "Cancelled"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class JobDetailCard extends StatelessWidget {
  final String status;
  final String cancelledDate;
  final String jobId;
  final String phoneNumber;
  final String reason;
  final String address;
  final String instructions;
  final Color statusColor;

  const JobDetailCard({
    super.key,
    required this.status,
    required this.cancelledDate,
    required this.jobId,
    required this.phoneNumber,
    required this.reason,
    required this.address,
    required this.instructions,
    this.statusColor = Colors.red,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Status Badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
          const Gap(16),

          // Job ID
          MyText(text: jobId, size: 20, weight: FontWeight.w700, color: kBlack),
          const Gap(8),

          // Phone Number and Reason
          Row(
            children: [
              MyText(
                text: phoneNumber,
                size: 14,
                color: kBlack200,
                weight: FontWeight.w400,
              ),
              const Gap(8),
              Container(
                width: 4,
                height: 4,
                decoration: const BoxDecoration(
                  color: kBlack200,
                  shape: BoxShape.circle,
                ),
              ),
              const Gap(8),
              MyText(
                text: "Reason: $reason",
                size: 14,
                color: kBlack200,
                weight: FontWeight.w400,
              ),
            ],
          ),
          const Gap(20),

          // Address Section
          const MyText(
            text: "Address",
            size: 12,
            color: kBlack200,
            weight: FontWeight.w500,
          ),
          const Gap(8),
          MyText(
            text: address,
            size: 14,
            color: kBlack,
            weight: FontWeight.w500,
          ),
          const Gap(20),

          // Instructions Section
          const MyText(
            text: "Instructions",
            size: 12,
            color: kBlack200,
            weight: FontWeight.w500,
          ),
          const Gap(8),
          MyText(
            text: instructions,
            size: 14,
            color: kBlack,
            weight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}

class OperatorListCard extends StatelessWidget {
  final String totalCompletedJobs;
  final String totalCancelledJobs;
  final List<Map<String, dynamic>> operators;

  const OperatorListCard({
    super.key,
    required this.totalCompletedJobs,
    required this.totalCancelledJobs,
    required this.operators,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(0),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: operators.length,
      separatorBuilder: (context, index) => const Gap(16),
      itemBuilder: (context, index) {
        final operator = operators[index];
        return OperatorItem(
          operatorName: operator['name'],
          completedJobs: operator['completed'],
          cancelledJobs: operator['cancelled'],
          onViewJobs: operator['onViewJobs'],
        );
      },
    );
  }
}

class OperatorItem extends StatelessWidget {
  final String operatorName;
  final String completedJobs;
  final String cancelledJobs;
  final VoidCallback? onViewJobs;

  const OperatorItem({
    super.key,
    required this.operatorName,
    required this.completedJobs,
    required this.cancelledJobs,
    this.onViewJobs,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          // Operator Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                  text: operatorName,
                  size: 18,
                  weight: FontWeight.w600,
                  color: kBlack,
                ),
                const Gap(8),
                MyText(
                  text: "$completedJobs Completed | $cancelledJobs Cancelled",
                  size: 14,
                  color: kBlack200,
                  weight: FontWeight.w400,
                ),
              ],
            ),
          ),
          const Gap(16),

          // View Jobs Button
          SizedBox(
            width: 100,
            child: MyButton(
              onTap: () {
                showJobListBottomSheet(
                  context,
                  date:
                      'November 23, 2025', // Optional - defaults to 'November 23, 2025'
                );
              },
              buttonText: "View Jobs",
              fontColor: kWhite,
              backgroundColor: kPrimaryColor,
              height: 44,
              radius: 22,
              hasgrad: false,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================
// Locksmith Revenue Table Widget
// ============================================
class LocksmithRevenueTable extends StatelessWidget {
  final String title;
  final String jobCount;
  final List<Map<String, String>> locksmiths;
  final Map<String, String> totals;

  const LocksmithRevenueTable({
    super.key,
    required this.title,
    required this.jobCount,
    required this.locksmiths,
    required this.totals,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with title and count badge
          Row(
            children: [
              MyText(text: title, size: 20, weight: FontWeight.w600),
              const Gap(10),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: kPrimaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: MyText(
                  text: jobCount,
                  size: 14,
                  color: kPrimaryColor,
                  weight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const Gap(16),

          // Table
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              headingRowColor: MaterialStateProperty.all(kbackground),
              columnSpacing: 20,
              horizontalMargin: 12,
              headingRowHeight: 48,
              dataRowHeight: 56,
              columns: const [
                DataColumn(
                  label: MyText(
                    text: "Name",
                    size: 14,
                    color: kBlack200,
                    weight: FontWeight.w500,
                  ),
                ),
                DataColumn(
                  label: MyText(
                    text: "Since",
                    size: 14,
                    color: kBlack200,
                    weight: FontWeight.w500,
                  ),
                ),
                DataColumn(
                  label: MyText(
                    text: "Jobs",
                    size: 14,
                    color: kBlack200,
                    weight: FontWeight.w500,
                  ),
                ),
                DataColumn(
                  label: MyText(
                    text: "Cancelled",
                    size: 14,
                    color: kBlack200,
                    weight: FontWeight.w500,
                  ),
                ),
                DataColumn(
                  label: MyText(
                    text: "Avg. Job",
                    size: 14,
                    color: kBlack200,
                    weight: FontWeight.w500,
                  ),
                ),
                DataColumn(
                  label: MyText(
                    text: "Revenue",
                    size: 14,
                    color: kBlack200,
                    weight: FontWeight.w500,
                  ),
                ),
                DataColumn(
                  label: MyText(
                    text: "Mat Rambursable",
                    size: 14,
                    color: kBlack200,
                    weight: FontWeight.w500,
                  ),
                ),
                DataColumn(
                  label: MyText(
                    text: "Mat Cumulated",
                    size: 14,
                    color: kBlack200,
                    weight: FontWeight.w500,
                  ),
                ),
                DataColumn(
                  label: MyText(
                    text: "VAT",
                    size: 14,
                    color: kBlack200,
                    weight: FontWeight.w500,
                  ),
                ),
                DataColumn(
                  label: MyText(
                    text: "Tech Pay",
                    size: 14,
                    color: kBlack200,
                    weight: FontWeight.w500,
                  ),
                ),
              ],
              rows: [
                // Data Rows
                ...locksmiths.map((locksmith) {
                  return DataRow(
                    cells: [
                      DataCell(
                        MyText(
                          text: locksmith["name"]!,
                          size: 15,
                          color: kBlack,
                          weight: FontWeight.w500,
                        ),
                      ),
                      DataCell(
                        MyText(
                          text: locksmith["since"]!,
                          size: 15,
                          color: kBlack,
                          weight: FontWeight.w400,
                        ),
                      ),
                      DataCell(
                        MyText(
                          text: locksmith["jobs"]!,
                          size: 15,
                          color: kBlack,
                          weight: FontWeight.w500,
                        ),
                      ),
                      DataCell(
                        MyText(
                          text: locksmith["cancelled"]!,
                          size: 15,
                          color: kBlack,
                          weight: FontWeight.w500,
                        ),
                      ),
                      DataCell(
                        MyText(
                          text: locksmith["avgJob"]!,
                          size: 15,
                          color: kBlack,
                          weight: FontWeight.w500,
                        ),
                      ),
                      DataCell(
                        MyText(
                          text: locksmith["revenue"]!,
                          size: 15,
                          color: kBlack,
                          weight: FontWeight.w500,
                        ),
                      ),
                      DataCell(
                        MyText(
                          text: locksmith["matRambursable"]!,
                          size: 15,
                          color: kBlack,
                          weight: FontWeight.w500,
                        ),
                      ),
                      DataCell(
                        MyText(
                          text: locksmith["matCumulated"]!,
                          size: 15,
                          color: kBlack,
                          weight: FontWeight.w500,
                        ),
                      ),
                      DataCell(
                        MyText(
                          text: locksmith["vat"]!,
                          size: 15,
                          color: kBlack,
                          weight: FontWeight.w500,
                        ),
                      ),
                      DataCell(
                        MyText(
                          text: locksmith["techPay"]!,
                          size: 15,
                          color: kBlack,
                          weight: FontWeight.w500,
                        ),
                      ),
                    ],
                  );
                }).toList(),

                // Total Row
                DataRow(
                  color: MaterialStateProperty.all(
                    kPrimaryColor.withOpacity(0.1),
                  ),
                  cells: [
                    const DataCell(
                      MyText(
                        text: "Total",
                        size: 15,
                        color: kPrimaryColor,
                        weight: FontWeight.w700,
                      ),
                    ),
                    const DataCell(SizedBox()),
                    DataCell(
                      MyText(
                        text: totals["jobs"]!,
                        size: 15,
                        color: kPrimaryColor,
                        weight: FontWeight.w700,
                      ),
                    ),
                    DataCell(
                      MyText(
                        text: totals["cancelled"]!,
                        size: 15,
                        color: kPrimaryColor,
                        weight: FontWeight.w700,
                      ),
                    ),
                    const DataCell(SizedBox()),
                    DataCell(
                      MyText(
                        text: totals["revenue"]!,
                        size: 15,
                        color: kPrimaryColor,
                        weight: FontWeight.w700,
                      ),
                    ),
                    DataCell(
                      MyText(
                        text: totals["matRambursable"]!,
                        size: 15,
                        color: kPrimaryColor,
                        weight: FontWeight.w700,
                      ),
                    ),
                    DataCell(
                      MyText(
                        text: totals["matCumulated"]!,
                        size: 15,
                        color: kPrimaryColor,
                        weight: FontWeight.w700,
                      ),
                    ),
                    DataCell(
                      MyText(
                        text: totals["vat"]!,
                        size: 15,
                        color: kPrimaryColor,
                        weight: FontWeight.w700,
                      ),
                    ),
                    DataCell(
                      MyText(
                        text: totals["techPay"]!,
                        size: 15,
                        color: kPrimaryColor,
                        weight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
