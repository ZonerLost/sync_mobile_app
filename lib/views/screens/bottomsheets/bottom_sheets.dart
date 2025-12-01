// ignore_for_file: non_constant_identifier_names

import 'package:bounce/bounce.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:sync_mobile/constants/app_colors.dart';
import 'package:sync_mobile/generated/assets.dart';
import 'package:sync_mobile/views/screens/auth/login.dart';
import 'package:sync_mobile/views/screens/auth/reset_password.dart';
import 'package:sync_mobile/views/widget/common_image_view_widget.dart';
import 'package:sync_mobile/views/widget/custom_dropdown.dart';
import 'package:sync_mobile/views/widget/double_white_contianers.dart';
import 'package:sync_mobile/views/widget/my_button_new.dart';
import 'package:sync_mobile/views/widget/my_text_widget.dart';
import 'package:sync_mobile/views/widget/my_textfeild.dart';

void showAccountCreatedBottomSheet(BuildContext context) {
  Get.bottomSheet(
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    enableDrag: false,
    DoubleWhiteContainers(
      height: 550,
      mainColor: kWhite3,
      topColor: kWhite,
      handleHeight: 14,

      borderRadius: BorderRadius.circular(24),

      child: Container(
        decoration: const BoxDecoration(
          // color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom + 24,
            top: 48,
            left: 10,
            right: 10,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Golden Circle + Checkmark
              Center(
                child: CommonImageView(
                  imagePath: Assets.imagesEmailSend, // golden checkmark asset
                  height: 150,
                ),
              ),
              const Gap(32),

              // Title
              const MyText(
                text: "Account Created",
                size: 26,
                weight: FontWeight.w700,
                color: Colors.black,
                textAlign: TextAlign.center,
              ),
              const Gap(16),

              // Subtitle
              const MyText(
                text:
                    "You have successfully created your account. You are only one step away for completing your account.",
                size: 16,
                color: kSubText2,
                weight: FontWeight.w400,
                textAlign: TextAlign.center,
              ),
              const Gap(32),

              // Done Button
              MyButton(
                onTap: () {},
                buttonText: "Done",
                fontColor: Colors.white,
                height: 56,
                radius: 28,
                hasgrad: false,
                fontSize: 17,
              ),
              const Gap(20),
            ],
          ),
        ),
      ),
    ),
  );
}

void emailSendBottomSheet(BuildContext context) {
  Get.bottomSheet(
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    enableDrag: false,
    DoubleWhiteContainers(
      height: 550,
      mainColor: kWhite3,
      topColor: kWhite,
      handleHeight: 14,

      borderRadius: BorderRadius.circular(24),

      child: Container(
        decoration: const BoxDecoration(
          // color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom + 24,
            top: 48,
            left: 10,
            right: 10,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Golden Circle + Checkmark
              Center(
                child: CommonImageView(
                  imagePath: Assets.imagesEmailSend, // golden checkmark asset
                  height: 150,
                ),
              ),
              const Gap(32),

              // Title
              const MyText(
                text: "Mail Sent !",
                size: 26,
                weight: FontWeight.w700,
                color: Colors.black,
                textAlign: TextAlign.center,
              ),
              const Gap(16),

              // Subtitle
              const MyText(
                text:
                    "We have sent an mail on your given email address. Please verify and reset your password.",
                size: 14,
                color: kSubText2,
                weight: FontWeight.w400,
                textAlign: TextAlign.center,
              ),
              const Gap(30),

              // Done Button
              MyButton(
                onTap: () {
                  Get.back();
                  Get.to(() => ResetPasswordScreen());
                },
                buttonText: "Check email",
                fontColor: Colors.white,
                height: 56,
                radius: 28,
                hasgrad: false,
                fontSize: 17,
              ),
              const Gap(20),
            ],
          ),
        ),
      ),
    ),
  );
}

void LogoutBottomSheet(BuildContext context) {
  Get.bottomSheet(
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    enableDrag: true,
    StatefulBuilder(
      builder: (context, setState) {
        return DoubleWhiteContainers(
          height: 500,
          mainColor: kWhite3,
          topColor: kWhite,
          handleHeight: 14,
          borderRadius: BorderRadius.circular(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Gap(20),
              CommonImageView(imagePath: Assets.imagesLogout, height: 150),
              const Gap(42),
              const MyText(
                textAlign: TextAlign.center,
                text: "Logout?",
                size: 24,
                weight: FontWeight.w700,
                color: Colors.black,
              ),
              const Gap(10),
              const MyText(
                text: "Are you sure want to logout from this app?",
                size: 16,
                textAlign: TextAlign.center,

                color: kSubText2,
                weight: FontWeight.w400,
              ),
              const Gap(40),

              MyButton(
                onTap: () {
                  Get.offAll(() => LoginScreen());
                },
                buttonText: "Yes, Logout",
                fontColor: Colors.white,
                height: 56,
                radius: 28,
                hasgrad: false,
                fontSize: 17,
              ),
              const Gap(20),
            ],
          ),
        );
      },
    ),
  );
}

void showAddCompanyBottomSheet(BuildContext context) {
  final TextEditingController companyNameController = TextEditingController();
  String selectedCommission = "55%";
  Get.bottomSheet(
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    enableDrag: true,
    StatefulBuilder(
      builder: (context, setState) {
        return DoubleWhiteContainers(
          height: 550,
          mainColor: kbackground,
          topColor: kWhite,
          handleHeight: 14,
          borderRadius: BorderRadius.circular(24),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Bounce(
                  onTap: () => Get.back(),
                  child: Row(
                    children: [
                      Icon(Icons.arrow_back, color: kBlack, size: 24),
                      const Gap(8),
                      const MyText(
                        text: "Back",
                        size: 16,
                        weight: FontWeight.w500,
                        color: kBlack,
                      ),
                    ],
                  ),
                ),
                const Gap(24),

                // Title
                const MyText(
                  text: "Add Company",
                  size: 18,
                  weight: FontWeight.w700,
                  color: kBlack,
                ),
                const Gap(8),
                const MyText(
                  text: "Please add the information to add new company.",
                  size: 14,
                  color: kSubText2,
                  weight: FontWeight.w400,
                ),
                const Gap(12),
                Divider(),
                const Gap(12),
                // Company Name
                const MyText(
                  text: "Company name",
                  size: 12,
                  weight: FontWeight.w500,
                  color: kBlack200,
                ),
                const Gap(8),
                MyTextField(
                  backgroundColor: kWhite,
                  hintColor: kSubText2,
                  hintsize: 16,
                  hintWeight: FontWeight.w400,
                  hint: "Enter your company name...",
                  controller: companyNameController,
                ),

                // Commission
                const MyText(
                  text: "Commission",
                  size: 12,
                  color: kBlack200,
                  weight: FontWeight.w500,
                ),
                const Gap(8),
                CustomDropDown2(
                  hint: "Select Commission",
                  selectedValue: selectedCommission,
                  items: const [
                    "5%",
                    "10%",
                    "15%",
                    "20%",
                    "25%",
                    "30%",
                    "35%",
                    "40%",
                    "45%",
                    "50%",
                    "55%",
                    "60%",
                    "65%",
                    "70%",
                    "75%",
                    "80%",
                    "85%",
                    "90%",
                    "95%",
                    "100%",
                  ],
                  onChanged: (value) {
                    setState(() {
                      selectedCommission = value.toString();
                    });
                  },
                  bgColor: kWhite,
                ),
                const Gap(20),

                // Save Button
                MyButton(
                  onTap: () {
                    // Handle save logic
                    Get.back();
                  },
                  buttonText: "Save",
                  choiceIconRight: Assets.imagesRightArrowUpdate,
                  radius: 30,
                  hasiconRight: true,
                  isRight: true,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  backgroundColor: kPrimaryColor,
                  fontColor: kWhite,
                  height: 60,
                ),
                const Gap(20),
              ],
            ),
          ),
        );
      },
    ),
  );
}

void DeleteBottomSheet(BuildContext context) {
  Get.bottomSheet(
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    enableDrag: true,
    StatefulBuilder(
      builder: (context, setState) {
        return DoubleWhiteContainers(
          height: 500,
          mainColor: kWhite3,
          topColor: kWhite,
          handleHeight: 14,
          borderRadius: BorderRadius.circular(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Gap(20),
              CommonImageView(
                imagePath: Assets.imagesDeleteBottomsheet,
                height: 150,
              ),
              const Gap(42),
              const MyText(
                textAlign: TextAlign.center,
                text: "Delete User",
                size: 24,
                weight: FontWeight.w700,
                color: Colors.black,
              ),
              const Gap(10),
              const MyText(
                text: "Are you sure want to delete this company?",
                size: 16,
                textAlign: TextAlign.center,

                color: kSubText2,
                weight: FontWeight.w400,
              ),
              const Gap(40),

              MyButton(
                onTap: () {
                  Get.back();
                },
                buttonText: "Yes, Delete",
                fontColor: Colors.white,
                height: 56,
                backgroundColor: kSecondaryRedColor,
                choiceIconRight: Assets.imagesRightArrowUpdate,
                radius: 30,
                hasiconRight: true,
                isRight: true,
                hasgrad: false,
                fontSize: 17,
              ),
              const Gap(20),
            ],
          ),
        );
      },
    ),
  );
}

void showAddLockSmithBottomSheet(BuildContext context) {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  String selectedSalaryProfile = "30%";

  Get.bottomSheet(
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    enableDrag: true,
    StatefulBuilder(
      builder: (context, setState) {
        return DoubleWhiteContainers(
          height: 650,
          mainColor: kbackground,
          topColor: kWhite,
          handleHeight: 14,
          borderRadius: BorderRadius.circular(24),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Bounce(
                    onTap: () => Get.back(),
                    child: Row(
                      children: [
                        Icon(Icons.arrow_back, color: kBlack, size: 24),
                        const Gap(8),
                        const MyText(
                          text: "Back",
                          size: 16,
                          weight: FontWeight.w500,
                          color: kBlack,
                        ),
                      ],
                    ),
                  ),
                  const Gap(24),

                  // Title
                  const MyText(
                    text: "Add a new lock smith",
                    size: 18,
                    weight: FontWeight.w700,
                    color: kBlack,
                  ),
                  const Gap(8),
                  const MyText(
                    text: "Please add the information to add new lock smith.",
                    size: 14,
                    color: kSubText2,
                    weight: FontWeight.w400,
                  ),
                  const Gap(12),
                  Divider(),
                  const Gap(12),

                  // First Name
                  const MyText(
                    text: "First name",
                    size: 12,
                    weight: FontWeight.w500,
                    color: kBlack200,
                  ),
                  const Gap(8),
                  MyTextField(
                    backgroundColor: kWhite,
                    hintColor: kSubText2,
                    hintsize: 16,
                    hintWeight: FontWeight.w400,
                    hint: "enter your first name...",
                    controller: firstNameController,
                  ),
                  const Gap(12),

                  // Last Name
                  const MyText(
                    text: "Last name",
                    size: 12,
                    weight: FontWeight.w500,
                    color: kBlack200,
                  ),
                  const Gap(8),
                  MyTextField(
                    backgroundColor: kWhite,
                    hintColor: kSubText2,
                    hintsize: 16,
                    hintWeight: FontWeight.w400,
                    hint: "enter your last name ...",
                    controller: lastNameController,
                  ),
                  const Gap(12),

                  // Email Address
                  const MyText(
                    text: "Email address",
                    size: 12,
                    weight: FontWeight.w500,
                    color: kBlack200,
                  ),
                  const Gap(8),
                  MyTextField(
                    backgroundColor: kWhite,
                    hintColor: kSubText2,
                    hintsize: 16,
                    hintWeight: FontWeight.w400,
                    hint: "enter your email address ...",
                    controller: emailController,
                  ),
                  const Gap(12),

                  // Phone Number
                  const MyText(
                    text: "Phone number",
                    size: 12,
                    weight: FontWeight.w500,
                    color: kBlack200,
                  ),
                  const Gap(8),
                  MyTextField(
                    backgroundColor: kWhite,
                    hintColor: kSubText2,
                    hintsize: 16,
                    hintWeight: FontWeight.w400,
                    hint: "enter your phone number ...",
                    controller: phoneController,
                  ),
                  const Gap(12),

                  // Salary Profile
                  const MyText(
                    text: "Salary Profile",
                    size: 12,
                    color: kBlack200,
                    weight: FontWeight.w500,
                  ),
                  const Gap(8),
                  CustomDropDown2(
                    hint: "Select Salary Profile",
                    selectedValue: selectedSalaryProfile,
                    items: const [
                      "5%",
                      "10%",
                      "15%",
                      "20%",
                      "25%",
                      "30%",
                      "35%",
                      "40%",
                      "45%",
                      "50%",
                      "55%",
                      "60%",
                      "65%",
                      "70%",
                      "75%",
                      "80%",
                      "85%",
                      "90%",
                      "95%",
                      "100%",
                    ],
                    onChanged: (value) {
                      setState(() {
                        selectedSalaryProfile = value.toString();
                      });
                    },
                    bgColor: kWhite,
                  ),
                  const Gap(20),

                  // Save Button
                  MyButton(
                    onTap: () {
                      // Handle save logic
                      Get.back();
                    },
                    buttonText: "Save",
                    choiceIconRight: Assets.imagesRightArrowUpdate,
                    radius: 30,
                    hasiconRight: true,
                    isRight: true,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    backgroundColor: kPrimaryColor,
                    fontColor: kWhite,
                    height: 60,
                  ),
                  const Gap(20),
                ],
              ),
            ),
          ),
        );
      },
    ),
  );
}

void showAddOperatorBottomSheet(BuildContext context) {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  Get.bottomSheet(
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    enableDrag: true,
    StatefulBuilder(
      builder: (context, setState) {
        return DoubleWhiteContainers(
          height: 600,
          mainColor: kbackground,
          topColor: kWhite,
          handleHeight: 14,
          borderRadius: BorderRadius.circular(24),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Bounce(
                    onTap: () => Get.back(),
                    child: Row(
                      children: [
                        Icon(Icons.arrow_back, color: kBlack, size: 24),
                        const Gap(8),
                        const MyText(
                          text: "Back",
                          size: 16,
                          weight: FontWeight.w500,
                          color: kBlack,
                        ),
                      ],
                    ),
                  ),
                  const Gap(24),

                  // Title
                  const MyText(
                    text: "Add a new operator",
                    size: 18,
                    weight: FontWeight.w700,
                    color: kBlack,
                  ),
                  const Gap(8),
                  const MyText(
                    text: "Please add the information to add new lock smith.",
                    size: 14,
                    color: kSubText2,
                    weight: FontWeight.w400,
                  ),
                  const Gap(12),
                  Divider(),
                  const Gap(12),

                  // First Name
                  const MyText(
                    text: "First name",
                    size: 12,
                    weight: FontWeight.w500,
                    color: kBlack200,
                  ),
                  const Gap(8),
                  MyTextField(
                    backgroundColor: kWhite,
                    hintColor: kSubText2,
                    hintsize: 16,
                    hintWeight: FontWeight.w400,
                    hint: "enter your first name...",
                    controller: firstNameController,
                  ),
                  const Gap(12),

                  // Last Name
                  const MyText(
                    text: "Last name",
                    size: 12,
                    weight: FontWeight.w500,
                    color: kBlack200,
                  ),
                  const Gap(8),
                  MyTextField(
                    backgroundColor: kWhite,
                    hintColor: kSubText2,
                    hintsize: 16,
                    hintWeight: FontWeight.w400,
                    hint: "enter your last name ...",
                    controller: lastNameController,
                  ),
                  const Gap(12),

                  // Email Address
                  const MyText(
                    text: "Email address",
                    size: 12,
                    weight: FontWeight.w500,
                    color: kBlack200,
                  ),
                  const Gap(8),
                  MyTextField(
                    backgroundColor: kWhite,
                    hintColor: kSubText2,
                    hintsize: 16,
                    hintWeight: FontWeight.w400,
                    hint: "enter your email address ...",
                    controller: emailController,
                  ),
                  const Gap(12),

                  // Phone Number
                  const MyText(
                    text: "Phone number",
                    size: 12,
                    weight: FontWeight.w500,
                    color: kBlack200,
                  ),
                  const Gap(8),
                  MyTextField(
                    backgroundColor: kWhite,
                    hintColor: kSubText2,
                    hintsize: 16,
                    hintWeight: FontWeight.w400,
                    hint: "enter your phone number ...",
                    controller: phoneController,
                  ),
                  const Gap(20),

                  // Save Button
                  MyButton(
                    onTap: () {
                      // Handle save logic
                      Get.back();
                    },
                    buttonText: "Save",
                    choiceIconRight: Assets.imagesRightArrowUpdate,
                    radius: 30,
                    hasiconRight: true,
                    isRight: true,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    backgroundColor: kPrimaryColor,
                    fontColor: kWhite,
                    height: 60,
                  ),
                  const Gap(20),
                ],
              ),
            ),
          ),
        );
      },
    ),
  );
}

void showJobListBottomSheet(BuildContext context, {String? date}) {
  // All jobs data
  final List<Map<String, dynamic>> jobs = [
    {
      'postCode': 'RM15 4YE',
      'operatorName': 'Cosmin Operators',
      'companyName': 'R Locksmith',
      'status': 'Completed',
      'price': '£2000.00',
      'initial': 'R',
      'onTap': () {
        print('Job 1 tapped');
      },
    },
    {
      'postCode': 'RM15 4YE',
      'operatorName': 'Cosmin Operators',
      'companyName': 'R Locksmith',
      'status': 'Completed',
      'price': '£2000.00',
      'initial': 'R',
      'onTap': () {
        print('Job 2 tapped');
      },
    },
    {
      'postCode': 'RM15 4YE',
      'operatorName': 'Cosmin Operators',
      'companyName': 'R Locksmith',
      'status': 'Completed',
      'price': '£2000.00',
      'initial': 'R',
      'onTap': () {
        print('Job 3 tapped');
      },
    },
    {
      'postCode': 'RM15 4YE',
      'operatorName': 'Cosmin Operators',
      'companyName': 'R Locksmith',
      'status': 'Completed',
      'price': '£2000.00',
      'initial': 'R',
      'onTap': () {
        print('Job 4 tapped');
      },
    },
    {
      'postCode': 'RM15 4YE',
      'operatorName': 'Cosmin Operators',
      'companyName': 'R Locksmith',
      'status': 'Completed',
      'price': '£2000.00',
      'initial': 'R',
      'onTap': () {
        print('Job 5 tapped');
      },
    },
    {
      'postCode': 'RM16 5ZX',
      'operatorName': 'John Smith',
      'companyName': 'A Locksmith',
      'status': 'Pending',
      'price': '£1500.00',
      'initial': 'A',
      'onTap': () {
        print('Job 6 tapped');
      },
    },
    {
      'postCode': 'RM17 6AB',
      'operatorName': 'Jane Doe',
      'companyName': 'B Locksmith',
      'status': 'Completed',
      'price': '£1800.00',
      'initial': 'B',
      'onTap': () {
        print('Job 7 tapped');
      },
    },
    {
      'postCode': 'RM18 7CD',
      'operatorName': 'Mike Wilson',
      'companyName': 'C Locksmith',
      'status': 'Cancelled',
      'price': '£2200.00',
      'initial': 'C',
      'onTap': () {
        print('Job 8 tapped');
      },
    },
  ];

  Get.bottomSheet(
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    enableDrag: true,
    StatefulBuilder(
      builder: (context, setState) {
        return DoubleWhiteContainers(
          height: MediaQuery.of(context).size.height * 0.9,
          mainColor: kbackground,
          topColor: kWhite,
          handleHeight: 14,
          borderRadius: BorderRadius.circular(24),
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Back Button
                Bounce(
                  onTap: () => Get.back(),
                  child: Row(
                    children: [
                      Icon(Icons.arrow_back, color: kBlack, size: 24),
                      const Gap(8),
                      const MyText(
                        text: "Back",
                        size: 16,
                        weight: FontWeight.w500,
                        color: kBlack,
                      ),
                    ],
                  ),
                ),
                const Gap(24),

                // Date Header
                MyText(
                  text: date ?? 'November 23, 2025',
                  size: 16,
                  weight: FontWeight.w600,
                  color: kBlack,
                ),
                const Gap(16),

                // Job List - Scrollable
                Expanded(
                  child: ListView.separated(
                    padding: EdgeInsets.all(0),
                    physics: const BouncingScrollPhysics(),
                    itemCount: jobs.length,
                    separatorBuilder: (context, index) => const Gap(20),
                    itemBuilder: (context, index) {
                      final job = jobs[index];
                      return JobListItem(
                        postCode: job['postCode'],
                        operatorName: job['operatorName'],
                        companyName: job['companyName'],
                        status: job['status'],
                        price: job['price'],
                        initial: job['initial'],
                        onTap: job['onTap'],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}

class JobListItem extends StatelessWidget {
  final String postCode;
  final String operatorName;
  final String companyName;
  final String status;
  final String price;
  final String initial;
  final VoidCallback? onTap;

  const JobListItem({
    super.key,
    required this.postCode,
    required this.operatorName,
    required this.companyName,
    required this.status,
    required this.price,
    required this.initial,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Bounce(
      onTap: onTap ?? () {},
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: kWhite,

          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Row(
              children: [
                // Avatar with Initial
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: kPrimaryColor.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: MyText(
                      text: initial,
                      size: 20,
                      weight: FontWeight.w700,
                      color: kPrimaryColor,
                    ),
                  ),
                ),
                const Gap(16),

                // Post Code and Operator
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(
                        text: postCode,
                        size: 18,
                        weight: FontWeight.w600,
                        color: kBlack,
                      ),
                      const Gap(4),
                      MyText(
                        text: operatorName,
                        size: 14,
                        weight: FontWeight.w400,
                        color: kBlack200,
                      ),
                    ],
                  ),
                ),

                // Arrow Icon
                Icon(Icons.chevron_right, color: kBlack, size: 24),
              ],
            ),
            const Gap(6),

            // Divider
            Divider(thickness: 1),
            const Gap(6),

            // Bottom Row - Company, Status, Price
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Company Job
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const MyText(
                        text: "Company Job",
                        size: 12,
                        weight: FontWeight.w400,
                        color: kBlack200,
                      ),
                      const Gap(4),
                      MyText(
                        text: companyName,
                        size: 16,
                        weight: FontWeight.w600,
                        color: kBlack,
                      ),
                    ],
                  ),
                ),

                // Status
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const MyText(
                        text: "Status",
                        size: 12,
                        weight: FontWeight.w400,
                        color: kBlack200,
                      ),
                      const Gap(4),
                      MyText(
                        text: status,
                        size: 16,
                        weight: FontWeight.w600,
                        color: kPrimaryColor,
                      ),
                    ],
                  ),
                ),

                // Price
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const MyText(
                        text: "Price",
                        size: 12,
                        weight: FontWeight.w400,
                        color: kBlack200,
                      ),
                      const Gap(4),
                      MyText(
                        text: price,
                        size: 16,
                        weight: FontWeight.w600,
                        color: kPrimaryColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
