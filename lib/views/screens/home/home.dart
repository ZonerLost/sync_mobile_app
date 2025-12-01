

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sync_mobile/constants/app_colors.dart';
import 'package:sync_mobile/constants/user_controller.dart';
import 'package:sync_mobile/generated/assets.dart';
import 'package:sync_mobile/views/widget/app_bar.dart';
import 'package:sync_mobile/views/widget/common_image_view_widget.dart';
import 'package:sync_mobile/views/widget/drawer.dart';
import 'package:sync_mobile/views/widget/my_textfeild.dart';
import 'home_widgets.dart';

class HomeScreen extends StatefulWidget {
  final String? userRole;

  const HomeScreen({super.key, this.userRole});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final UserController userController = Get.find<UserController>();

  // Use null-aware operator to get role
  String get currentRole => widget.userRole ?? userController.userRole.value;

  // Get current tabs based on role
  List<String> get currentTabs =>
      currentRole == 'engineer' ? tabsEngineer : tabs;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  late TabController _tabController;
  int _selectedIndex = 0;
  bool _isMapView = false;

  final List<String> tabs = ["Open", "Completed", "On Hold", "Appointments"];
  final List<String> tabsEngineer = [
    "Open",
    "My Completed Jobs",
    "On Hold",
    "Appointments",
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: currentTabs.length, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _toggleMapView() {
    setState(() {
      _isMapView = !_isMapView;
    });
  }

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
            showMapToggle: true,
            isMapView: _isMapView,
            onMenuTap: () => _scaffoldKey.currentState?.openDrawer(),
            onMapToggleTap: _toggleMapView,
          ),

          Gap(20),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  currentTabs.length,
                  (index) => Padding(
                    padding: EdgeInsets.only(right: 6),
                    child: FilterChipWidget(
                      label: currentTabs[index],
                      isSelected: _selectedIndex == index,
                      onTap: () {
                        _tabController.animateTo(index);
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Content Area (Map or List)
          Expanded(child: _isMapView ? _buildMapView() : _buildListView()),
        ],
      ),
    );
  }

  Widget _buildMapView() {
    return Stack(
      children: [
        // Map Background
        Positioned.fill(
          child: Image.asset(Assets.imagesMap, fit: BoxFit.cover),
        ),

        // Horizontal scrollable job cards at the bottom
        Positioned(
          bottom: 50,
          left: 20,
          right: 20,
          child: SizedBox(
            height: 220,
            child: ListView(
              padding: EdgeInsets.all(0),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              children: _getJobCardsForTab(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildListView() {
    return TabBarView(
      controller: _tabController,
      physics: BouncingScrollPhysics(),
      children: [
        _buildOpenJobsList(),
        currentRole == 'owner'
            ? _buildCompletedJobsList()
            : _buildEngineerCompletedJobsList(),
        _buildOnHoldJobsList(),
        _buildAppointmentsList(),
      ],
    );
  }

  List<Widget> _getJobCardsForTab() {
    switch (_selectedIndex) {
      case 0: // Open
        return [
          OpenJobCard(
            jobId: "EN1 2RR",
            operatorName: "COSMIN Operator",
            dateTime: "Nov 23, 2025 12:00 PM",
            instructions: "Lock problem 49 + vat if simple parts np 45 mins",
            status: "accepted",
            statusLabel: "Z1Z1    Accepted",
          ),
          Gap(10),
          OpenJobCard(
            jobId: "EN1 2RR",
            operatorName: "COSMIN Operator",
            dateTime: "Nov 23, 2025 12:00 PM",
            instructions: "Lock problem 49 + vat if simple parts np 45 mins",
            status: "accepted",
            statusLabel: "Z1Z1    Accepted",
          ),
          Gap(10),
          OpenJobCard(
            jobId: "EN1 2RR",
            operatorName: "COSMIN Operator",
            dateTime: "Nov 23, 2025 12:00 PM",
            instructions: "Lock problem 49 + vat if simple parts np 45 mins",
            status: "accepted",
            statusLabel: "Z1Z1    Accepted",
          ),
        ];
      case 1: // Completed
        return [
          OpenJobCard(
            jobId: "EN1 2RR",
            operatorName: "COSMIN Operator",
            dateTime: "Nov 23, 2025 12:00 PM",
            instructions: "Lock problem 49 + vat if simple parts np 45 mins",
            status: "accepted",
            statusLabel: "Z1Z1    Accepted",
          ),
          Gap(10),
          OpenJobCard(
            jobId: "EN1 2RR",
            operatorName: "COSMIN Operator",
            dateTime: "Nov 23, 2025 12:00 PM",
            instructions: "Lock problem 49 + vat if simple parts np 45 mins",
            status: "accepted",
            statusLabel: "Z1Z1    Accepted",
          ),
          Gap(10),
          OpenJobCard(
            jobId: "EN1 2RR",
            operatorName: "COSMIN Operator",
            dateTime: "Nov 23, 2025 12:00 PM",
            instructions: "Lock problem 49 + vat if simple parts np 45 mins",
            status: "accepted",
            statusLabel: "Z1Z1    Accepted",
          ),
        ];
      case 2: // On Hold
        return [
          OpenJobCard(
            jobId: "EN1 2RR",
            operatorName: "COSMIN Operator",
            dateTime: "Nov 23, 2025 12:00 PM",
            instructions: "Lock problem 49 + vat if simple parts np 45 mins",
            status: "accepted",
            statusLabel: "Z1Z1    Accepted",
          ),
          Gap(10),
          OpenJobCard(
            jobId: "EN1 2RR",
            operatorName: "COSMIN Operator",
            dateTime: "Nov 23, 2025 12:00 PM",
            instructions: "Lock problem 49 + vat if simple parts np 45 mins",
            status: "accepted",
            statusLabel: "Z1Z1    Accepted",
          ),
          Gap(10),
          OpenJobCard(
            jobId: "EN1 2RR",
            operatorName: "COSMIN Operator",
            dateTime: "Nov 23, 2025 12:00 PM",
            instructions: "Lock problem 49 + vat if simple parts np 45 mins",
            status: "accepted",
            statusLabel: "Z1Z1    Accepted",
          ),
        ];
      case 3: // Appointments
        return [
          OpenJobCard(
            jobId: "EN1 2RR",
            operatorName: "COSMIN Operator",
            dateTime: "Nov 23, 2025 12:00 PM",
            instructions: "Lock problem 49 + vat if simple parts np 45 mins",
            status: "accepted",
            statusLabel: "Z1Z1    Accepted",
          ),
          Gap(10),
          OpenJobCard(
            jobId: "EN1 2RR",
            operatorName: "COSMIN Operator",
            dateTime: "Nov 23, 2025 12:00 PM",
            instructions: "Lock problem 49 + vat if simple parts np 45 mins",
            status: "accepted",
            statusLabel: "Z1Z1    Accepted",
          ),
          Gap(10),
          OpenJobCard(
            jobId: "EN1 2RR",
            operatorName: "COSMIN Operator",
            dateTime: "Nov 23, 2025 12:00 PM",
            instructions: "Lock problem 49 + vat if simple parts np 45 mins",
            status: "accepted",
            statusLabel: "Z1Z1    Accepted",
          ),
        ];
      default:
        return [];
    }
  }

  // Original List Views
  Widget _buildOpenJobsList() {
    return ListView(
      padding: EdgeInsets.all(20),
      physics: BouncingScrollPhysics(),
      children: [
        OpenJobCard(
          jobId: "EN1 2RR",
          operatorName: "COSMIN Operator",
          dateTime: "Nov 23, 2025 12:00 PM",
          instructions: "Lock problem 49 + vat if simple parts np 45 mins",
          status: "accepted",
          statusLabel: "Z1Z1    Accepted",
        ),
        OpenJobCard(
          jobId: "EN1 2RR",
          operatorName: "COSMIN Operator",
          dateTime: "Nov 23, 2025 12:00 PM",
          instructions: "Lock problem 49 + vat if simple parts np 45 mins",
          status: "accepted",
          statusLabel: "Z1Z1    Accepted",
        ),
        OpenJobCard(
          jobId: "EN1 2RR",
          operatorName: "COSMIN Operator",
          dateTime: "Nov 23, 2025 12:00 PM",
          instructions: "Lock problem 49 + vat if simple parts np 45 mins",
          status: "accepted",
          statusLabel: "Z1Z1    Accepted",
        ),
      ],
    );
  }

  Widget _buildCompletedJobsList() {
    return ListView(
      padding: EdgeInsets.all(20),
      physics: BouncingScrollPhysics(),
      children: [
        CompletedJobCard(
          avatar: "R",
          jobId: "RM15 4YE",
          dateTime: "Oct 23, 2025 | 12:00 PM",
          completedBy: "Z1Z1",
          status: "Completed",
          price: "£2000.00",
        ),
        CompletedJobCard(
          avatar: "R",
          jobId: "RM15 4YE",
          dateTime: "Oct 23, 2025 | 12:00 PM",
          completedBy: "Z1Z1",
          status: "Completed",
          price: "£2000.00",
        ),
        CompletedJobCard(
          avatar: "R",
          jobId: "RM15 4YE",
          dateTime: "Oct 23, 2025 | 12:00 PM",
          completedBy: "Z1Z1",
          status: "Completed",
          price: "£2000.00",
        ),
        CompletedJobCard(
          avatar: "R",
          jobId: "RM15 4YE",
          dateTime: "Oct 23, 2025 | 12:00 PM",
          completedBy: "Z1Z1",
          status: "Completed",
          price: "£2000.00",
        ),
      ],
    );
  }

  Widget _buildOnHoldJobsList() {
    return ListView(
      padding: EdgeInsets.all(20),
      physics: BouncingScrollPhysics(),
      children: [
        OnHoldJobCard(
          statusText: "On Hold Waiting for Payment",
          jobId: "EN1 2RR",
          addedBy: "Laurentiu Operator",
          addedDateTime: "Nov 05, 2025 | 12:00 PM",
          onHoldBy: "OVIDIU SN / GL",
          onHoldDateTime: "Nov 05, 2025 | 12:00 PM",
        ),
        OnHoldJobCard(
          statusText: "On Hold Waiting for Payment",
          jobId: "EN1 2RR",
          addedBy: "Laurentiu Operator",
          addedDateTime: "Nov 05, 2025 | 12:00 PM",
          onHoldBy: "OVIDIU SN / GL",
          onHoldDateTime: "Nov 05, 2025 | 12:00 PM",
        ),
      ],
    );
  }

  Widget _buildAppointmentsList() {
    return ListView(
      padding: EdgeInsets.all(20),
      physics: BouncingScrollPhysics(),
      children: [
        AppointmentCard(
          statusText: "Latest",
          jobId: "EN1 2RR",
          addedBy: "Laurentiu Operator",
          addedDateTime: "Nov 05, 2025 | 12:00 PM",
          onHoldBy: "OVIDIU SN / GL",
          onHoldDateTime: "Nov 05, 2025 | 12:00 PM",
        ),
        AppointmentCard(
          statusText: "2 days ago",
          jobId: "EN1 2RR",
          addedBy: "Laurentiu Operator",
          addedDateTime: "Nov 05, 2025 | 12:00 PM",
          onHoldBy: "OVIDIU SN / GL",
          onHoldDateTime: "Nov 05, 2025 | 12:00 PM",
        ),
      ],
    );
  }

  Widget _buildEngineerCompletedJobsList() {
    return ListView(
      padding: EdgeInsets.all(20),
      physics: BouncingScrollPhysics(),
      children: [
        MyTextField(
          backgroundColor: kWhite,
          hint: "13-Oct-2025",
          hintColor: kBlack,
          radius: 12,
          hintWeight: FontWeight.w500,
          suffix: CommonImageView(imagePath: Assets.imagesCalendar, height: 24),
        ),
        EngineerCompletedJobCard(
          completedJobs: "52",
          workTotal: "18500",
          cashTotal: "2100",
          cumulatedMaterials: "750",
          rambursableMaterials: "50",
          earnings: "3200.50",
        ),
        EngineerCompletedJobCard(
          completedJobs: "52",
          workTotal: "18500",
          cashTotal: "2100",
          cumulatedMaterials: "750",
          rambursableMaterials: "50",
          earnings: "3200.50",
        ),
        EngineerCompletedJobCard(
          completedJobs: "52",
          workTotal: "18500",
          cashTotal: "2100",
          cumulatedMaterials: "750",
          rambursableMaterials: "50",
          earnings: "3200.50",
        ),
        EngineerCompletedJobCard(
          completedJobs: "52",
          workTotal: "18500",
          cashTotal: "2100",
          cumulatedMaterials: "750",
          rambursableMaterials: "50",
          earnings: "3200.50",
        ),
        EngineerCompletedJobCard(
          completedJobs: "52",
          workTotal: "18500",
          cashTotal: "2100",
          cumulatedMaterials: "750",
          rambursableMaterials: "50",
          earnings: "3200.50",
        ),
      ],
    );
  }
}
