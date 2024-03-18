import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:waste_track/App%20Routes/app_routes.dart';
import 'package:waste_track/Conrollers/Authentication%20Controller/profile_controller.dart';
import 'package:waste_track/Utils/Components/app_font.dart';
import 'package:waste_track/Utils/Components/dataStroage_database.dart';
import 'package:waste_track/Utils/Components/icon_card.dart';
import 'package:waste_track/Utils/Components/shimmer.dart';
import 'package:waste_track/Utils/colors/app_colors.dart';
import 'package:waste_track/Utils/images/images.dart';

import '../../../API Integration/API URL endpoints/api_endpoints.dart';
import '../../../Conrollers/Authentication Controller/authentication_controller.dart';
import '../../../Utils/Components/myShimmer.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init:ProfileController(context: context),
        builder: (controller) =>
        controller.model?.data == null ? myShimmer(): Padding(
          padding: EdgeInsets.all(15),
           child: SingleChildScrollView(
            child: Column(
            children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(2),
                  // clipBehavior: Clip.hardEdge,
                  height: 120,
                  width: 120,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network("${Endpoints.imageUrl}${controller.model!.data!.imageName}",fit: BoxFit.cover,)),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(
                      "${controller.model?.data?.firstName}",
                      style: TextStyle(
                          color: AppColor.black,
                          fontSize: 13,
                          fontFamily: AppFont.poppinsBold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "${controller.model?.data?.roleInfo?.roleName}",
                      style: TextStyle(
                          color: AppColor.black.withOpacity(0.9),
                          fontSize: 13,
                          fontFamily: AppFont.poppinsRegular),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Joined ${"${controller.model!.data!.joinDate}"}",
                      style: TextStyle(
                          color: AppColor.black.withOpacity(0.4),
                          fontSize: 12,
                          fontFamily: AppFont.poppinsRegular),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Profile",
                  style: TextStyle(
                      color: AppColor.black,
                      fontSize: 15,
                      fontFamily: AppFont.poppinsBold),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AppScreen.editProfileScreen,arguments: controller.model!.data!);
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          iconCard(
                              color: AppColor.pinkLight.withOpacity(0.2),
                              icon: Icon(
                                Icons.person_2_outlined,
                                color: AppColor.pinkDark,
                              ),
                              height: 50,
                              width: 50,
                              radius: 30),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "Edit Profile",
                            style: TextStyle(
                                color: AppColor.black,
                                fontSize: 15,
                                fontFamily: AppFont.poppinsSemiBold),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                            padding: EdgeInsets.all(9),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: AppColor.grey1.withOpacity(0.1)),
                            child: const Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: AppColor.black,
                              size: 17,
                            )),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, AppScreen.changePassword);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Settings",
                    style: TextStyle(
                        color: AppColor.black,
                        fontSize: 15,
                        fontFamily: AppFont.poppinsBold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          iconCard(
                              color: AppColor.purpleLight.withOpacity(0.2),
                              icon: Icon(
                                Icons.lock_outlined,
                                color: AppColor.midPurpleDark,
                              ),
                              height: 50,
                              width: 50,
                              radius: 30),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "Change Password",
                            style: TextStyle(
                                color: AppColor.black,
                                fontSize: 15,
                                fontFamily: AppFont.poppinsSemiBold),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Container(
                            padding: EdgeInsets.all(9),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: AppColor.grey1.withOpacity(0.1)),
                            child: const Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: AppColor.black,
                              size: 17,
                            )),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                          context, AppScreen.notificationScreen);
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            iconCard(
                                color: AppColor.blueLight.withOpacity(0.2),
                                icon: Icon(
                                  Icons.notifications_none,
                                  color: AppColor.blueDark,
                                ),
                                height: 50,
                                width: 50,
                                radius: 30),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              "Notifications",
                              style: TextStyle(
                                  color: AppColor.black,
                                  fontSize: 15,
                                  fontFamily: AppFont.poppinsSemiBold),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Container(
                              padding: EdgeInsets.all(9),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: AppColor.grey1.withOpacity(0.1)),
                              child: const Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: AppColor.black,
                                size: 17,
                              )),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return CupertinoAlertDialog(
                            title: Column(
                              children: [
                                Text(
                                  "Are you sure you want to Reset this Ticket?",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: AppColor.black),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(9),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(7),
                                          color: AppColor.green,
                                        ),
                                        child: Text(
                                          'Cancel',
                                          style: TextStyle(
                                              fontFamily:
                                              AppFont.poppinsLight,
                                              fontSize: 15,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        getSignOut();
                                        //await SharedPreferences.getInstance();
                                       Navigator.pushNamed(context,AppScreen.login);
                                      },
                                      child: Container(
                                        padding: EdgeInsets.only(
                                            left: 20,
                                            right: 20,
                                            bottom: 10,
                                            top: 10),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(7),
                                          color: AppColor.green,
                                        ),
                                        child: Center(
                                          child: Text(
                                            'yes',
                                            style: TextStyle(
                                                fontFamily:
                                                AppFont.poppinsLight,
                                                fontSize: 15,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ), // show pop-up
                          );
                        },
                      );


                    },
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: AppColor.redLight.withOpacity(0.2)),
                          child: Image.asset(
                            height: 27,
                            AppImages.logout,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "Sign Out",
                          style: TextStyle(
                              color: AppColor.black,
                              fontSize: 15,
                              fontFamily: AppFont.poppinsSemiBold),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }


  getSignOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool("isLoggedIn", false);
  }
  Widget listTile(
      {Widget? leading,
      required Widget title,
      double height = 30,
      double width = 30,
      required void Function()? onPressed}) {
    return ListTile(
      onTap: onPressed,
      leading: leading,
      title: title,
      trailing: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: AppColor.grey1.withOpacity(0.1)),
        child: IconButton(
            onPressed: onPressed,
            icon: const Icon(
              Icons.arrow_forward_ios_rounded,
              color: AppColor.black,
              size: 17,
            )),
      ),
    );
  }

  // listTile(
  //                 title: Row(
  //                   children: [
  //                     iconCard(
  //                         color: AppColor.pinkLight.withOpacity(0.2),
  //                         icon: Icon(
  //                           Icons.person_2_outlined,
  //                           color: AppColor.pinkDark,
  //                         ),
  //                         height: 60,
  //                         width: 60,
  //                         radius: 30),
  //                     const SizedBox(
  //                       width: 10,
  //                     ),
  //                     const Text(
  //                       "Edit Profile",
  //                       style: TextStyle(
  //                           color: AppColor.black,
  //                           fontSize: 16,
  //                           fontFamily: AppFont.poppinsSemiBold),
  //                     )
  //                   ],
  //                 ),
  //                 onPressed: () {
  //                   Navigator.pushNamed(context, AppScreen.editProfileScreen);
  //                 },
  //               ),
}
