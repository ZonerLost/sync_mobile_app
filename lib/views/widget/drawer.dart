// // ignore_for_file: prefer_const_constructors
// import 'package:bounce/bounce.dart';
// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';
// import 'package:get/get.dart';
// import 'package:sync_mobile/constants/app_colors.dart';
// import 'package:sync_mobile/constants/user_controller.dart';
// import 'package:sync_mobile/generated/assets.dart';
// import 'package:sync_mobile/views/screens/bottomsheets/bottom_sheets.dart';
// import 'package:sync_mobile/views/screens/company_list/company_daily.dart';
// import 'package:sync_mobile/views/screens/company_list/company_list.dart';
// import 'package:sync_mobile/views/screens/company_list/company_weekly.dart';
// import 'package:sync_mobile/views/screens/home/home.dart';
// import 'package:sync_mobile/views/screens/management/accountants/management_accountant.dart';
// import 'package:sync_mobile/views/screens/management/accountants/management_accountant_view.dart';
// import 'package:sync_mobile/views/screens/management/companies.dart';
// import 'package:sync_mobile/views/screens/management/email_address.dart';
// import 'package:sync_mobile/views/screens/management/lock_smith/management_add_locksmith.dart';
// import 'package:sync_mobile/views/screens/management/lock_smith/management_view_locksmith.dart';
// import 'package:sync_mobile/views/screens/management/operator/management_add_operator.dart';
// import 'package:sync_mobile/views/screens/management/operator/management_operator.dart';
// import 'package:sync_mobile/views/screens/management/operator/management_operator_monthly.dart';
// import 'package:sync_mobile/views/screens/management/operator/management_operator_weekly.dart';
// import 'package:sync_mobile/views/screens/profile/profile_setting.dart';
// import 'package:sync_mobile/views/screens/reports/lock_smith/report_locksmith.dart';
// import 'package:sync_mobile/views/screens/reports/lock_smith/report_locksmith_daily_operator.dart';
// import 'package:sync_mobile/views/screens/reports/lock_smith/report_locksmith_monthly_operator.dart';
// import 'package:sync_mobile/views/screens/reports/lock_smith/report_locksmith_revenue.dart';
// import 'package:sync_mobile/views/screens/reports/lock_smith/report_locksmith_weekly.dart';
// import 'package:sync_mobile/views/screens/reports/lock_smith/report_locksmith_weekly_cancelled.dart';
// import 'package:sync_mobile/views/screens/reports/lock_smith/report_locksmith_weekly_operator.dart';
// import 'package:sync_mobile/views/screens/search/search.dart';
// import 'package:sync_mobile/views/widget/common_image_view_widget.dart';
// import 'package:sync_mobile/views/widget/my_text_widget.dart';

// class CustomDrawer extends StatefulWidget {
//   const CustomDrawer({super.key});

//   @override
//   State<CustomDrawer> createState() => _CustomDrawerState();
// }

// class _CustomDrawerState extends State<CustomDrawer> {
//   bool isDisputesExpanded = false;

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       backgroundColor: kWhite,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.only(
//           topRight: Radius.circular(24),
//           bottomRight: Radius.circular(24),
//         ),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Gap(60),
//             _buildHeader(),
//             Gap(20),
//             const Divider(height: 1, color: Colors.black12),
//             Gap(16),

//             // ✅ Drawer Items
//             Expanded(
//               child: ListView(
//                 padding: EdgeInsets.zero,
//                 children: [
//                   _buildItem(
//                     icon: Assets.imagesHome,
//                     title: 'Home',
//                     onTap: () {
//                       final UserController userController =
//                           Get.find<UserController>();
//                       Get.off(
//                         () =>
//                             HomeScreen(userRole: userController.userRole.value),
//                       );
//                     },
//                   ),
//                   Divider(color: kDividerColor),

//                   _buildItem(
//                     icon: Assets.imagesSearchBlack,
//                     title: 'Search Jobs',
//                     onTap: () => Get.off(() => SearchJobScreen()),
//                   ),
//                   Divider(color: kDividerColor),

//                   _buildExpandableItem(
//                     icon: Assets.imagesPeople,
//                     title: 'Company Report',

//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(left: 12.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             _buildSubItem('Company List', () {
//                               Get.off(() => CompanyListScreen());
//                             }),
//                             _buildSubItem('Daily company', () {
//                               Get.off(() => CompanyDailyScreen());
//                             }),
//                             _buildSubItem('Weekly Company', () {
//                               Get.off(() => CompanyWeeklyScreen());
//                             }),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                   Divider(color: kDividerColor),
//                   _buildExpandableItem(
//                     icon: Assets.imagesBook,
//                     title: 'Reports',

//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(left: 12.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             _buildSubItem('Daily Locksmiths', () {
//                               Get.off(() => ReportLockSmithScreen());
//                             }),
//                             _buildSubItem('Weekly Locksmiths', () {
//                               Get.off(() => ReportLockSmithWeeklyScreen());
//                             }),
//                             _buildSubItem('Weekly Cancelled', () {
//                               Get.off(() => ReportLockSmithWeekCancelScreen());
//                             }),

//                             _buildSubItem('Weekly Companies IN', () {
//                               // Get.off(() => DisputeCenter2());
//                             }),
//                             _buildSubItem('Weekly Companies OUT', () {
//                               // Get.off(() => DisputeCenter2());
//                             }),
//                             _buildSubItem('Daily Operators', () {
//                               Get.off(
//                                 () => ReportLockSmithDailyOperatorScreen(),
//                               );
//                             }),
//                             _buildSubItem('Weekly Operators', () {
//                               Get.off(
//                                 () => ReportLockSmithWeeklyOperatorScreen(),
//                               );
//                             }),
//                             _buildSubItem('Monthly Operators', () {
//                               Get.off(
//                                 () => ReportLockSmithMonthlyOperatorScreen(),
//                               );
//                             }),
//                             _buildSubItem('Locksmith Revenue', () {
//                               Get.off(() => ReportLockSmithRevenueScreen());
//                             }),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                   Divider(color: kDividerColor),

//                   _buildExpandableItem(
//                     icon: Assets.imagesSetting,
//                     title: 'Management',

//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(left: 12.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             _buildSubItem('Locksmiths', () {
//                               Get.off(() => ManagmentAddLockSmithScreen());
//                             }),
//                             // _buildSubItem('View Locksmiths', () {
//                             //   Get.off(() => ManagmentViewLockSmithScreen());
//                             // }),
//                             _buildSubItem('Weekly Cancelled', () {
//                               // Get.off(() => DisputesLetterNewScreen());
//                             }),

//                             _buildSubItem(' Operators', () {
//                               Get.off(() => ManagmentAddOperatorScreen());
//                             }),
//                             // _buildSubItem('View Operators', () {
//                             //   Get.off(() => ManagmentOperatorScreen());
//                             // }),
//                             _buildSubItem(' Accountant', () {
//                               Get.off(() => ManagmentAccountantScreen());
//                             }),
//                             // _buildSubItem('View Accountants', () {
//                             //   Get.off(() => ManagmentViewAccountantScreen());
//                             // }),
//                             _buildSubItem('Companies', () {
//                               Get.off(() => ManagmentCompaniesScreen());
//                             }),
//                             _buildSubItem('Email addresses', () {
//                               Get.off(() => ManagmentEmailAddressScreen());
//                             }),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),

//                   Divider(color: kDividerColor),

//                   _buildItem(
//                     icon: Assets.imagesProfile,
//                     title: 'User Profile',
//                     onTap: () {
//                       Get.off(() => UserProfileScreen());
//                     },
//                   ),
//                   Gap(50),
//                 ],
//               ),
//             ),

//             // ✅ Logout Button
//             ListTile(
//               leading: CommonImageView(
//                 imagePath: Assets.imagesLogoutNew,
//                 height: 32,
//               ),
//               title: MyText(
//                 text: 'Logout',
//                 size: 18,
//                 color: kredColor,
//                 weight: FontWeight.w500,
//               ),
//               onTap: () {
//                 LogoutBottomSheet(context);
//               },
//             ),
//             const Gap(20),
//           ],
//         ),
//       ),
//     );
//   }

//   // ✅ Header Section
//   Widget _buildHeader() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 10),
//       child: Row(
//         children: [
//           CommonImageView(imagePath: Assets.imagesChatAvatar, height: 50),
//           const Gap(12),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: const [
//               MyText(
//                 text: 'Christopher H.',
//                 size: 20,
//                 weight: FontWeight.w600,
//                 letterSpacing: 0.5,
//                 paddingBottom: 5,
//               ),
//               MyText(
//                 text: 'christop234@gmail.com',
//                 size: 14,
//                 letterSpacing: 0.3,
//                 weight: FontWeight.w400,
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   // ✅ Standard Item
//   Widget _buildItem({
//     required String icon,
//     required String title,
//     required VoidCallback onTap,
//     Widget? trailing,
//   }) {
//     return ListTile(
//       leading: CommonImageView(imagePath: icon, height: 24),
//       title: MyText(text: title, size: 14, weight: FontWeight.w600),
//       trailing: trailing,
//       onTap: onTap,
//     );
//   }

//   // ✅ Expandable Section
//   Widget _buildExpandableItem({
//     required String icon,
//     required String title,
//     required List<Widget> children,
//   }) {
//     return Theme(
//       data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
//       child: ExpansionTile(
//         leading: CommonImageView(imagePath: icon, height: 32),
//         title: MyText(text: title, size: 14, weight: FontWeight.w600),
//         trailing: Icon(
//           isDisputesExpanded ? Icons.expand_less : Icons.expand_more,
//           color: kBlack,
//           size: 20,
//         ),
//         onExpansionChanged: (value) {
//           setState(() => isDisputesExpanded = value);
//         },
//         childrenPadding: const EdgeInsets.only(left: 20, bottom: 8),
//         children: children,
//       ),
//     );
//   }

//   // ✅ Sub-item for expandable menus
//   Widget _buildSubItem(String title, VoidCallback onTap) {
//     return Bounce(
//       onTap: onTap,
//       child: ListTile(
//         dense: true,
//         visualDensity: VisualDensity.compact,
//         contentPadding: EdgeInsets.only(left: 24),
//         title: MyText(
//           text: title,
//           size: 14,
//           color: kBlack,
//           weight: FontWeight.w400,
//         ),
//       ),
//     );
//   }
// }

// ignore_for_file: prefer_const_constructors
import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sync_mobile/constants/app_colors.dart';
import 'package:sync_mobile/constants/user_controller.dart';
import 'package:sync_mobile/generated/assets.dart';
import 'package:sync_mobile/views/screens/bottomsheets/bottom_sheets.dart';
import 'package:sync_mobile/views/screens/company_list/company_daily.dart';
import 'package:sync_mobile/views/screens/company_list/company_list.dart';
import 'package:sync_mobile/views/screens/company_list/company_weekly.dart';
import 'package:sync_mobile/views/screens/home/home.dart';
import 'package:sync_mobile/views/screens/management/accountants/management_accountant.dart';
import 'package:sync_mobile/views/screens/management/accountants/management_accountant_view.dart';
import 'package:sync_mobile/views/screens/management/companies.dart';
import 'package:sync_mobile/views/screens/management/email_address.dart';
import 'package:sync_mobile/views/screens/management/lock_smith/management_add_locksmith.dart';
import 'package:sync_mobile/views/screens/management/lock_smith/management_view_locksmith.dart';
import 'package:sync_mobile/views/screens/management/operator/management_add_operator.dart';
import 'package:sync_mobile/views/screens/management/operator/management_operator.dart';
import 'package:sync_mobile/views/screens/management/operator/management_operator_monthly.dart';
import 'package:sync_mobile/views/screens/management/operator/management_operator_weekly.dart';
import 'package:sync_mobile/views/screens/profile/profile_setting.dart';
import 'package:sync_mobile/views/screens/reports/lock_smith/report_locksmith.dart';
import 'package:sync_mobile/views/screens/reports/lock_smith/report_locksmith_daily_operator.dart';
import 'package:sync_mobile/views/screens/reports/lock_smith/report_locksmith_monthly_operator.dart';
import 'package:sync_mobile/views/screens/reports/lock_smith/report_locksmith_revenue.dart';
import 'package:sync_mobile/views/screens/reports/lock_smith/report_locksmith_weekly.dart';
import 'package:sync_mobile/views/screens/reports/lock_smith/report_locksmith_weekly_cancelled.dart';
import 'package:sync_mobile/views/screens/reports/lock_smith/report_locksmith_weekly_operator.dart';
import 'package:sync_mobile/views/screens/search/search.dart';
import 'package:sync_mobile/views/widget/common_image_view_widget.dart';
import 'package:sync_mobile/views/widget/my_text_widget.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  bool isDisputesExpanded = false;

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.find<UserController>();
    final String role = userController.userRole.value; // role check

    return Drawer(
      backgroundColor: kWhite,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(60),
            _buildHeader(),
            Gap(20),
            const Divider(height: 1, color: Colors.black12),
            Gap(16),

            // ✅ Drawer Items
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  _buildItem(
                    icon: Assets.imagesHome,
                    title: 'Home',
                    onTap: () {
                      Get.off(
                        () =>
                            HomeScreen(userRole: userController.userRole.value),
                      );
                    },
                  ),
                  Divider(color: kDividerColor),

                  _buildItem(
                    icon: Assets.imagesSearchBlack,
                    title: 'Search Jobs',
                    onTap: () => Get.off(() => SearchJobScreen()),
                  ),
                  Divider(color: kDividerColor),

                  // Only show for owner
                  if (role == 'owner') ...[
                    _buildExpandableItem(
                      icon: Assets.imagesPeople,
                      title: 'Company Report',
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildSubItem('Company List', () {
                                Get.off(() => CompanyListScreen());
                              }),
                              _buildSubItem('Daily company', () {
                                Get.off(() => CompanyDailyScreen());
                              }),
                              _buildSubItem('Weekly Company', () {
                                Get.off(() => CompanyWeeklyScreen());
                              }),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Divider(color: kDividerColor),

                    _buildExpandableItem(
                      icon: Assets.imagesBook,
                      title: 'Reports',
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildSubItem('Daily Locksmiths', () {
                                Get.off(() => ReportLockSmithScreen());
                              }),
                              _buildSubItem('Weekly Locksmiths', () {
                                Get.off(() => ReportLockSmithWeeklyScreen());
                              }),
                              _buildSubItem('Weekly Cancelled', () {
                                Get.off(() => ReportLockSmithWeekCancelScreen());
                              }),
                              _buildSubItem('Weekly Companies IN', () {}),
                              _buildSubItem('Weekly Companies OUT', () {}),
                              _buildSubItem('Daily Operators', () {
                                Get.off(
                                  () => ReportLockSmithDailyOperatorScreen(),
                                );
                              }),
                              _buildSubItem('Weekly Operators', () {
                                Get.off(
                                  () => ReportLockSmithWeeklyOperatorScreen(),
                                );
                              }),
                              _buildSubItem('Monthly Operators', () {
                                Get.off(
                                  () => ReportLockSmithMonthlyOperatorScreen(),
                                );
                              }),
                              _buildSubItem('Locksmith Revenue', () {
                                Get.off(() => ReportLockSmithRevenueScreen());
                              }),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Divider(color: kDividerColor),

                    _buildExpandableItem(
                      icon: Assets.imagesSetting,
                      title: 'Management',
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildSubItem('Locksmiths', () {
                                Get.off(() => ManagmentAddLockSmithScreen());
                              }),
                              _buildSubItem('Weekly Cancelled', () {}),
                              _buildSubItem('Operators', () {
                                Get.off(() => ManagmentAddOperatorScreen());
                              }),
                              _buildSubItem('Accountant', () {
                                Get.off(() => ManagmentAccountantScreen());
                              }),
                              _buildSubItem('Companies', () {
                                Get.off(() => ManagmentCompaniesScreen());
                              }),
                              _buildSubItem('Email addresses', () {
                                Get.off(() => ManagmentEmailAddressScreen());
                              }),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Divider(color: kDividerColor),
                  ],

                  _buildItem(
                    icon: Assets.imagesProfile,
                    title: 'User Profile',
                    onTap: () {
                      Get.off(() => UserProfileScreen());
                    },
                  ),
                  Gap(50),
                ],
              ),
            ),

            // ✅ Logout Button
            ListTile(
              leading: CommonImageView(
                imagePath: Assets.imagesLogoutNew,
                height: 32,
              ),
              title: MyText(
                text: 'Logout',
                size: 18,
                color: kredColor,
                weight: FontWeight.w500,
              ),
              onTap: () {
                LogoutBottomSheet(context);
              },
            ),
            const Gap(20),
          ],
        ),
      ),
    );
  }

  // ✅ Header Section
  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          CommonImageView(imagePath: Assets.imagesChatAvatar, height: 50),
          const Gap(12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              MyText(
                text: 'Christopher H.',
                size: 20,
                weight: FontWeight.w600,
                letterSpacing: 0.5,
                paddingBottom: 5,
              ),
              MyText(
                text: 'christop234@gmail.com',
                size: 14,
                letterSpacing: 0.3,
                weight: FontWeight.w400,
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ✅ Standard Item
  Widget _buildItem({
    required String icon,
    required String title,
    required VoidCallback onTap,
    Widget? trailing,
  }) {
    return ListTile(
      leading: CommonImageView(imagePath: icon, height: 24),
      title: MyText(text: title, size: 14, weight: FontWeight.w600),
      trailing: trailing,
      onTap: onTap,
    );
  }

  // ✅ Expandable Section
  Widget _buildExpandableItem({
    required String icon,
    required String title,
    required List<Widget> children,
  }) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        leading: CommonImageView(imagePath: icon, height: 32),
        title: MyText(text: title, size: 14, weight: FontWeight.w600),
        trailing: Icon(
          isDisputesExpanded ? Icons.expand_less : Icons.expand_more,
          color: kBlack,
          size: 20,
        ),
        onExpansionChanged: (value) {
          setState(() => isDisputesExpanded = value);
        },
        childrenPadding: const EdgeInsets.only(left: 20, bottom: 8),
        children: children,
      ),
    );
  }

  // ✅ Sub-item for expandable menus
  Widget _buildSubItem(String title, VoidCallback onTap) {
    return Bounce(
      onTap: onTap,
      child: ListTile(
        dense: true,
        visualDensity: VisualDensity.compact,
        contentPadding: EdgeInsets.only(left: 24),
        title: MyText(
          text: title,
          size: 14,
          color: kBlack,
          weight: FontWeight.w400,
        ),
      ),
    );
  }
}
