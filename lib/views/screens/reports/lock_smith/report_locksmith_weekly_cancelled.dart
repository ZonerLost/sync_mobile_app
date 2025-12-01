import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sync_mobile/constants/app_colors.dart';
import 'package:sync_mobile/views/screens/reports/report_widgets.dart';
import 'package:sync_mobile/views/widget/app_bar.dart';
import 'package:sync_mobile/views/widget/drawer.dart';
import 'package:sync_mobile/views/widget/my_text_widget.dart';

class ReportLockSmithWeekCancelScreen extends StatefulWidget {
  const ReportLockSmithWeekCancelScreen({super.key});

  @override
  State<ReportLockSmithWeekCancelScreen> createState() =>
      _ReportLockSmithWeekCancelScreenState();
}

class _ReportLockSmithWeekCancelScreenState
    extends State<ReportLockSmithWeekCancelScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  String selectedDate = "Oct 13, 2025";
  String selectedLocksmith = "All Operators";
  String totalCompletedJobs = "";
  String totalCancelledJobs = "";
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
                  userName: "Weekly Cancelled",
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
                JobDetailCard(
                  status: "Cancelled on Nov 03, 2025 | 12:00 PM",
                  cancelledDate: "Nov 03, 2025 | 12:00 PM",
                  jobId: "EN1 2RR",
                  phoneNumber: "+1 (67) 457575 56",
                  reason: "Quote",
                  address: "Anne Heart Cl, Chafford Hundred , Grey RM16 6EM",
                  instructions:
                      "Lock problem 49 + vat if simple parts np 45 mins",
                  statusColor: kSecondaryRedColor,
                ),
                const Gap(20),
                JobDetailCard(
                  status: "Cancelled on Nov 03, 2025 | 12:00 PM",
                  cancelledDate: "Nov 03, 2025 | 12:00 PM",
                  jobId: "EN1 2RR",
                  phoneNumber: "+1 (67) 457575 56",
                  reason: "Quote",
                  address: "Anne Heart Cl, Chafford Hundred , Grey RM16 6EM",
                  instructions:
                      "Lock problem 49 + vat if simple parts np 45 mins",
                  statusColor: kSecondaryRedColor,
                ),
                const Gap(20),
                JobDetailCard(
                  status: "Cancelled on Nov 03, 2025 | 12:00 PM",
                  cancelledDate: "Nov 03, 2025 | 12:00 PM",
                  jobId: "EN1 2RR",
                  phoneNumber: "+1 (67) 457575 56",
                  reason: "Quote",
                  address: "Anne Heart Cl, Chafford Hundred , Grey RM16 6EM",
                  instructions:
                      "Lock problem 49 + vat if simple parts np 45 mins",
                  statusColor: kSecondaryRedColor,
                ),
                const Gap(20),
                JobDetailCard(
                  status: "Cancelled on Nov 03, 2025 | 12:00 PM",
                  cancelledDate: "Nov 03, 2025 | 12:00 PM",
                  jobId: "EN1 2RR",
                  phoneNumber: "+1 (67) 457575 56",
                  reason: "Quote",
                  address: "Anne Heart Cl, Chafford Hundred , Grey RM16 6EM",
                  instructions:
                      "Lock problem 49 + vat if simple parts np 45 mins",
                  statusColor: kSecondaryRedColor,
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
