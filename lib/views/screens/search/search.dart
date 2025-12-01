// screens/search_job_screen.dart
import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sync_mobile/constants/app_colors.dart';
import 'package:sync_mobile/constants/user_controller.dart';
import 'package:sync_mobile/generated/assets.dart';
import 'package:sync_mobile/views/screens/search/job_detail_screen.dart';
import 'package:sync_mobile/views/screens/search/job_detail_screen_1.dart';
import 'package:sync_mobile/views/widget/app_bar.dart';
import 'package:sync_mobile/views/widget/common_image_view_widget.dart';
import 'package:sync_mobile/views/widget/drawer.dart';
import 'package:sync_mobile/views/widget/my_text_widget.dart';

class SearchJobScreen extends StatefulWidget {
  final String? userRole;

  const SearchJobScreen({super.key, this.userRole});

  @override
  State<SearchJobScreen> createState() => _SearchJobScreenState();
}

class _SearchJobScreenState extends State<SearchJobScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final UserController userController = Get.find<UserController>();

  // Use null-aware operator to get role
  String get currentRole => widget.userRole ?? userController.userRole.value;

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
      key: _scaffoldKey,
      drawer: const CustomDrawer(),
      body: Column(
        children: [
          // Top Bar
          CustomAppBar(
            userName: "Search Job",
            showWelcomeText: false,
            centerUserInfo: false,
            showMapToggle: false, // We hide the old map button
            showNotificationButton: false,
            onMenuTap: () => _scaffoldKey.currentState?.openDrawer(),
            customSearchSuffix: Container(
              margin: const EdgeInsets.only(right: 8),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: kWhite,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  MyText(
                    text: "Post Code",
                    size: 12,
                    color: kBlack,
                    weight: FontWeight.w600,
                  ),
                  Icon(Icons.keyboard_arrow_down, size: 24),
                ],
              ),
            ),
          ),

          Gap(20),

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: jobs.length,
              itemBuilder: (context, index) {
                final job = jobs[index];
                return Bounce(
                  onTap: () {
                    if (userController.userRole.value == 'engineer') {
                      Get.to(() => JobDetail1Screen(jobData: job));
                    } else {
                      Get.to(() => JobDetailScreen(jobData: job));
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: kWhite,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 24,
                                  backgroundColor: Colors.green.shade100,
                                  child: MyText(
                                    text: job["postcode"][0],
                                    color: Colors.green.shade800,
                                    weight: FontWeight.bold,
                                    size: 20,
                                  ),
                                ),
                                const Gap(16),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [
                                    MyText(
                                      text: job["postcode"],
                                      size: 20,
                                      weight: FontWeight.bold,
                                    ),
                                    const Gap(4),
                                    MyText(
                                      text: job["dateTime"],
                                      size: 14,
                                      color: kSubText2,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 24,
                              color: kBlack,
                            ),
                          ],
                        ),
                        Gap(10),

                        Divider(),
                        Gap(10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MyText(
                                  text: "Completed by ",
                                  size: 13,
                                  color: kSubText2,
                                ),
                                MyText(
                                  text: job["completedBy"],
                                  size: 13,
                                  weight: FontWeight.w600,
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [
                                MyText(
                                  text: "Invoice no. ",
                                  size: 13,
                                  color: kSubText2,
                                ),
                                MyText(
                                  text: job["invoiceNo"],
                                  size: 13,
                                  weight: FontWeight.w600,
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [
                                MyText(
                                  text: "Status ",
                                  size: 13,
                                  color: kSubText2,
                                ),
                                MyText(
                                  text: job["status"],
                                  size: 13,
                                  weight: FontWeight.w600,
                                  color: job["statusColor"],
                                ),
                              ],
                            ),
                          ],
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
