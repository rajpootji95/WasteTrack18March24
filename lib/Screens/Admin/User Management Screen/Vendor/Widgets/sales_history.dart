import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:waste_track/App%20Routes/app_routes.dart';
import 'package:waste_track/Utils/Components/Search%20Text%20Field/custom_search_text_field.dart';
import 'package:waste_track/Utils/Components/app_font.dart';
import 'package:waste_track/Utils/behavior.dart';
import 'package:waste_track/Utils/colors/app_colors.dart';
import 'package:waste_track/Utils/images/images.dart';

import '../../../../../../Utils/Components/custom_radio_button.dart';

class SalesHistory extends StatefulWidget {
  const SalesHistory({super.key});

  @override
  State<SalesHistory> createState() => _SalesHistoryState();
}

class _SalesHistoryState extends State<SalesHistory> {
  bool isButtonSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 15),
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
                                          Text('Buyer Name'),
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
                                          Text('Quantity'),
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
                                          Text('Date of Purchases'),
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
            child: ScrollConfiguration(
              behavior: MyBehavior(),
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 10),
                        margin: const EdgeInsets.only(bottom: 3),
                        child: Card(
                          elevation: 1,
                          margin: EdgeInsets.zero,
                          shape: ContinuousRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          clipBehavior: Clip.hardEdge,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 7,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                      child: const Text(
                                        "Buyer Name",
                                        style: TextStyle(
                                            color: AppColor.black,
                                            fontSize: 12,
                                            fontFamily: AppFont.poppinsLight),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: const Text(
                                        "Lorem ipsum",
                                        style: TextStyle(
                                            color: AppColor.black,
                                            fontSize: 12,
                                            fontFamily: AppFont.poppinsLight),
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
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                      child: const Text(
                                        "Date of Purchase",
                                        style: TextStyle(
                                            color: AppColor.black,
                                            fontSize: 12,
                                            fontFamily: AppFont.poppinsLight),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: const Text(
                                        "15 Sept 2023, 01:30PM",
                                        style: TextStyle(
                                            color: AppColor.black,
                                            fontSize: 12,
                                            fontFamily: AppFont.poppinsLight),
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
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, AppScreen.allViewDetailsScreen);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'View Details',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: AppColor.green,
                                  fontSize: 10,
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios_outlined,
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
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
