import 'package:flutter/material.dart';
import 'package:sync_mobile/constants/app_colors.dart';
import 'package:sync_mobile/generated/assets.dart';
import 'package:sync_mobile/views/screens/management/management_widgets.dart';
import 'package:sync_mobile/views/widget/app_bar.dart';
import 'package:sync_mobile/views/widget/drawer.dart';

class ManagmentEmailAddressScreen extends StatefulWidget {
  const ManagmentEmailAddressScreen({super.key});

  @override
  State<ManagmentEmailAddressScreen> createState() =>
      _ManagmentEmailAddressScreenState();
}

class _ManagmentEmailAddressScreenState
    extends State<ManagmentEmailAddressScreen>
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
            searchText: "Search Email Addresses...",
            userName: "Email Address",
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
