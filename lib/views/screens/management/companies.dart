import 'package:flutter/material.dart';
import 'package:sync_mobile/constants/app_colors.dart';
import 'package:sync_mobile/generated/assets.dart';
import 'package:sync_mobile/views/screens/management/management_widgets.dart';
import 'package:sync_mobile/views/widget/app_bar.dart';
import 'package:sync_mobile/views/widget/drawer.dart';

class ManagmentCompaniesScreen extends StatefulWidget {
  const ManagmentCompaniesScreen({super.key});

  @override
  State<ManagmentCompaniesScreen> createState() =>
      _ManagmentCompaniesScreenState();
}

class _ManagmentCompaniesScreenState extends State<ManagmentCompaniesScreen>
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
            showNotificationButton: false,
            searchText: "Search Companies...",
            userName: "Company",
            onMenuTap: () => _scaffoldKey.currentState?.openDrawer(),
            notificationIcon: Assets.imagesAdd,
            onNotificationTap: () {},
          ),
          // Wrap ListView with Expanded to give it proper constraints
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(20),
              children: [
                LocksmithDetailsCard2(
                  name: "Comin Operator",
                  email: "dantaste23@gmail.com",
                  phoneNumber: "",
                  status: "Free",
                  statusColor: kSecondaryGreenColor,
                  onTap: () {},
                ),
                LocksmithDetailsCard2(
                  name: "Comin Operator",
                  email: "dantaste23@gmail.com",
                  phoneNumber: "",
                  status: "Free",
                  statusColor: kSecondaryGreenColor,
                  onTap: () {},
                ),
                LocksmithDetailsCard2(
                  name: "Comin Operator",
                  email: "dantaste23@gmail.com",
                  phoneNumber: "",
                  status: "Free",
                  statusColor: kSecondaryGreenColor,
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
