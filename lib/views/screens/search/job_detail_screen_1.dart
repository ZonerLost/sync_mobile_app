// screens/job_detail_screen.dart
import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sync_mobile/constants/app_colors.dart';
import 'package:sync_mobile/generated/assets.dart';
import 'package:sync_mobile/views/screens/search/job_detail_screen_2.dart';
import 'package:sync_mobile/views/widget/common_image_view_widget.dart';
import 'package:sync_mobile/views/widget/my_button_new.dart';
import 'package:sync_mobile/views/widget/my_text_widget.dart';

class JobDetail1Screen extends StatefulWidget {
  final Map<String, dynamic> jobData;

  const JobDetail1Screen({super.key, required this.jobData});

  @override
  State<JobDetail1Screen> createState() => _JobDetail1ScreenState();
}

class _JobDetail1ScreenState extends State<JobDetail1Screen> {
  final List<Map<String, dynamic>> jobs = [
    {
      "postcode": "TS6 6UD",
      "dateTime": "Oct 23, 2025 | 12:00 PM",
      "completedBy": "Z1Z1",
      "invoiceNo": "SN25-54454",
      "status": "Completed",
      "statusColor": kPrimaryColor,
    },
    // Add more jobs here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Gap(10),
            MyButton(
              onTap: () {
                Get.to(() => JobDetail2Screen(jobData: widget.jobData));
              },
              fontSize: 18,
              radius: 24,
              height: 60,
              buttonText: "Start Job",
              hasiconRight: true,
              isRight: true,
              choiceIconRight: Assets.imagesRightArrowUpdate,

              backgroundColor: kPrimaryColor,
              fontColor: Colors.white,
              hasgrad: false,
            ),
            const Gap(40),
          ],
        ),
      ),

      body: ListView(
        padding: EdgeInsets.all(20),
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

          // NOTES
          _section(
            title: "NOTES",
            children: const [
              Row(
                children: [
                  MyText(text: "Mat Rambursable : ", color: kBlack100),
                  MyText(text: "Lorem ipsum dolor iset", color: kPrimaryColor),
                ],
              ),
              Gap(6),
              Row(
                children: [
                  MyText(text: "Job description  : ", color: kBlack100),
                  MyText(text: "Lorem ipsum dolor iset", color: kPrimaryColor),
                ],
              ),
            ],
          ),
          Gap(20),
        ],
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
}
