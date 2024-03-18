import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:waste_track/Conrollers/Admin/Vender%20Mangagement%20Controller/vendor_managment_controller.dart';
import 'package:waste_track/Utils/Components/Search%20Text%20Field/custom_search_text_field.dart';
import 'package:waste_track/Utils/Components/app_font.dart';
import 'package:waste_track/Utils/Components/custom_radio_button.dart';
import 'package:waste_track/Utils/behavior.dart';
import 'package:waste_track/Utils/colors/app_colors.dart';

import '../../../../../Utils/images/images.dart';

class Areas extends StatefulWidget {
  const Areas({super.key});

  @override
  State<Areas> createState() => _AreasState();
}

class _AreasState extends State<Areas> with SingleTickerProviderStateMixin {
  final vendorManagementVisibilityController =
      Get.put(VendorManagementController());
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

  bool isButtonSelected = false;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Padding(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: Container(
          height: MediaQuery.of(context).size.height,
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
                        borderSide: BorderSide(color: AppColor.green, width: 2),
                        insets: EdgeInsets.symmetric(horizontal: 2),
                      ),
                      controller: tabController,
                      tabs: const [
                        Tab(text: 'Assigned'),
                        Tab(text: 'Not Assigned'),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                                    fontFamily: AppFont
                                                        .poppinsSemiBold),
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
                                              Text('Area'),
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
                                              Text('Company Name'),
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
                          border: Border.all(
                              color: AppColor.green.withOpacity(0.6)),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Icon(
                          Icons.filter_alt_outlined,
                          color: AppColor.green,
                        )),
                  )
                ],
              ),
              SizedBox(
                height: 10,
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
                                        top: 10,
                                      ),
                                      margin: const EdgeInsets.only(bottom: 5),
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
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Expanded(
                                                    child: const Text(
                                                      "Area",
                                                      style: TextStyle(
                                                          color: AppColor.black,
                                                          fontSize: 12,
                                                          fontFamily: AppFont
                                                              .poppinsLight),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 1,
                                                    child: const Text(
                                                      "Lorem ipsum dolor sit amet. Nam ducimus repellendus At voluptatems",
                                                      style: TextStyle(
                                                          color: AppColor.black,
                                                          fontSize: 12,
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
                                                      "Company Name",
                                                      style: TextStyle(
                                                          color: AppColor.black,
                                                          fontSize: 12,
                                                          fontFamily: AppFont
                                                              .poppinsLight),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 1,
                                                    child: const Text(
                                                      "Enumeral Waste Solutions",
                                                      style: TextStyle(
                                                          color: AppColor.black,
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
                                      left: 280,
                                      top: -8,
                                      child: GestureDetector(
                                        onTap: () {
                                          vendorManagementVisibilityController
                                              .AssignedVisibility(index);
                                        },
                                        child: Image.asset(
                                          AppImages.opestion,
                                          height: 50,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 215,
                                      top: -8,
                                      child: Visibility(
                                        visible:
                                            vendorManagementVisibilityController.assignedVisibleList[index],
                                        child: GestureDetector(
                                          onTap: () {
                                            Get.dialog(
                                              AlertDialog(
                                                content: SizedBox(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            "Edit Area",
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                color: AppColor
                                                                    .black),
                                                          ),
                                                          GestureDetector(
                                                            onTap: () =>
                                                                Get.back(),
                                                            child: Icon(
                                                              Icons.close,
                                                              size: 18,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      CupertinoTextField(
                                                        padding:
                                                            EdgeInsets.all(10),
                                                        prefix: Icon(
                                                          Icons
                                                              .keyboard_alt_outlined,
                                                          color: AppColor.green,
                                                          size: 15,
                                                        ),
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        7),
                                                            border: Border.all(
                                                                color: AppColor
                                                                    .green)),
                                                        placeholder:
                                                            'Enter text',
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          showDialog(
                                                            context: context,
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
                                                              });

                                                              return CupertinoAlertDialog(
                                                                title: Row(
                                                                  children: [
                                                                    Container(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              10),
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(30),
                                                                        color: AppColor
                                                                            .green,
                                                                      ),
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .done,
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                    ),
                                                                    Flexible(
                                                                      child:
                                                                          Text(
                                                                        " Area Updated  Successfully",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                15,
                                                                            color:
                                                                                AppColor.green),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ), // show pop-up
                                                              );
                                                            },
                                                          );
                                                        },
                                                        child: Container(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 20,
                                                                  right: 20,
                                                                  bottom: 10,
                                                                  top: 10),
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        7),
                                                            color:
                                                                AppColor.green,
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              'Edit Area',
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      AppFont
                                                                          .poppinsLight,
                                                                  fontSize: 15,
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                insetPadding:
                                                    const EdgeInsets.all(10),
                                              ),
                                            );
                                          },
                                          child: Container(
                                            child: Image.asset(
                                              AppImages.edit,
                                              height: 50,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 247,
                                      top: -10,
                                      child: Visibility(
                                        visible:
                                            vendorManagementVisibilityController
                                                .assignedVisibleList[index],
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
                                          child: Container(
                                            child: Image.asset(
                                              AppImages.delete,
                                              height: 50,
                                            ),
                                          ),
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
                                (index) => Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.only(
                                          top: 15, left: 0, right: 0),
                                      margin: const EdgeInsets.only(bottom: 5),
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
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Expanded(
                                                    child: const Text(
                                                      "Area",
                                                      style: TextStyle(
                                                          color: AppColor.black,
                                                          fontSize: 12,
                                                          fontFamily: AppFont
                                                              .poppinsLight),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 4,
                                                    child: const Text(
                                                      "Lorem ipsum dolor sit amet. Nam ducimus repellendus At voluptatems",
                                                      style: TextStyle(
                                                          color: AppColor.black,
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
                                      left: 280,
                                      top: -8,
                                      child: GestureDetector(
                                        onTap: () {
                                          vendorManagementVisibilityController
                                              .NotAssignedVisibility(index);
                                        },
                                        child: Image.asset(
                                          AppImages.opestion,
                                          height: 50,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 215,
                                      top: -8,
                                      child: Visibility(
                                        visible:
                                            vendorManagementVisibilityController
                                                .notAssVisibleList[index],
                                        child: GestureDetector(
                                          onTap: () {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return CupertinoAlertDialog(
                                                  title: Column(
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            "Edit Area",
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                color: AppColor
                                                                    .black),
                                                          ),
                                                          Icon(
                                                            Icons.close,
                                                            size: 18,
                                                          )
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      CupertinoTextField(
                                                        padding:
                                                            EdgeInsets.all(10),
                                                        prefix: Icon(
                                                          Icons
                                                              .keyboard_alt_outlined,
                                                          color: AppColor.green,
                                                          size: 15,
                                                        ),
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        7),
                                                            border: Border.all(
                                                                color: AppColor
                                                                    .green)),
                                                        placeholder:
                                                            'Enter text',
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          showDialog(
                                                            context: context,
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
                                                              });

                                                              return CupertinoAlertDialog(
                                                                title: Row(
                                                                  children: [
                                                                    Container(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              10),
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(30),
                                                                        color: AppColor
                                                                            .green,
                                                                      ),
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .done,
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                    ),
                                                                    Flexible(
                                                                      child:
                                                                          Text(
                                                                        "Area Updated Successfully",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                15,
                                                                            color:
                                                                                AppColor.green),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ), // show pop-up
                                                              );
                                                            },
                                                          );
                                                        },
                                                        child: Container(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 20,
                                                                  right: 20,
                                                                  bottom: 10,
                                                                  top: 10),
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        7),
                                                            color:
                                                                AppColor.green,
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              'Edit Area',
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      AppFont
                                                                          .poppinsLight,
                                                                  fontSize: 15,
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ), // show pop-up
                                                );
                                              },
                                            );
                                          },
                                          child: Container(
                                            child: Image.asset(
                                              AppImages.edit,
                                              height: 50,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 247,
                                      top: -10,
                                      child: Visibility(
                                        visible:
                                            vendorManagementVisibilityController
                                                .notAssVisibleList[index],
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
                                          child: Container(
                                            child: Image.asset(
                                              AppImages.delete,
                                              height: 50,
                                            ),
                                          ),
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
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class TickerProviderImpl implements TickerProvider {
  @override
  Ticker createTicker(TickerCallback onTick) => Ticker(onTick);
}
