import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sync_mobile/constants/app_colors.dart';
import 'package:sync_mobile/views/screens/reports/report_widgets.dart';
import 'package:sync_mobile/views/widget/app_bar.dart';
import 'package:sync_mobile/views/widget/drawer.dart';

class ReportLockSmithScreen extends StatefulWidget {
  const ReportLockSmithScreen({super.key});

  @override
  State<ReportLockSmithScreen> createState() => _ReportLockSmithScreenState();
}

class _ReportLockSmithScreenState extends State<ReportLockSmithScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  String selectedDate = "Oct 13, 2025";
  String selectedLocksmith = "All Lock smiths";

  // Sample data for the jobs table
  final List<Map<String, String>> jobsList = [
    {"sr": "1", "postCode": "TS6 6UD"},
    {"sr": "2", "postCode": "TS5 6UD"},
    {"sr": "3", "postCode": "TS4 6UD"},
    {"sr": "4", "postCode": "TS7 6UD"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: kbackground,
      drawer: const CustomDrawer(),
      body: Column(
        children: [
        // Top Bar
          Container(
            color: kWhite,
            child: Column(
              children: [
                CustomAppBar(
                  showMapToggle: false,
                  showSearchField: false,
                  showWelcomeText: false,
                  centerUserInfo: false,
                  onMenuTap: () => _scaffoldKey.currentState?.openDrawer(),
                  showUserName: true,
                  showNotificationButton: false,
                  userName: "Daily Locksmiths",
                ),
                FilterCard(
                  selectedDate: selectedDate,
                  selectedLocksmith: selectedLocksmith,
                  onDateTap: () {
                    // Handle date picker
                  },
                  onLocksmithChanged: (value) {
                    setState(() {
                      selectedLocksmith = value;
                    });
                  },
                  onShowReport: () {
                    // Handle show report
                  },
                ),
              ],
            ),
          ),

        
          // Main Content
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                // Filter Card
             
                const Gap(20),

                // Daily Locksmith Report Card
                DailyLocksmithReportCardExpanded(
                  completed: "04",
                  cancelled: "04",
                  appointments: "00",
                  work: "£0.00",
                  matRamburs: "£0.00",
                  matCumulated: "£0.00",
                  cash: "£0.00",
                  credit: "£0.00",
                  vat: "£0.00",
                  techPay: "£0.00",
                  cashDifference: "-£0.00",
                ),
                const Gap(20),

                // Jobs Table Card
                JobsTableCard(
                  locksmithName: "Z1Z1",
                  jobCount: "4",
                  jobs: jobsList,
                ),
                const Gap(20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
