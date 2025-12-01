import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sync_mobile/constants/app_colors.dart';
import 'package:sync_mobile/views/screens/reports/report_widgets.dart';
import 'package:sync_mobile/views/widget/app_bar.dart';
import 'package:sync_mobile/views/widget/drawer.dart';

class ReportLockSmithRevenueScreen extends StatefulWidget {
  const ReportLockSmithRevenueScreen({super.key});

  @override
  State<ReportLockSmithRevenueScreen> createState() =>
      _ReportLockSmithRevenueScreenState();
}

class _ReportLockSmithRevenueScreenState
    extends State<ReportLockSmithRevenueScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  String selectedDate = "Oct 13, 2025";
  String selectedLocksmith = "All Operators";

  // Sample data for locksmiths
  final List<Map<String, String>> locksmithsData = [
    {
      "name": "Dan Taste",
      "since": "Oct 05, 2025",
      "jobs": "17",
      "cancelled": "2",
      "avgJob": "£0.00",
      "revenue": "£0.00",
      "matRambursable": "£0.00",
      "matCumulated": "£0.00",
      "vat": "£0.00",
      "techPay": "£0.00",
    },
    {
      "name": "Ovidiu Bedenci",
      "since": "Oct 05, 2025",
      "jobs": "0",
      "cancelled": "0",
      "avgJob": "£0.00",
      "revenue": "£0.00",
      "matRambursable": "£0.00",
      "matCumulated": "£0.00",
      "vat": "£0.00",
      "techPay": "£0.00",
    },
    {
      "name": "Z1 Z1",
      "since": "Oct 05, 2025",
      "jobs": "34",
      "cancelled": "0",
      "avgJob": "£0.00",
      "revenue": "£0.00",
      "matRambursable": "£0.00",
      "matCumulated": "£0.00",
      "vat": "£0.00",
      "techPay": "£0.00",
    },
    {
      "name": "Ovidiu Bedenci",
      "since": "Oct 05, 2025",
      "jobs": "0",
      "cancelled": "0",
      "avgJob": "£0.00",
      "revenue": "£0.00",
      "matRambursable": "£0.00",
      "matCumulated": "£0.00",
      "vat": "£0.00",
      "techPay": "£0.00",
    },
  ];

  final Map<String, String> totalsData = {
    "jobs": "34",
    "cancelled": "0",
    "revenue": "£0.00",
    "matRambursable": "£0.00",
    "matCumulated": "£0.00",
    "vat": "£0.00",
    "techPay": "£0.00",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: kbackground,
      drawer: const CustomDrawer(),
      body: Column(
        children: [
  
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
            userName: "Locksmith Revenue",
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
               
                const Gap(20),

                // Locksmith Revenue Table
                LocksmithRevenueTable(
                  title: "Locksmith Revenue",
                  jobCount: "4",
                  locksmiths: locksmithsData,
                  totals: totalsData,
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
