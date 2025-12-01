import 'package:flutter/material.dart';
import 'package:sync_mobile/constants/app_colors.dart';
import 'package:sync_mobile/generated/assets.dart';
import 'package:sync_mobile/views/screens/bottomsheets/bottom_sheets.dart';
import 'package:sync_mobile/views/screens/management/management_widgets.dart';
import 'package:sync_mobile/views/widget/app_bar.dart';
import 'package:sync_mobile/views/widget/drawer.dart';

class ManagmentLockSmithWeeklyScreen extends StatefulWidget {
  const ManagmentLockSmithWeeklyScreen({super.key});

  @override
  State<ManagmentLockSmithWeeklyScreen> createState() =>
      _ManagmentLockSmithWeeklyScreenState();
}

class _ManagmentLockSmithWeeklyScreenState
    extends State<ManagmentLockSmithWeeklyScreen>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
            searchText: "Search Locksmiths...",
            userName: "Lock Smiths Weekly",
            onMenuTap: () => _scaffoldKey.currentState?.openDrawer(),
            notificationIcon: Assets.imagesAdd,
            onNotificationTap: () {
              showAddLockSmithBottomSheet(context);
            },
          ),
          // Wrap ListView with Expanded to give it proper constraints
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(20),
              children: [
                LocksmithDetailsCard(
                  name: "#2 Dan Teste",
                  email: "dantaste23@gmail.com",
                  phoneNumber: "+1 (78) 456456 56",
                  status: "Free",
                  statusColor: kPrimaryColor,
                  onTap: () {
                    // Handle card tap
                    print("Card tapped");
                  },
                ),

                LocksmithDetailsCard(
                  name: "#2 Dan Teste",
                  email: "dantaste23@gmail.com",
                  phoneNumber: "+1 (78) 456456 56",
                  status: "Free",
                  statusColor: kPrimaryColor,
                  onTap: () {
                    // Handle card tap
                  },
                ),

                LocksmithDetailsCard(
                  name: "#2 Dan Teste",
                  email: "dantaste23@gmail.com",
                  phoneNumber: "+1 (78) 456456 56",
                  status: "Free",
                  statusColor: kPrimaryColor,
                  onTap: () {
                    // Handle card tap
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
