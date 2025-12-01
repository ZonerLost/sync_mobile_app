// screens/job_detail_screen.dart
import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sync_mobile/constants/app_colors.dart';
import 'package:sync_mobile/generated/assets.dart';
import 'package:sync_mobile/views/widget/common_image_view_widget.dart';
import 'package:sync_mobile/views/widget/my_text_widget.dart';

class JobDetailScreen extends StatelessWidget {
  final Map<String, dynamic> jobData;

  const JobDetailScreen({super.key, required this.jobData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Gap(50),
            Row(
              spacing: 6,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Bounce(
                  onTap: () {
                    Get.back();
                  },
                  child: CommonImageView(
                    imagePath: Assets.imagesBack,
                    height: 50,
                  ),
                ),
                MyText(text: "Job Details", size: 16, weight: FontWeight.w600),
              ],
            ),
            Gap(16),
            Divider(height: 1),
            Gap(16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const MyText(text: "SW2", size: 20, color: kBlack200),
                    Row(
                      children: [
                        MyText(
                          text: "Date & Time :",
                          size: 14,
                          weight: FontWeight.w500,
                        ),
                        MyText(
                          text: "As soon as possible",
                          size: 14,
                          color: kPrimaryColor,
                          weight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ],
                ),

                const MyText(
                  text: "#44",
                  size: 22,
                  color: kPrimaryColor,
                  weight: FontWeight.bold,
                ),
              ],
            ),

            Gap(16),
            Divider(height: 1),
            Gap(16),
            Row(
              children: [
                MyText(text: "Email address", size: 16, color: kBlack200),
                Spacer(),
                MyText(text: "Phone number", size: 13, color: kBlack200),
              ],
            ),
            Gap(8),
            Row(
              children: [
                MyText(text: "dantaste23@gmail.com", weight: FontWeight.w600),
                Spacer(),
                MyText(text: "+1(78) 456456 56", weight: FontWeight.w600),
              ],
            ),
            const Gap(20),

            // Action Buttons
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      color: kPrimaryColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: MyText(
                        text: "View Pictures",
                        color: kPrimaryColor,
                        weight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const Gap(12),
                Expanded(
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      color: kYellowColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: MyText(
                        text: "Edit Job",
                        color: kYellowColor,
                        weight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const Gap(12),
                Expanded(
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      color: kSecondaryRedColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: MyText(
                        text: "Delete Job",
                        color: kSecondaryRedColor,
                        weight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Gap(24),

            // NOTES
            _section(
              title: "NOTES",
              children: const [
                Row(
                  children: [
                    MyText(text: "Mat Rambursable : ", color: kBlack100),
                    MyText(
                      text: "Lorem ipsum dolor iset",
                      color: kPrimaryColor,
                    ),
                  ],
                ),
                Gap(6),
                Row(
                  children: [
                    MyText(text: "Job description  : ", color: kBlack100),
                    MyText(
                      text: "Lorem ipsum dolor iset",
                      color: kPrimaryColor,
                    ),
                  ],
                ),
              ],
            ),
            Gap(20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                  text: "Operators on Shift",
                  size: 16,
                  weight: FontWeight.bold,
                ),
                Container(
                  color: const Color(0xFFF5F5F5),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: const [
                      Expanded(
                        flex: 2,
                        child: MyText(
                          text: "Operators on Shift",
                          size: 13,
                          color: kBlack200,
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: MyText(
                            text: "Date",
                            size: 13,
                            color: kBlack200,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(right: 20),
                          child: MyText(
                            text: "Time",
                            size: 13,
                            color: kBlack200,
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                _operatorRow("Dan Taste", "Jun 12 2025", "12:34 PM"),
                _operatorRow("Dan Taste", "Jun 12 2025", "12:34 PM"),
                _operatorRow("Dan Taste", "Jun 12 2025", "12:34 PM"),
              ],
            ),

            Gap(20),
            _section(
              title: "INFO",
              children: [
                _infoRow("Completed by:", "#3 Z1Z1"),
                _infoRow("Date & Time:", "Mon | Oct 23, 2025 | 12:00 PM"),
              ],
            ),
            Gap(20),
            _section(
              title: "INFO",
              children: [
                _infoRow("Work Cost:", "£0.00"),
                _infoRow("Mat Rambursable:", "£0.00"),
                _infoRow("Mat Cumulated:", "£0.00"),
              ],
            ),
            Gap(20),
            _section(
              title: "INFO",
              children: [
                _infoRow("Payment Type:", "Cash"),
                _infoRow("Cash:", "£0.00"),
                _infoRow("V.A.T:", "£0.00"),
                _infoRow("Credit:", "£0.00"),
              ],
            ),
            Gap(20),

            _section(
              title: "INFO",
              children: [
                _infoRow("Invoice no:", "SN25-3455"),
                _infoRow("Authorize no:", "34645juu567n6"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Reusable Section
  Widget _section({required String title, required List<Widget> children}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(height: 1, color: Color(0xFFE8E8E8)),
        const Gap(12),
        MyText(
          text: title,
          size: 12,
          color: kBlack100,
          weight: FontWeight.w500,
        ),

        const Gap(16),
        ...children,
      ],
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Row(
        spacing: 5,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          MyText(
            text: label,
            color: kBlack100,
            weight: FontWeight.w500,
            size: 14,
          ),
          MyText(
            text: value,
            color: kPrimaryColor,
            weight: FontWeight.w500,
            size: 14,
          ),
        ],
      ),
    );
  }

  Widget _operatorRow(String name, String date, String time) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 5),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color(0xFFE8E8E8), width: 0.5),
        ),
      ),
      child: Row(
        children: [
          Expanded(flex: 2, child: MyText(text: name, weight: FontWeight.w500)),
          Expanded(
            child: Center(
              child: MyText(text: date, size: 14, color: kBlack200),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: MyText(text: time, size: 14, color: kBlack200),
            ),
          ),
        ],
      ),
    );
  }
}
