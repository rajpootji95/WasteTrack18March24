import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:waste_track/Models/Revenue%20Container%20Model/revenue_container_model.dart';
import 'package:waste_track/Utils/Components/Search%20Text%20Field/custom_search_text_field.dart';
import 'package:waste_track/Utils/Components/app_font.dart';
import 'package:waste_track/Utils/Components/custom_radio_button.dart';
import 'package:waste_track/Utils/behavior.dart';
import 'package:waste_track/Utils/colors/app_colors.dart';
import 'package:waste_track/Utils/images/images.dart';

class VendorRevenueGenerated extends StatefulWidget {
  const VendorRevenueGenerated({super.key});

  @override
  State<VendorRevenueGenerated> createState() => _VendorRevenueGeneratedState();
}

class _VendorRevenueGeneratedState extends State<VendorRevenueGenerated> {
  bool isButtonSelected = false;
  final List<RevenueItemModel> containerItems = [
    RevenueItemModel(
        title: 'This Weak',
        imageUrl: AppImages.pay_box,
        description: "This Week",
        price: '₦3,500'),
    RevenueItemModel(
        title: 'This Weak',
        imageUrl: AppImages.stock1,
        description: "This Week",
        price: '₦3,500'),
    RevenueItemModel(
        title: 'This Month',
        imageUrl: AppImages.stock,
        description: "This Week",
        price: '₦3,500'),
    RevenueItemModel(
        title: 'This Weak',
        imageUrl: AppImages.stock1,
        description: "This Week",
        price: '₦3,500'),

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
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Revenue Generated",
                style: TextStyle(
                    fontFamily: AppFont.poppinsBold,
                    color: AppColor.green,
                    fontSize: 17),
              ),
              SizedBox(
                height: 10,
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
                height: 20,
              ),
              Expanded(
                child: NestedScrollView(
                  headerSliverBuilder:
                      (BuildContext context, bool innerBoxIsScrolled) {
                    // These are the slivers that show up in the "outer" scroll view.
                    return <Widget>[
                      SliverToBoxAdapter(
                        child: AspectRatio(
                          aspectRatio: 9 / 3,
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
                                      side: BorderSide(color: AppColor.grey),
                                      borderRadius: BorderRadius.circular(0)),
                                  clipBehavior: Clip.hardEdge,
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        top: 10, left: 10, right: 10),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Flexible(
                                              child: Text(
                                                "This Weak",
                                                style: TextStyle(
                                                    fontFamily:
                                                        AppFont.poppinsMedium,
                                                    fontSize: 12,
                                                    color: AppColor.black),
                                              ),
                                            ),
                                            Center(
                                                child: Image.asset(
                                              containerItems[index].imageUrl,
                                              height: 32,
                                            ))
                                          ],
                                        ),
                                        SizedBox(
                                          height: 3,
                                        ),
                                        Flexible(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "₦1,000",
                                                style: TextStyle(
                                                    fontFamily:
                                                        AppFont.poppinsSemiBold,
                                                    fontSize: 18,
                                                    color: AppColor.green),
                                              ),
                                              Text(
                                                "-5% compared to last week",
                                                style: TextStyle(
                                                    fontFamily:
                                                        AppFont.poppinsMedium,
                                                    fontSize: 11,
                                                    color: AppColor.grey1),
                                              ),
                                            ],
                                          ),
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
                    ];
                  },
                  body: ScrollConfiguration(
                    behavior: MyBehavior(),
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: 10),
                              margin: const EdgeInsets.only(bottom: 3, top: 10),
                              child: Card(
                                elevation: 1,
                                margin: EdgeInsets.zero,
                                shape: ContinuousRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
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
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Expanded(
                                            child: const Text(
                                              "Order Date",
                                              style: TextStyle(
                                                  color: AppColor.black,
                                                  fontSize: 13,
                                                  fontFamily:
                                                      AppFont.poppinsLight),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: const Text(
                                              "14 Sept 2023, 12:45PM",
                                              style: TextStyle(
                                                  color: AppColor.black,
                                                  fontSize: 13,
                                                  fontFamily:
                                                      AppFont.poppinsLight),
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
                                              "Vendor Code",
                                              style: TextStyle(
                                                  color: AppColor.black,
                                                  fontSize: 13,
                                                  fontFamily:
                                                      AppFont.poppinsLight),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: const Text(
                                              "123456",
                                              style: TextStyle(
                                                  color: AppColor.black,
                                                  fontSize: 12,
                                                  fontFamily:
                                                      AppFont.poppinsLight),
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
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Expanded(
                                            child: const Text(
                                              "Company Name",
                                              style: TextStyle(
                                                  color: AppColor.black,
                                                  fontSize: 13,
                                                  fontFamily:
                                                      AppFont.poppinsLight),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: const Text(
                                              "Enumeral Solutions Ltd.",
                                              style: TextStyle(
                                                  color: AppColor.black,
                                                  fontSize: 12,
                                                  fontFamily:
                                                      AppFont.poppinsLight),
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
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Expanded(
                                            child: const Text(
                                              "Order Amount",
                                              style: TextStyle(
                                                  color: AppColor.black,
                                                  fontSize: 13,
                                                  fontFamily:
                                                      AppFont.poppinsLight),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: const Text(
                                              "₦15,000.00",
                                              style: TextStyle(
                                                  color: AppColor.black,
                                                  fontSize: 12,
                                                  fontFamily:
                                                      AppFont.poppinsLight),
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
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Expanded(
                                            child: const Text(
                                              "Revenue (Purchase)",
                                              style: TextStyle(
                                                  color: AppColor.black,
                                                  fontSize: 13,
                                                  fontFamily:
                                                      AppFont.poppinsLight),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: const Text(
                                              "₦1,500.00",
                                              style: TextStyle(
                                                  color: AppColor.black,
                                                  fontSize: 12,
                                                  fontFamily:
                                                      AppFont.poppinsLight),
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
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Expanded(
                                            child: const Text(
                                              "Revenue (Pickup)",
                                              style: TextStyle(
                                                  color: AppColor.black,
                                                  fontSize: 13,
                                                  fontFamily:
                                                      AppFont.poppinsLight),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: const Text(
                                              "₦2,250.00",
                                              style: TextStyle(
                                                  color: AppColor.black,
                                                  fontSize: 12,
                                                  fontFamily:
                                                      AppFont.poppinsLight),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 20,
                              top: 10,
                              child: Container(
                                padding: EdgeInsets.only(
                                    top: 4, left: 11, right: 11, bottom: 4),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: AppColor.greenMedium1,
                                ),
                                child: Text(
                                  '#1234567890',
                                  style: TextStyle(
                                      fontSize: 11, color: AppColor.green),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
