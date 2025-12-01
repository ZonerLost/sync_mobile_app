import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sync_mobile/constants/app_colors.dart';
import 'package:sync_mobile/views/screens/reports/report_widgets.dart';
import 'package:sync_mobile/views/widget/app_bar.dart';
import 'package:sync_mobile/views/widget/drawer.dart';
import 'package:sync_mobile/views/widget/my_text_widget.dart';

class ReportLockSmithWeeklyOperatorScreen extends StatefulWidget {
  const ReportLockSmithWeeklyOperatorScreen({super.key});

  @override
  State<ReportLockSmithWeeklyOperatorScreen> createState() =>
      _ReportLockSmithWeeklyOperatorScreenState();
}

class _ReportLockSmithWeeklyOperatorScreenState
    extends State<ReportLockSmithWeeklyOperatorScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  String selectedDate = "Oct 13, 2025";
  String selectedLocksmith = "All Operators";

  // Sample data for operators
  final operators = [
    {
      'name': 'Comin Operator',
      'completed': '14',
      'cancelled': '1',
      'onViewJobs': () {
        // Handle view jobs
      },
    },
    {
      'name': 'Comin Operator',
      'completed': '14',
      'cancelled': '1',
      'onViewJobs': () {
        // Handle view jobs
      },
    },
    {
      'name': 'Comin Operator',
      'completed': '14',
      'cancelled': '1',
      'onViewJobs': () {
        // Handle view jobs
      },
    },
    {
      'name': 'Comin Operator',
      'completed': '14',
      'cancelled': '1',
      'onViewJobs': () {
        // Handle view jobs
      },
    },
    {
      'name': 'Comin Operator',
      'completed': '14',
      'cancelled': '1',
      'onViewJobs': () {
        // Handle view jobs
      },
    },
  ];
  String totalCompletedJobs = "36";
  String totalCancelledJobs = "12";
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
            userName: "Weekly Operators",
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
              
                Gap(20),
                MyText(
                  text:
                      "$totalCompletedJobs Completed | $totalCancelledJobs Cancelled",
                  size: 14,
                  paddingLeft: 10,
                  paddingBottom: 20,
                  color: kBlack200,
                  weight: FontWeight.w400,
                ),

                OperatorListCard(
                  totalCompletedJobs: "36",
                  totalCancelledJobs: "12",
                  operators: operators,
                ),
                // Header Stats
              ],
            ),
          ),
        ],
      ),
    );
  }
}
