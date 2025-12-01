import 'package:flutter/material.dart';
import 'package:sync_mobile/constants/app_colors.dart';
import 'package:sync_mobile/generated/assets.dart';
import 'package:sync_mobile/views/screens/management/management_widgets.dart';
import 'package:sync_mobile/views/widget/app_bar.dart';
import 'package:sync_mobile/views/widget/drawer.dart';

class ManagmentViewAccountantScreen extends StatefulWidget {
  const ManagmentViewAccountantScreen({super.key});

  @override
  State<ManagmentViewAccountantScreen> createState() =>
      _ManagmentViewAccountantScreenState();
}

class _ManagmentViewAccountantScreenState extends State<ManagmentViewAccountantScreen>
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
            showNotificationButton: false,
            showUserName: true,
            searchText: "Search accountants...",
            userName: "Accountants",
            onMenuTap: () => _scaffoldKey.currentState?.openDrawer(),
            notificationIcon: Assets.imagesAdd,
            onNotificationTap: () {},
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
