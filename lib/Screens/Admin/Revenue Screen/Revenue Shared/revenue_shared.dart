import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:waste_track/Screens/Admin/Revenue%20Screen/Revenue%20Shared/Widgets/revenue_enforcement_team.dart';
import 'package:waste_track/Screens/Admin/Revenue%20Screen/Revenue%20Shared/Widgets/revenue_environmental_consultants.dart';
import 'package:waste_track/Screens/Admin/Revenue%20Screen/Revenue%20Shared/Widgets/revenue_nylon_productin_company.dart';
import 'package:waste_track/Screens/Admin/Revenue%20Screen/Revenue%20Shared/Widgets/revenue_state_government_egency.dart';
import 'package:waste_track/Screens/Admin/Revenue%20Screen/Revenue%20Shared/Widgets/revenue_vendor.dart';
import 'package:waste_track/Screens/Admin/Revenue%20Screen/Revenue%20Shared/Widgets/revenue_waste_management_agency.dart';
import 'package:waste_track/Utils/Components/Search%20Text%20Field/custom_search_text_field.dart';
import 'package:waste_track/Utils/Components/app_font.dart';
import 'package:waste_track/Utils/Components/custom_radio_button.dart';
import 'package:waste_track/Utils/behavior.dart';
import 'package:waste_track/Utils/colors/app_colors.dart';
import 'package:waste_track/Utils/images/images.dart';

class RevenueShared extends StatefulWidget {
  const RevenueShared({super.key});

  @override
  State<RevenueShared> createState() => _RevenueSharedState();
}

class _RevenueSharedState extends State<RevenueShared> {
  bool isButtonSelected = false;
  List<Widget> containerWidgets = [
    RevenueStateGovernmentAgency(),
    RevenueNylonProductionCompany(),
    RevenueEnvironmentalConsultants(),
    RevenueWasteManagementAgency(),
    RevenueVendor(),
    RevenueEnforcementTeam(),
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
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 7, left: 18),
          child: Row(
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
    );
  }
}
