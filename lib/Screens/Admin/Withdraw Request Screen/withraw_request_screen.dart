import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:waste_track/App%20Routes/app_routes.dart';
import 'package:waste_track/Models/Withdraw%20Container%20Model/withdraw_container_model.dart';
import 'package:waste_track/Utils/Components/Search%20Text%20Field/custom_search_text_field.dart';
import 'package:waste_track/Utils/Components/app_font.dart';
import 'package:waste_track/Utils/Components/custom_radio_button.dart';
import 'package:waste_track/Utils/behavior.dart';
import 'package:waste_track/Utils/colors/app_colors.dart';
import 'package:waste_track/Utils/images/images.dart';

class WithdrawRequestScreen extends StatefulWidget {
  const WithdrawRequestScreen({super.key});

  @override
  State<WithdrawRequestScreen> createState() => _WithdrawRequestScreenState();
}

class _WithdrawRequestScreenState extends State<WithdrawRequestScreen>
    with SingleTickerProviderStateMixin {
  bool isButtonSelected = false;
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  final List<WithdrawItemModel> containerItems = [
    WithdrawItemModel(
        name: 'Requests Completed',
        imageUrl: AppImages.request_com,
        number: "50"),
    WithdrawItemModel(
        name: 'Requests Pending',
        imageUrl: AppImages.request_pen,
        number: "10"),
    WithdrawItemModel(
        name: 'Requests Approved',
        imageUrl: AppImages.request_can,
        number: "35"),
    WithdrawItemModel(
        name: 'Requests Cancelled',
        imageUrl: AppImages.request_app,
        number: "5"),

    // Add more items with colors as needed
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65.0),
        child: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppImages.logo,
                  width: 50,
                  height: 50,
                ),
                SizedBox(width: 7),
                Text(
                  'Waste Track',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: AppFont.poppinsBold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          backgroundColor: Colors.white,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 10, left: 10, right: 10),
        child: Column(
          children: [
            Container(
              height: 120,
              child: ScrollConfiguration(
                behavior: MyBehavior(),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: containerItems.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: MediaQuery.of(context).size.width * 0.47,
                      margin: EdgeInsets.symmetric(horizontal: 2.0),
                      child: Card(
                        elevation: 1,
                        shape: ContinuousRectangleBorder(
                            borderRadius: BorderRadius.circular(40)),
                        clipBehavior: Clip.hardEdge,
                        child: Container(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Text(
                                      containerItems[index].number,
                                      style: TextStyle(
                                          fontFamily: AppFont.poppinsBold,
                                          fontSize: 25,
                                          color: AppColor.black),
                                    ),
                                  ),
                                  Center(
                                      child: SvgPicture.asset(
                                    containerItems[index].imageUrl,
                                    height: 45,
                                  ))
                                ],
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Text(
                                containerItems[index].name,
                                style: TextStyle(
                                    fontFamily: AppFont.poppinsMedium,
                                    fontSize: 13,
                                    color: AppColor.grey1),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Flexible(
                  child: CustomSearchTextField(
                    hintText: 'Search here...',
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
                                            Text('Request ID'),
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
                                            Text('Amount'),
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
                        border:
                            Border.all(color: AppColor.green.withOpacity(0.6)),
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
              height: 15,
            ),
            Flexible(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 30,
                        width: 320,
                        child: TabBar(
                          labelColor: AppColor.green,
                          labelStyle: TextStyle(fontSize: 15),
                          unselectedLabelColor: AppColor.grey1,
                          indicator: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.0),
                              color: Colors.green.withOpacity(0.2)),
                          controller: tabController,
                          tabs: const [
                            Tab(text: 'Pending'),
                            Tab(text: 'Approved'),
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
                                child: ListView.builder(
                                    itemCount: 5,
                                    itemBuilder: (BuildContext context, int index) {
                                      return  Container(
                                        padding: EdgeInsets.only(
                                            left: 10, right: 10, top: 5),
                                        margin: const EdgeInsets.only(bottom: 1),
                                        child: Card(
                                          elevation: 1,
                                          margin: EdgeInsets.zero,
                                          clipBehavior: Clip.hardEdge,
                                          child: Row(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.all(50),
                                                width: 10,
                                                decoration: BoxDecoration(
                                                  color: AppColor.orange,
                                                ),
                                              ),
                                              SizedBox(
                                                width: Get.width * .03,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceBetween,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Text(
                                                            "Request ID:",
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              fontFamily: AppFont
                                                                  .poppinsMedium,
                                                              color: Colors.black,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 5,
                                                          ),
                                                          Text(
                                                            "#1234567890",
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              fontFamily: AppFont
                                                                  .poppinsSemiBold,
                                                              color: Colors.black,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        width: Get.width * .16,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Text(
                                                            "Amount:",
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              fontFamily: AppFont
                                                                  .poppinsMedium,
                                                              color: Colors.black,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: 5,
                                                          ),
                                                          Text(
                                                            "₦456",
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              fontFamily: AppFont
                                                                  .poppinsSemiBold,
                                                              color: const Color
                                                                  .fromRGBO(
                                                                  0, 0, 0, 1),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: Get.height * .015,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "Vendor Code:",
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          fontFamily: AppFont
                                                              .poppinsMedium,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text(
                                                        "1223456",
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          fontWeight:
                                                          FontWeight.bold,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: Get.height * .015,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "Enumeral Solutions Limited",
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          fontFamily: AppFont
                                                              .poppinsMedium,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: Get.width * .2,
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          Navigator.pushNamed(
                                                              context,
                                                              AppScreen
                                                                  .withdrawDetailsScreen);
                                                        },
                                                        child: Row(
                                                          children: [
                                                            Text(
                                                              "View Details",
                                                              style: TextStyle(
                                                                decoration:
                                                                TextDecoration
                                                                    .underline,
                                                                fontSize: 12,
                                                                fontFamily: AppFont
                                                                    .poppinsMedium,
                                                                color:
                                                                Colors.green,
                                                              ),
                                                            ),
                                                            Icon(
                                                              Icons
                                                                  .arrow_forward_ios_outlined,
                                                              color:
                                                              AppColor.green,
                                                              size: 12,
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    }),




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
                                    (index) => Container(
                                      padding: EdgeInsets.only(
                                          left: 10, right: 10, top: 5),
                                      margin: const EdgeInsets.only(bottom: 1),
                                      child: Card(
                                        elevation: 1,
                                        margin: EdgeInsets.zero,
                                        clipBehavior: Clip.hardEdge,
                                        child: Row(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(50),
                                              width: 10,
                                              decoration: BoxDecoration(
                                                color: AppColor.green,
                                              ),
                                            ),
                                            SizedBox(
                                              width: Get.width * .03,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                          "Request ID:",
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            fontFamily: AppFont
                                                                .poppinsMedium,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(
                                                          "#1234567890",
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            fontFamily: AppFont
                                                                .poppinsSemiBold,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      width: Get.width * .16,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          "Amount:",
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            fontFamily: AppFont
                                                                .poppinsMedium,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(
                                                          "₦456",
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            fontFamily: AppFont
                                                                .poppinsSemiBold,
                                                            color: const Color
                                                                    .fromRGBO(
                                                                0, 0, 0, 1),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: Get.height * .015,
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Vendor Code:",
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        fontFamily: AppFont
                                                            .poppinsMedium,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                      "1223456",
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: Get.height * .015,
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Enumeral Solutions Limited",
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        fontFamily: AppFont
                                                            .poppinsMedium,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: Get.width * .2,
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        Navigator.pushNamed(
                                                            context,
                                                            AppScreen
                                                                .withdrawDetailsScreen);
                                                      },
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            "View Details",
                                                            style: TextStyle(
                                                              decoration:
                                                                  TextDecoration
                                                                      .underline,
                                                              fontSize: 12,
                                                              fontFamily: AppFont
                                                                  .poppinsMedium,
                                                              color:
                                                                  Colors.green,
                                                            ),
                                                          ),
                                                          Icon(
                                                            Icons
                                                                .arrow_forward_ios_outlined,
                                                            color:
                                                                AppColor.green,
                                                            size: 12,
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
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
                                    (index) => Container(
                                      padding: EdgeInsets.only(
                                          left: 10, right: 10, top: 5),
                                      margin: const EdgeInsets.only(bottom: 1),
                                      child: Card(
                                        elevation: 1,
                                        margin: EdgeInsets.zero,
                                        clipBehavior: Clip.hardEdge,
                                        child: Row(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(50),
                                              width: 10,
                                              decoration: BoxDecoration(
                                                color: Colors.red,
                                              ),
                                            ),
                                            SizedBox(
                                              width: Get.width * .03,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                          "Request ID:",
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            fontFamily: AppFont
                                                                .poppinsMedium,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(
                                                          "#1234567890",
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            fontFamily: AppFont
                                                                .poppinsSemiBold,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      width: Get.width * .16,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          "Amount:",
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            fontFamily: AppFont
                                                                .poppinsMedium,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(
                                                          "₦456",
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            fontFamily: AppFont
                                                                .poppinsSemiBold,
                                                            color: const Color
                                                                    .fromRGBO(
                                                                0, 0, 0, 1),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: Get.height * .015,
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Vendor Code:",
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        fontFamily: AppFont
                                                            .poppinsMedium,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                      "1223456",
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: Get.height * .015,
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Enumeral Solutions Limited",
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        fontFamily: AppFont
                                                            .poppinsMedium,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: Get.width * .2,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          "View Details",
                                                          style: TextStyle(
                                                            decoration:
                                                                TextDecoration
                                                                    .underline,
                                                            fontSize: 12,
                                                            fontFamily: AppFont
                                                                .poppinsMedium,
                                                            color: Colors.green,
                                                          ),
                                                        ),
                                                        Icon(
                                                          Icons
                                                              .arrow_forward_ios_outlined,
                                                          color: AppColor.green,
                                                          size: 12,
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
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
      ),
    );
  }
}
