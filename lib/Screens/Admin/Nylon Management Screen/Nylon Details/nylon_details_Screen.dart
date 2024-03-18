import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:waste_track/App%20Routes/app_routes.dart';
import 'package:waste_track/Conrollers/Admin/User%20Management%20Controller/user_management_controller.dart';
import 'package:waste_track/Utils/Components/Search%20Text%20Field/custom_search_text_field.dart';
import 'package:waste_track/Utils/Components/app_font.dart';
import 'package:waste_track/Utils/Components/custom_radio_button.dart';
import 'package:waste_track/Utils/behavior.dart';
import 'package:waste_track/Utils/colors/app_colors.dart';
import 'package:waste_track/Utils/images/images.dart';

class NylonDetails extends StatefulWidget {
  const NylonDetails({super.key});

  @override
  State<NylonDetails> createState() => _NylonDetailsState();
}

class _NylonDetailsState extends State<NylonDetails>
    with SingleTickerProviderStateMixin {
  bool isButtonSelected = false;
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  final controller = Get.put(NylonManagementDetailsVisibilityController());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 7, left: 18),
            child: Row(
              children: [
                Flexible(
                  child: CustomSearchTextField(
                    hintText: 'Search  here...',
                    hintStyle: TextStyle(
                        fontSize: 12, color: AppColor.grey1.withOpacity(0.5)),
                    suffixIcon: Icon(
                      Icons.search,
                      color: AppColor.green,
                    ),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(25.0),
                        ),
                      ),
                      backgroundColor: Colors.white,
                      builder: (BuildContext context) {
                        return Wrap(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(
                                              AppImages.union,
                                              height: 15,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            const Text(
                                              "Filter By",
                                              style: TextStyle(
                                                  fontFamily:
                                                      AppFont.poppinsSemiBold),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20,
                                            right: 20,
                                            top: 10,
                                            bottom: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Batch Number'),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            CustomRadioButton(
                                              isSelected: isButtonSelected,
                                              onChanged: (value) {
                                                setState(() {
                                                  isButtonSelected = value;
                                                });
                                              },
                                            )
                                          ],
                                        ),
                                      ),
                                      Divider(
                                        color: Colors.black.withOpacity(0.59),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20,
                                            right: 20,
                                            top: 10,
                                            bottom: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Vendor Code'),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            CustomRadioButton(
                                              isSelected: isButtonSelected,
                                              onChanged: (value) {
                                                setState(() {
                                                  isButtonSelected = value;
                                                });
                                              },
                                            )
                                          ],
                                        ),
                                      ),
                                      Divider(
                                        color: Colors.black.withOpacity(0.59),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20,
                                            right: 20,
                                            top: 10,
                                            bottom: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Company name'),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            CustomRadioButton(
                                              isSelected: isButtonSelected,
                                              onChanged: (value) {
                                                setState(() {
                                                  isButtonSelected = value;
                                                });
                                              },
                                            )
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Divider(
                                        color: Colors.black.withOpacity(0.59),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20,
                                            right: 20,
                                            top: 10,
                                            bottom: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Assigned Date'),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            CustomRadioButton(
                                              isSelected: isButtonSelected,
                                              onChanged: (value) {
                                                setState(() {
                                                  isButtonSelected = value;
                                                });
                                              },
                                            )
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                    ])
                              ],
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: AppColor.green),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Icon(
                        Icons.filter_alt_outlined,
                        color: AppColor.green,
                      )),
                )
              ],
            ),
          ),
          Flexible(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 300,
                      child: TabBar(
                        labelColor: AppColor.green,
                        labelStyle: TextStyle(fontSize: 15),
                        unselectedLabelColor: AppColor.grey1,
                        indicator: UnderlineTabIndicator(
                          borderSide:
                              BorderSide(color: AppColor.green, width: 2),
                          insets: EdgeInsets.symmetric(horizontal: 2),
                        ),
                        controller: tabController,
                        tabs: const [
                          Tab(text: 'Generated'),
                          Tab(text: 'Assigned'),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: Get.height * .01,
                ),
                Expanded(
                  child: TabBarView(
                    controller: tabController,
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: Get.height * .01,
                          ),
                          Expanded(
                            child: ScrollConfiguration(
                              behavior: MyBehavior(),
                              child: ListView(
                                children: List.generate(
                                  10,
                                  (index) => Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(
                                            right: 10, left: 10, top: 20),
                                        margin:
                                            const EdgeInsets.only(bottom: 5),
                                        child: Card(
                                          elevation: 1,
                                          margin: EdgeInsets.zero,
                                          shape: ContinuousRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          clipBehavior: Clip.hardEdge,
                                          child: Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: 7,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Expanded(
                                                      child: const Text(
                                                        "Batch Number",
                                                        style: TextStyle(
                                                            color:
                                                                AppColor.black,
                                                            fontSize: 13,
                                                            fontFamily: AppFont
                                                                .poppinsLight),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 1,
                                                      child: const Text(
                                                        "7478939857564",
                                                        style: TextStyle(
                                                            color:
                                                                AppColor.black,
                                                            fontSize: 13,
                                                            fontFamily: AppFont
                                                                .poppinsLight),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Divider(
                                                  color: AppColor.black,
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Expanded(
                                                      child: const Text(
                                                        "Date of Generation",
                                                        style: TextStyle(
                                                            color:
                                                                AppColor.black,
                                                            fontSize: 13,
                                                            fontFamily: AppFont
                                                                .poppinsLight),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 1,
                                                      child: const Text(
                                                        "11 Sept 2023, 11:45AM",
                                                        style: TextStyle(
                                                            color:
                                                                AppColor.black,
                                                            fontSize: 12,
                                                            fontFamily: AppFont
                                                                .poppinsLight),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 7,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 300,
                                        top: -8,
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              controller
                                                  .toggleVisibility(index);
                                            });
                                          },
                                          child: Container(
                                            child: Image.asset(
                                              AppImages.opestion,
                                              height: 50,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 230,
                                        top: -8,
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.pushNamed(
                                                context,
                                                AppScreen
                                                    .generatedDetailsScreen);
                                          },
                                          child: Visibility(
                                            visible: controller
                                                .areOptionVisibleList[index],
                                            child: Image.asset(
                                              AppImages.eye,
                                              height: 52,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        left: 265,
                                        top: -8,
                                        child: GestureDetector(
                                          onTap: () {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return CupertinoAlertDialog(
                                                  title: Column(
                                                    children: [
                                                      Text(
                                                        "Are you sure you want to Delete this User?",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            color:
                                                                AppColor.black),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          GestureDetector(
                                                            onTap: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: Container(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(9),
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            7),
                                                                color: AppColor
                                                                    .green,
                                                              ),
                                                              child: Text(
                                                                'Cancel',
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        AppFont
                                                                            .poppinsLight,
                                                                    fontSize:
                                                                        15,
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                            ),
                                                          ),
                                                          GestureDetector(
                                                            onTap: () {
                                                              showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (BuildContext
                                                                        context) {
                                                                  Future.delayed(
                                                                      Duration(
                                                                          seconds:
                                                                              1),
                                                                      () {
                                                                    Navigator.pop(
                                                                        context);
                                                                    Navigator.pop(
                                                                        context);
                                                                    // setState(() {
                                                                    //   isEditVisible = true;
                                                                    //   isVisible = false;
                                                                    // });
                                                                  });

                                                                  return CupertinoAlertDialog(
                                                                    title: Row(
                                                                      children: [
                                                                        Container(
                                                                          padding:
                                                                              EdgeInsets.all(10),
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.circular(30),
                                                                            color:
                                                                                AppColor.green,
                                                                          ),
                                                                          child:
                                                                              Icon(
                                                                            Icons.done,
                                                                            color:
                                                                                Colors.white,
                                                                          ),
                                                                        ),
                                                                        Flexible(
                                                                          child:
                                                                              Text(
                                                                            " User Deleted Successfully",
                                                                            style:
                                                                                TextStyle(fontSize: 15, color: AppColor.green),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ), // show pop-up
                                                                  );
                                                                },
                                                              );
                                                            },
                                                            child: Container(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      left: 20,
                                                                      right: 20,
                                                                      bottom:
                                                                          10,
                                                                      top: 10),
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            7),
                                                                color: AppColor
                                                                    .green,
                                                              ),
                                                              child: Center(
                                                                child: Text(
                                                                  'yes',
                                                                  style: TextStyle(
                                                                      fontFamily:
                                                                          AppFont
                                                                              .poppinsLight,
                                                                      fontSize:
                                                                          15,
                                                                      color: Colors
                                                                          .white),
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
                                          child: Visibility(
                                              visible: controller
                                                  .areOptionVisibleList[index],
                                              child: Image.asset(
                                                AppImages.delete,
                                                height: 50,
                                              )),
                                        ),
                                      ),
                                      Positioned(
                                        left: 30,
                                        top: 7,
                                        child: Container(
                                          padding: EdgeInsets.only(
                                              top: 4,
                                              left: 11,
                                              right: 11,
                                              bottom: 4),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: AppColor.greenMedium1),
                                          child: Text(
                                            'Printed',
                                            style: TextStyle(
                                                fontSize: 11,
                                                color: AppColor.green),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: Get.height * .01,
                          ),
                          Expanded(
                            child: ScrollConfiguration(
                              behavior: MyBehavior(),
                              child: ListView(
                                children: List.generate(
                                  10,
                                  (index) => Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(
                                            top: 10, right: 15, left: 15),
                                        margin:
                                            const EdgeInsets.only(bottom: 5),
                                        child: Card(
                                          elevation: 1,
                                          margin: EdgeInsets.zero,
                                          shape: ContinuousRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          clipBehavior: Clip.hardEdge,
                                          child: Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: 7,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Expanded(
                                                      child: const Text(
                                                        "Batch Number",
                                                        style: TextStyle(
                                                            color:
                                                                AppColor.black,
                                                            fontSize: 13,
                                                            fontFamily: AppFont
                                                                .poppinsLight),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 1,
                                                      child: const Text(
                                                        "7478939872156",
                                                        style: TextStyle(
                                                            color:
                                                                AppColor.black,
                                                            fontSize: 12,
                                                            fontFamily: AppFont
                                                                .poppinsLight),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 7,
                                                ),
                                                Divider(
                                                  color: AppColor.black,
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Expanded(
                                                      child: const Text(
                                                        "Vendor Code",
                                                        style: TextStyle(
                                                            color:
                                                                AppColor.black,
                                                            fontSize: 13,
                                                            fontFamily: AppFont
                                                                .poppinsLight),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 1,
                                                      child: const Text(
                                                        "123456",
                                                        style: TextStyle(
                                                            color:
                                                                AppColor.black,
                                                            fontSize: 12,
                                                            fontFamily: AppFont
                                                                .poppinsLight),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 7,
                                                ),
                                                Divider(
                                                  color: AppColor.black,
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Expanded(
                                                      child: const Text(
                                                        "Company Name",
                                                        style: TextStyle(
                                                            color:
                                                                AppColor.black,
                                                            fontSize: 13,
                                                            fontFamily: AppFont
                                                                .poppinsLight),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 1,
                                                      child: const Text(
                                                        "Enumeral Waste Solutions",
                                                        style: TextStyle(
                                                            color:
                                                                AppColor.black,
                                                            fontSize: 12,
                                                            fontFamily: AppFont
                                                                .poppinsLight),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 7,
                                                ),
                                                Divider(
                                                  color: AppColor.black,
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Expanded(
                                                      child: const Text(
                                                        "Assigned Date",
                                                        style: TextStyle(
                                                            color:
                                                                AppColor.black,
                                                            fontSize: 13,
                                                            fontFamily: AppFont
                                                                .poppinsLight),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 1,
                                                      child: const Text(
                                                        "11 Sept 2023, 11:45AM",
                                                        style: TextStyle(
                                                            color:
                                                                AppColor.black,
                                                            fontSize: 12,
                                                            fontFamily: AppFont
                                                                .poppinsLight),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pushNamed(context,
                                              AppScreen.assignedDetailsScreen);
                                        },
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(right: 12),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                'View Details',
                                                style: TextStyle(
                                                  decoration:
                                                      TextDecoration.underline,
                                                  color: AppColor.green,
                                                  fontSize: 10,
                                                ),
                                              ),
                                              Icon(
                                                Icons
                                                    .arrow_forward_ios_outlined,
                                                color: AppColor.green,
                                                size: 10,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 7,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}

class TickerProviderImpl implements TickerProvider {
  @override
  Ticker createTicker(TickerCallback onTick) => Ticker(onTick);
}
