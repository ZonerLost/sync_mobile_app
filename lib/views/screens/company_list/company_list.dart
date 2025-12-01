import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sync_mobile/constants/app_colors.dart';
import 'package:sync_mobile/generated/assets.dart';
import 'package:sync_mobile/views/screens/bottomsheets/bottom_sheets.dart';
import 'package:sync_mobile/views/screens/company_list/company_widgets.dart';
import 'package:sync_mobile/views/widget/app_bar.dart';
import 'package:sync_mobile/views/widget/common_image_view_widget.dart';
import 'package:sync_mobile/views/widget/drawer.dart';
import 'package:sync_mobile/views/widget/my_text_widget.dart';

class CompanyListScreen extends StatefulWidget {
  const CompanyListScreen({super.key});

  @override
  State<CompanyListScreen> createState() => _CompanyListScreenState();
}

class _CompanyListScreenState extends State<CompanyListScreen>
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
            searchText: "Search company...",
            userName: "Company List",
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
                LocksmithCard(
                  title: "A Locksmith - Supreme",
                  commission: "55%",
                  status: "Active",
                  statusColor: kSecondaryGreenColor,
                  editIcon: Assets.imagesEditIcon2,
                  deleteIcon: Assets.imagesTrashIcon2,
                  editBackgroundColor: Color(0xFFE8F5E9),
                  deleteBackgroundColor: Color(0xFFFFCDD2),
                  backgroundColor: Colors.white,
                  onEditTap: () {},
                  onDeleteTap: () {
                    DeleteBottomSheet(context);
                  },
                ),
                Gap(20),
                LocksmithCard(
                  title: "A Locksmith - Supreme",
                  commission: "55%",
                  status: "Active",
                  statusColor: kSecondaryGreenColor,
                  editIcon: Assets.imagesEditIcon2,
                  deleteIcon: Assets.imagesTrashIcon2,
                  editBackgroundColor: Color(0xFFE8F5E9),
                  deleteBackgroundColor: Color(0xFFFFCDD2),
                  backgroundColor: Colors.white,
                  onEditTap: () {},
                  onDeleteTap: () {
                    DeleteBottomSheet(context);
                  },
                ),
                Gap(20),
                LocksmithCard(
                  title: "A Locksmith - Supreme",
                  commission: "55%",
                  status: "Active",
                  statusColor: kSecondaryGreenColor,
                  editIcon: Assets.imagesEditIcon2,
                  deleteIcon: Assets.imagesTrashIcon2,
                  editBackgroundColor: Color(0xFFE8F5E9),
                  deleteBackgroundColor: Color(0xFFFFCDD2),
                  backgroundColor: Colors.white,
                  onEditTap: () {},
                  onDeleteTap: () {
                    DeleteBottomSheet(context);
                  },
                ),
                Gap(20),
                LocksmithCard(
                  title: "A Locksmith - Supreme",
                  commission: "55%",
                  status: "Active",
                  statusColor: kSecondaryGreenColor,
                  editIcon: Assets.imagesEditIcon2,
                  deleteIcon: Assets.imagesTrashIcon2,
                  editBackgroundColor: Color(0xFFE8F5E9),
                  deleteBackgroundColor: Color(0xFFFFCDD2),
                  backgroundColor: Colors.white,
                  onEditTap: () {},
                  onDeleteTap: () {
                    DeleteBottomSheet(context);
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
