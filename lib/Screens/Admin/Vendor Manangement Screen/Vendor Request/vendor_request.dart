import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:waste_track/Conrollers/Admin/Vender%20Mangagement%20Controller/vendor_managment_controller.dart';
import 'package:waste_track/Utils/Components/Search%20Text%20Field/custom_search_text_field.dart';
import 'package:waste_track/Utils/Components/app_font.dart';
import 'package:waste_track/Utils/Components/custom_radio_button.dart';
import 'package:waste_track/Utils/behavior.dart';
import 'package:waste_track/Utils/colors/app_colors.dart';
import 'package:waste_track/Utils/images/images.dart';

class VendorRequest extends StatefulWidget {
  const VendorRequest({super.key});

  @override
  State<VendorRequest> createState() => _VendorRequestState();
}

class _VendorRequestState extends State<VendorRequest>
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

  final controller = Get.put(VendorRequestVisibilityController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
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
                                              Text('Company Address'),
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
                                              Text('Company Email'),
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
                                              Text('Contact Name'),
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
                                              Text('Request Date'),
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
              SizedBox(
                height: 10,
              ),
              Flexible(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 310,
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
                              Tab(text: 'Pending'),
                              Tab(text: 'Rejected'),
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
                                      (index) => Column(
                                        children: [
                                          Visibility(
                                            visible: controller
                                                .isPeContainerVisible.isTrue,
                                            child: Stack(
                                              clipBehavior: Clip.none,
                                              children: [
                                                Container(
                                                  padding:
                                                      EdgeInsets.only(top: 20),
                                                  margin: const EdgeInsets.only(
                                                      bottom: 5),
                                                  child: Card(
                                                    elevation: 1,
                                                    margin: EdgeInsets.zero,
                                                    shape:
                                                        ContinuousRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20)),
                                                    clipBehavior: Clip.hardEdge,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              15.0),
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
                                                                child:
                                                                    const Text(
                                                                  "Company Name",
                                                                  style: TextStyle(
                                                                      color: AppColor
                                                                          .black,
                                                                      fontSize:
                                                                          13,
                                                                      fontFamily:
                                                                          AppFont
                                                                              .poppinsLight),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                flex: 1,
                                                                child:
                                                                    const Text(
                                                                  "Enumeral Waste Solutions",
                                                                  style: TextStyle(
                                                                      color: AppColor
                                                                          .black,
                                                                      fontSize:
                                                                          13,
                                                                      fontFamily:
                                                                          AppFont
                                                                              .poppinsLight),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Divider(
                                                            color:
                                                                AppColor.black,
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
                                                                child:
                                                                    const Text(
                                                                  "Company Address",
                                                                  style: TextStyle(
                                                                      color: AppColor
                                                                          .black,
                                                                      fontSize:
                                                                          13,
                                                                      fontFamily:
                                                                          AppFont
                                                                              .poppinsLight),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                flex: 1,
                                                                child:
                                                                    const Text(
                                                                  "abc street, xyz city",
                                                                  style: TextStyle(
                                                                      color: AppColor
                                                                          .black,
                                                                      fontSize:
                                                                          12,
                                                                      fontFamily:
                                                                          AppFont
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
                                                  top: 7,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      controller
                                                          .PeContainerVisible();
                                                    },
                                                    child: Container(
                                                        child: Icon(
                                                      Icons
                                                          .arrow_drop_down_circle_outlined,
                                                      size: 30,
                                                      color: AppColor.green,
                                                    )),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Visibility(
                                            visible: controller
                                                .isPeContainerVisible.isFalse,
                                            child: Stack(
                                              clipBehavior: Clip.none,
                                              children: [
                                                Column(
                                                  children: [
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                          top: 20),
                                                      margin:
                                                          const EdgeInsets.only(
                                                              bottom: 5),
                                                      child: Card(
                                                        elevation: 1,
                                                        margin: EdgeInsets.zero,
                                                        shape: ContinuousRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20)),
                                                        clipBehavior:
                                                            Clip.hardEdge,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(15.0),
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
                                                                    child:
                                                                        const Text(
                                                                      "Company Name",
                                                                      style: TextStyle(
                                                                          color: AppColor
                                                                              .black,
                                                                          fontSize:
                                                                              13,
                                                                          fontFamily:
                                                                              AppFont.poppinsLight),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    flex: 1,
                                                                    child:
                                                                        const Text(
                                                                      "Enumeral Waste Solutions",
                                                                      style: TextStyle(
                                                                          color: AppColor
                                                                              .black,
                                                                          fontSize:
                                                                              13,
                                                                          fontFamily:
                                                                              AppFont.poppinsLight),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Divider(
                                                                color: AppColor
                                                                    .black,
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
                                                                    child:
                                                                        const Text(
                                                                      "Company Address",
                                                                      style: TextStyle(
                                                                          color: AppColor
                                                                              .black,
                                                                          fontSize:
                                                                              13,
                                                                          fontFamily:
                                                                              AppFont.poppinsLight),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    flex: 1,
                                                                    child:
                                                                        const Text(
                                                                      "abc street, xyz city",
                                                                      style: TextStyle(
                                                                          color: AppColor
                                                                              .black,
                                                                          fontSize:
                                                                              12,
                                                                          fontFamily:
                                                                              AppFont.poppinsLight),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Divider(
                                                                color: AppColor
                                                                    .black,
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
                                                                    child:
                                                                        const Text(
                                                                      "Company Email",
                                                                      style: TextStyle(
                                                                          color: AppColor
                                                                              .black,
                                                                          fontSize:
                                                                              13,
                                                                          fontFamily:
                                                                              AppFont.poppinsLight),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    flex: 1,
                                                                    child:
                                                                        const Text(
                                                                      "vendor@gmail.com",
                                                                      style: TextStyle(
                                                                          color: AppColor
                                                                              .black,
                                                                          fontSize:
                                                                              12,
                                                                          fontFamily:
                                                                              AppFont.poppinsLight),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Divider(
                                                                color: AppColor
                                                                    .black,
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
                                                                    child:
                                                                        const Text(
                                                                      "Contact Number",
                                                                      style: TextStyle(
                                                                          color: AppColor
                                                                              .black,
                                                                          fontSize:
                                                                              13,
                                                                          fontFamily:
                                                                              AppFont.poppinsLight),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    flex: 1,
                                                                    child:
                                                                        const Text(
                                                                      "+234 09-461-4000",
                                                                      style: TextStyle(
                                                                          color: AppColor
                                                                              .black,
                                                                          fontSize:
                                                                              12,
                                                                          fontFamily:
                                                                              AppFont.poppinsLight),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Divider(
                                                                color: AppColor
                                                                    .black,
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
                                                                    child:
                                                                        const Text(
                                                                      "Contact Name",
                                                                      style: TextStyle(
                                                                          color: AppColor
                                                                              .black,
                                                                          fontSize:
                                                                              13,
                                                                          fontFamily:
                                                                              AppFont.poppinsLight),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    flex: 1,
                                                                    child:
                                                                        const Text(
                                                                      "Lorem ipsum",
                                                                      style: TextStyle(
                                                                          color: AppColor
                                                                              .black,
                                                                          fontSize:
                                                                              12,
                                                                          fontFamily:
                                                                              AppFont.poppinsLight),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Divider(
                                                                color: AppColor
                                                                    .black,
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
                                                                    child:
                                                                        const Text(
                                                                      "Request Date",
                                                                      style: TextStyle(
                                                                          color: AppColor
                                                                              .black,
                                                                          fontSize:
                                                                              13,
                                                                          fontFamily:
                                                                              AppFont.poppinsLight),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    flex: 1,
                                                                    child:
                                                                        const Text(
                                                                      "14 Sept 2023, 11:45AM",
                                                                      style: TextStyle(
                                                                          color: AppColor
                                                                              .black,
                                                                          fontSize:
                                                                              12,
                                                                          fontFamily:
                                                                              AppFont.poppinsLight),
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
                                                    SizedBox(
                                                      height: 7,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            showDialog(
                                                              context: context,
                                                              builder:
                                                                  (BuildContext
                                                                      context) {
                                                                return CupertinoAlertDialog(
                                                                  title: Column(
                                                                    children: [
                                                                      Text(
                                                                        "Do you want to Reject this Request?",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                15,
                                                                            color:
                                                                                AppColor.black),
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            10,
                                                                      ),
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceAround,
                                                                        children: [
                                                                          GestureDetector(
                                                                            onTap:
                                                                                () {
                                                                              Navigator.pop(context);
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              padding: EdgeInsets.all(9),
                                                                              decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.circular(7),
                                                                                color: AppColor.green,
                                                                              ),
                                                                              child: Text(
                                                                                'Cancel',
                                                                                style: TextStyle(fontFamily: AppFont.poppinsLight, fontSize: 15, color: Colors.white),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          GestureDetector(
                                                                            onTap:
                                                                                () {
                                                                              showDialog(
                                                                                context: context,
                                                                                builder: (BuildContext context) {
                                                                                  Future.delayed(Duration(seconds: 1), () {
                                                                                    Navigator.pop(context);
                                                                                    Navigator.pop(context);
                                                                                  });

                                                                                  return CupertinoAlertDialog(
                                                                                    title: Row(
                                                                                      children: [
                                                                                        Container(
                                                                                          padding: EdgeInsets.all(10),
                                                                                          decoration: BoxDecoration(
                                                                                            borderRadius: BorderRadius.circular(30),
                                                                                            color: Colors.red.withOpacity(0.1),
                                                                                          ),
                                                                                          child: Icon(
                                                                                            Icons.close,
                                                                                            color: Colors.red,
                                                                                          ),
                                                                                        ),
                                                                                        SizedBox(
                                                                                          width: 3,
                                                                                        ),
                                                                                        Flexible(
                                                                                          child: Text(
                                                                                            "Request Rejected Successfully.",
                                                                                            style: TextStyle(fontSize: 14, color: Colors.red),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ), // show pop-up
                                                                                  );
                                                                                },
                                                                              );
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              padding: EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
                                                                              decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.circular(7),
                                                                                color: AppColor.green,
                                                                              ),
                                                                              child: Center(
                                                                                child: Text(
                                                                                  'Reject',
                                                                                  style: TextStyle(fontFamily: AppFont.poppinsLight, fontSize: 15, color: Colors.white),
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
                                                            padding:
                                                                EdgeInsets.only(
                                                                    top: 10,
                                                                    bottom: 10,
                                                                    right: 55,
                                                                    left: 55),
                                                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(
                                                                7),
                                                                color: Colors
                                                                    .red
                                                                    .withOpacity(
                                                                        0.3)),
                                                            child: Text(
                                                              'Reject',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .red,
                                                                  fontSize: 15,
                                                                  fontFamily:
                                                                      AppFont
                                                                          .poppinsSemiBold),
                                                            ),
                                                          ),
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            showDialog(
                                                              context: context,
                                                              builder:
                                                                  (BuildContext
                                                                      context) {
                                                                return CupertinoAlertDialog(
                                                                  title: Column(
                                                                    children: [
                                                                      Text(
                                                                        "Do you want to Approve this Request?",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                15,
                                                                            color:
                                                                                AppColor.black),
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            10,
                                                                      ),
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceAround,
                                                                        children: [
                                                                          GestureDetector(
                                                                            onTap:
                                                                                () {
                                                                              Navigator.pop(context);
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              padding: EdgeInsets.all(9),
                                                                              decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.circular(7),
                                                                                color: AppColor.green,
                                                                              ),
                                                                              child: Text(
                                                                                'Cancel',
                                                                                style: TextStyle(fontFamily: AppFont.poppinsLight, fontSize: 15, color: Colors.white),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          GestureDetector(
                                                                            onTap:
                                                                                () {
                                                                              showDialog(
                                                                                context: context,
                                                                                builder: (BuildContext context) {
                                                                                  Future.delayed(Duration(seconds: 1), () {
                                                                                    Navigator.pop(context);
                                                                                    Navigator.pop(context);
                                                                                  });

                                                                                  return CupertinoAlertDialog(
                                                                                    title: Row(
                                                                                      children: [
                                                                                        Container(
                                                                                          padding: EdgeInsets.all(9),
                                                                                          decoration: BoxDecoration(
                                                                                            borderRadius: BorderRadius.circular(30),
                                                                                            color: AppColor.green.withOpacity(0.7),
                                                                                          ),
                                                                                          child: Icon(
                                                                                            Icons.done,
                                                                                            color: Colors.white,
                                                                                          ),
                                                                                        ),
                                                                                        SizedBox(
                                                                                          width: 3,
                                                                                        ),
                                                                                        Flexible(
                                                                                          child: Text(
                                                                                            "Request Approved Successfully.",
                                                                                            style: TextStyle(fontSize: 13, color: AppColor.green),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ), // show pop-up
                                                                                  );
                                                                                },
                                                                              );
                                                                            },
                                                                            child:
                                                                                Container(
                                                                              padding: EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
                                                                              decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.circular(7),
                                                                                color: AppColor.green,
                                                                              ),
                                                                              child: Center(
                                                                                child: Text(
                                                                                  'Approve',
                                                                                  style: TextStyle(fontFamily: AppFont.poppinsLight, fontSize: 15, color: Colors.white),
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
                                                            padding:
                                                                EdgeInsets.only(
                                                                    top: 10,
                                                                    bottom: 10,
                                                                    right: 50,
                                                                    left: 50),
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            7),
                                                                color: AppColor
                                                                    .greenMedium1
                                                                    .withOpacity(
                                                                        0.7)),
                                                            child: Text(
                                                              'Approve',
                                                              style: TextStyle(
                                                                  color: AppColor
                                                                      .green,
                                                                  fontSize: 15,
                                                                  fontFamily:
                                                                      AppFont
                                                                          .poppinsSemiBold),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                ),
                                                Positioned(
                                                  left: 300,
                                                  top: 10,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      controller
                                                          .PeContainerHide();
                                                    },
                                                    child: Container(
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        50),
                                                            border: Border.all(
                                                                width: 3,
                                                                color: AppColor
                                                                    .green)),
                                                        child: Icon(
                                                          Icons
                                                              .arrow_drop_up_sharp,
                                                          size: 20,
                                                          color: AppColor.green,
                                                        )),
                                                  ),
                                                ),
                                              ],
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
                                          Visibility(
                                            visible: controller
                                                .isContainerVisible.isTrue,
                                            child: Stack(
                                              clipBehavior: Clip.none,
                                              children: [
                                                Container(
                                                  padding:
                                                      EdgeInsets.only(top: 20),
                                                  margin: const EdgeInsets.only(
                                                      bottom: 5),
                                                  child: Card(
                                                    elevation: 1,
                                                    margin: EdgeInsets.zero,
                                                    shape:
                                                        ContinuousRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                    ),
                                                    clipBehavior: Clip.hardEdge,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              15.0),
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
                                                                child:
                                                                    const Text(
                                                                  "Company Name",
                                                                  style: TextStyle(
                                                                      color: AppColor
                                                                          .black,
                                                                      fontSize:
                                                                          13,
                                                                      fontFamily:
                                                                          AppFont
                                                                              .poppinsLight),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                flex: 1,
                                                                child:
                                                                    const Text(
                                                                  "Enumeral Waste Solutions",
                                                                  style: TextStyle(
                                                                      color: AppColor
                                                                          .black,
                                                                      fontSize:
                                                                          13,
                                                                      fontFamily:
                                                                          AppFont
                                                                              .poppinsLight),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Divider(
                                                            color:
                                                                AppColor.black,
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
                                                                child:
                                                                    const Text(
                                                                  "Company Address",
                                                                  style: TextStyle(
                                                                      color: AppColor
                                                                          .black,
                                                                      fontSize:
                                                                          13,
                                                                      fontFamily:
                                                                          AppFont
                                                                              .poppinsLight),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                flex: 1,
                                                                child:
                                                                    const Text(
                                                                  "abc street, xyz city",
                                                                  style: TextStyle(
                                                                      color: AppColor
                                                                          .black,
                                                                      fontSize:
                                                                          12,
                                                                      fontFamily:
                                                                          AppFont
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
                                                  top: 7,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      controller
                                                          .ContainerVisible();
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(50),
                                                          border: Border.all(
                                                              width: 3,
                                                              color: AppColor
                                                                  .green)),
                                                      child: Icon(
                                                        Icons.arrow_drop_down,
                                                        size: 20,
                                                        color: AppColor.green,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Visibility(
                                            visible: controller
                                                .isContainerVisible.isFalse,
                                            child: Stack(
                                              clipBehavior: Clip.none,
                                              children: [
                                                Column(
                                                  children: [
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                          top: 20),
                                                      margin:
                                                          const EdgeInsets.only(
                                                              bottom: 5),
                                                      child: Card(
                                                        elevation: 1,
                                                        margin: EdgeInsets.zero,
                                                        shape:
                                                            ContinuousRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                        ),
                                                        clipBehavior:
                                                            Clip.hardEdge,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(15.0),
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
                                                                    child:
                                                                        const Text(
                                                                      "Company Name",
                                                                      style: TextStyle(
                                                                          color: AppColor
                                                                              .black,
                                                                          fontSize:
                                                                              13,
                                                                          fontFamily:
                                                                              AppFont.poppinsLight),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    flex: 1,
                                                                    child:
                                                                        const Text(
                                                                      "Enumeral Waste Solutions",
                                                                      style: TextStyle(
                                                                          color: AppColor
                                                                              .black,
                                                                          fontSize:
                                                                              13,
                                                                          fontFamily:
                                                                              AppFont.poppinsLight),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Divider(
                                                                color: AppColor
                                                                    .black,
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
                                                                    child:
                                                                        const Text(
                                                                      "Company Address",
                                                                      style: TextStyle(
                                                                          color: AppColor
                                                                              .black,
                                                                          fontSize:
                                                                              13,
                                                                          fontFamily:
                                                                              AppFont.poppinsLight),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    flex: 1,
                                                                    child:
                                                                        const Text(
                                                                      "abc street, xyz city",
                                                                      style: TextStyle(
                                                                          color: AppColor
                                                                              .black,
                                                                          fontSize:
                                                                              12,
                                                                          fontFamily:
                                                                              AppFont.poppinsLight),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Divider(
                                                                color: AppColor
                                                                    .black,
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
                                                                    child:
                                                                        const Text(
                                                                      "Company Email",
                                                                      style: TextStyle(
                                                                          color: AppColor
                                                                              .black,
                                                                          fontSize:
                                                                              13,
                                                                          fontFamily:
                                                                              AppFont.poppinsLight),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    flex: 1,
                                                                    child:
                                                                        const Text(
                                                                      "vendor@gmail.com",
                                                                      style: TextStyle(
                                                                          color: AppColor
                                                                              .black,
                                                                          fontSize:
                                                                              12,
                                                                          fontFamily:
                                                                              AppFont.poppinsLight),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Divider(
                                                                color: AppColor
                                                                    .black,
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
                                                                    child:
                                                                        const Text(
                                                                      "Contact Number",
                                                                      style: TextStyle(
                                                                          color: AppColor
                                                                              .black,
                                                                          fontSize:
                                                                              13,
                                                                          fontFamily:
                                                                              AppFont.poppinsLight),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    flex: 1,
                                                                    child:
                                                                        const Text(
                                                                      "+234 09-461-4000",
                                                                      style: TextStyle(
                                                                          color: AppColor
                                                                              .black,
                                                                          fontSize:
                                                                              12,
                                                                          fontFamily:
                                                                              AppFont.poppinsLight),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Divider(
                                                                color: AppColor
                                                                    .black,
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
                                                                    child:
                                                                        const Text(
                                                                      "Contact Name",
                                                                      style: TextStyle(
                                                                          color: AppColor
                                                                              .black,
                                                                          fontSize:
                                                                              13,
                                                                          fontFamily:
                                                                              AppFont.poppinsLight),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    flex: 1,
                                                                    child:
                                                                        const Text(
                                                                      "Lorem ipsum",
                                                                      style: TextStyle(
                                                                          color: AppColor
                                                                              .black,
                                                                          fontSize:
                                                                              12,
                                                                          fontFamily:
                                                                              AppFont.poppinsLight),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Divider(
                                                                color: AppColor
                                                                    .black,
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
                                                                    child:
                                                                        const Text(
                                                                      "Request Date",
                                                                      style: TextStyle(
                                                                          color: AppColor
                                                                              .black,
                                                                          fontSize:
                                                                              13,
                                                                          fontFamily:
                                                                              AppFont.poppinsLight),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    flex: 1,
                                                                    child:
                                                                        const Text(
                                                                      "14 Sept 2023, 11:45AM",
                                                                      style: TextStyle(
                                                                          color: AppColor
                                                                              .black,
                                                                          fontSize:
                                                                              12,
                                                                          fontFamily:
                                                                              AppFont.poppinsLight),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Divider(
                                                                color: AppColor
                                                                    .black,
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
                                                                    child:
                                                                        const Text(
                                                                      "Rejection Date",
                                                                      style: TextStyle(
                                                                          color: AppColor
                                                                              .black,
                                                                          fontSize:
                                                                              13,
                                                                          fontFamily:
                                                                              AppFont.poppinsLight),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    flex: 1,
                                                                    child:
                                                                        const Text(
                                                                      "14 Sept 2023, 11:45AM",
                                                                      style: TextStyle(
                                                                          color: AppColor
                                                                              .black,
                                                                          fontSize:
                                                                              12,
                                                                          fontFamily:
                                                                              AppFont.poppinsLight),
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
                                                    SizedBox(
                                                      height: 7,
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        showDialog(
                                                          context: context,
                                                          builder: (BuildContext
                                                              context) {
                                                            return CupertinoAlertDialog(
                                                              title: Column(
                                                                children: [
                                                                  Text(
                                                                    "Do you want to Approve this Request?",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            15,
                                                                        color: AppColor
                                                                            .black),
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
                                                                        onTap:
                                                                            () {
                                                                          Navigator.pop(
                                                                              context);
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          padding:
                                                                              EdgeInsets.all(9),
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.circular(7),
                                                                            color:
                                                                                AppColor.green,
                                                                          ),
                                                                          child:
                                                                              Text(
                                                                            'Cancel',
                                                                            style: TextStyle(
                                                                                fontFamily: AppFont.poppinsLight,
                                                                                fontSize: 15,
                                                                                color: Colors.white),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          showDialog(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (BuildContext context) {
                                                                              Future.delayed(Duration(seconds: 1), () {
                                                                                Navigator.pop(context);
                                                                                Navigator.pop(context);
                                                                              });

                                                                              return CupertinoAlertDialog(
                                                                                title: Row(
                                                                                  children: [
                                                                                    Container(
                                                                                      padding: EdgeInsets.all(9),
                                                                                      decoration: BoxDecoration(
                                                                                        borderRadius: BorderRadius.circular(30),
                                                                                        color: AppColor.green.withOpacity(0.7),
                                                                                      ),
                                                                                      child: Icon(
                                                                                        Icons.done,
                                                                                        color: Colors.white,
                                                                                      ),
                                                                                    ),
                                                                                    SizedBox(
                                                                                      width: 3,
                                                                                    ),
                                                                                    Flexible(
                                                                                      child: Text(
                                                                                        "Request Approved Successfully.",
                                                                                        style: TextStyle(fontSize: 13, color: AppColor.green),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ), // show pop-up
                                                                              );
                                                                            },
                                                                          );
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          padding: EdgeInsets.only(
                                                                              left: 20,
                                                                              right: 20,
                                                                              bottom: 10,
                                                                              top: 10),
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.circular(7),
                                                                            color:
                                                                                AppColor.green,
                                                                          ),
                                                                          child:
                                                                              Center(
                                                                            child:
                                                                                Text(
                                                                              'Approve',
                                                                              style: TextStyle(fontFamily: AppFont.poppinsLight, fontSize: 15, color: Colors.white),
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
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 10.0,
                                                                right: 10.0),
                                                        child: Container(
                                                          width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width,
                                                          padding:
                                                              EdgeInsets.only(
                                                            top: 10,
                                                            bottom: 10,
                                                          ),
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          7),
                                                              color: AppColor
                                                                  .greenMedium1
                                                                  .withOpacity(
                                                                      0.7)),
                                                          child: Center(
                                                            child: Text(
                                                              'Approve',
                                                              style: TextStyle(
                                                                  color: AppColor
                                                                      .green,
                                                                  fontSize: 15,
                                                                  fontFamily:
                                                                      AppFont
                                                                          .poppinsSemiBold),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Positioned(
                                                  left: 300,
                                                  top: 10,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      controller
                                                          .ContainerHide();
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(50),
                                                          border: Border.all(
                                                              width: 3,
                                                              color: AppColor
                                                                  .green)),
                                                      child: Icon(
                                                        Icons
                                                            .arrow_drop_up_sharp,
                                                        size: 20,
                                                        color: AppColor.green,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
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
            ],
          ),
        );
      },
    );
  }
}

class TickerProviderImpl implements TickerProvider {
  @override
  Ticker createTicker(TickerCallback onTick) => Ticker(onTick);
}
