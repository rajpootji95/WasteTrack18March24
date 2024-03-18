import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:waste_track/Screens/Sub%20Admin/Sub%20Revenue/Widgets/rev_enforcement_team.dart';
import 'package:waste_track/Screens/Sub%20Admin/Sub%20Revenue/Widgets/rev_environment_consultants.dart';
import 'package:waste_track/Screens/Sub%20Admin/Sub%20Revenue/Widgets/rev_nylon_pro_company.dart';
import 'package:waste_track/Screens/Sub%20Admin/Sub%20Revenue/Widgets/rev_state_government_agency.dart';
import 'package:waste_track/Screens/Sub%20Admin/Sub%20Revenue/Widgets/rev_vendor.dart';
import 'package:waste_track/Screens/Sub%20Admin/Sub%20Revenue/Widgets/rev_waste_mana_agency.dart';
import 'package:waste_track/Utils/Components/Search%20Text%20Field/custom_search_text_field.dart';
import 'package:waste_track/Utils/Components/app_font.dart';
import 'package:waste_track/Utils/Components/custom_radio_button.dart';
import 'package:waste_track/Utils/behavior.dart';
import 'package:waste_track/Utils/colors/app_colors.dart';
import 'package:waste_track/Utils/images/images.dart';

class SubAdminRevenue extends StatefulWidget {
  const SubAdminRevenue({super.key});

  @override
  State<SubAdminRevenue> createState() => _SubAdminRevenueState();
}

class _SubAdminRevenueState extends State<SubAdminRevenue> {
  bool isButtonSelected = false;
  List<Widget> containerWidgets = [
    RevStateManagementAgency(),
    RevNylonProductionCompany(),
    EnvironmentConsultants(),
    RevWasteManagementAgency(),
    RevVendor(),
    RevEnforcementTeam(),
  ];
  List<String> containerName = [
    'State Government Agency',
    'Nylon Production Company',
    'Environment Consultants',
    'Waste Management Agency',
    'Vendor',
    'Enforcement Team',
  ];
  int selectedWidgetIndex = 0;

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Revenue Shared",
                  style: TextStyle(
                      fontFamily: AppFont.poppinsBold,
                      fontSize: 17,
                      color: AppColor.green),
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
                            fontSize: 12,
                            color: AppColor.grey1.withOpacity(0.5)),
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text('Order Date'),
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
                                            color:
                                                Colors.black.withOpacity(0.59),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20,
                                                right: 20,
                                                top: 10,
                                                bottom: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
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
                                            color:
                                                Colors.black.withOpacity(0.59),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20,
                                                right: 20,
                                                top: 10,
                                                bottom: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
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
                                            color:
                                                Colors.black.withOpacity(0.59),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20,
                                                right: 20,
                                                top: 10,
                                                bottom: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text('Order Amount'),
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
                                            color:
                                                Colors.black.withOpacity(0.59),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20,
                                                right: 20,
                                                top: 10,
                                                bottom: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text('Revenue Earned'),
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
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Flexible(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.04,
                    child: ScrollConfiguration(
                      behavior: MyBehavior(),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: containerWidgets.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.only(
                                top: 7, left: 10, right: 10, bottom: 2),
                            decoration: selectedWidgetIndex == index
                                ? BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    color: AppColor.grey)
                                : BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    color: Colors.transparent),
                            margin: EdgeInsets.symmetric(horizontal: 4.0),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedWidgetIndex = index;
                                });
                              },
                              child: Text(
                                containerName[index],
                                softWrap: true,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: AppFont.poppinsLight,
                                  fontSize: 14.0,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Divider(
                  color: AppColor.green,
                  thickness: 1,
                ),
                SizedBox(
                  height: 7,
                ),
                Expanded(
                  child: selectedWidgetIndex < containerWidgets.length
                      ? containerWidgets[selectedWidgetIndex]
                      : SizedBox(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
