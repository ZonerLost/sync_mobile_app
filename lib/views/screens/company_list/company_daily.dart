import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sync_mobile/constants/app_colors.dart';
import 'package:sync_mobile/generated/assets.dart';
import 'package:sync_mobile/views/screens/bottomsheets/bottom_sheets.dart';
import 'package:sync_mobile/views/screens/company_list/company_widgets.dart';
import 'package:sync_mobile/views/widget/app_bar.dart';
import 'package:sync_mobile/views/widget/common_image_view_widget.dart';
import 'package:sync_mobile/views/widget/drawer.dart';
import 'package:sync_mobile/views/widget/my_text_widget.dart';

class CompanyDailyScreen extends StatefulWidget {
  const CompanyDailyScreen({super.key});

  @override
  State<CompanyDailyScreen> createState() => _CompanyDailyScreenState();
}

class _CompanyDailyScreenState extends State<CompanyDailyScreen>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final rows = [
    {
      "sr": "1",
      "name": "TS6 6UD",
      "initials": "-",
      "salary": "Card Payment",
      "jobs": "£0.00",
      "workCost": "£0.00",
      "techPay": "£0.00",
    },
    {
      "sr": "2",
      "name": "TS6 6UD",
      "initials": "-",
      "salary": "Card Payment",
      "jobs": "£0.00",
      "workCost": "£0.00",
      "techPay": "£0.00",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const CustomDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Top Bar
          CustomAppBar(
            showMapToggle: false,
            showSearchField: true,
            showWelcomeText: false,
            centerUserInfo: false,
            showUserName: true,
            searchText: "Search company...",
            userName: "Daily Company ",
            onMenuTap: () => _scaffoldKey.currentState?.openDrawer(),
            notificationIcon: Assets.imagesAdd,
            onNotificationTap: () {
              showAddCompanyBottomSheet(context);
            },
          ),

          // Wrap ListView with Expanded to give it proper constraints
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(20),
              children: [
                // Header Section
                CompanyDailyHeader(
                  title: "All Companies",
                  periodText: "Period: 2025-11-03 to 2025-11-09",
                ),
                Gap(20),

                // Stats Section
                DailyLocksmithReportCard(
                  totalJobs: "04",
                  totalWorkCost: "£0.00",
                  totalMaterials: "£0.00",
                  totalTechPay: "£0.00",
                  totalCompanyPay: "£0.00",
                  totalProfit: "£0.00",
                ),
                Gap(20),
                PaymentProfileTable(
                  profileText: "PAYMENT PROFILE : 50% | Jobs: 1",
                  rows: rows, // your dynamic list
                  totalCompanyPay: "£0.00",
                  platformProfit: "£0.00",
                ),
                Gap(20),
                PaymentProfileTable(
                  profileText: "PAYMENT PROFILE : 50% | Jobs: 1",
                  rows: rows, // your dynamic list
                  totalCompanyPay: "£0.00",
                  platformProfit: "£0.00",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
