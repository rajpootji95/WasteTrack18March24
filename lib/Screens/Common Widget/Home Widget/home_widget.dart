import 'package:flutter/material.dart';
import 'package:waste_track/Models/Home%20Container%20Model/home_conntainer_model.dart';
import 'package:waste_track/Screens/Login%20Screen/login_screen.dart';
import 'package:waste_track/Utils/Components/app_font.dart';
import 'package:waste_track/Utils/Components/dataStroage_database.dart';
import 'package:waste_track/Utils/behavior.dart';
import 'package:waste_track/Utils/colors/app_colors.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({
    super.key,
    required this.widgetList,
  });

  final List<Widget> widgetList;

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  String userType = "admin";
  List<ContainerItemModel> containerItems = [];

  @override
  void initState() {
    getUserType();
    super.initState();
  }

  getUserType() async {
    var userType = await SharedPref().getUserType();
    setState(() {
      if (userType == "1") {
        containerItems = [
          ContainerItemModel(
              name: 'User Management Model',
              imageUrl: 'assets/images/user.png',
              color: AppColor.blueLight),
          ContainerItemModel(
              name: 'Nylon Management',
              imageUrl: 'assets/images/nylon.png',
              color: AppColor.pinkLight),
          ContainerItemModel(
              name: 'Vendor Management',
              imageUrl: 'assets/images/vendor.png',
              color: AppColor.yellowLight),
          ContainerItemModel(
              name: 'Revenue',
              imageUrl: 'assets/images/revenue.png',
              color: AppColor.redLight),
          ContainerItemModel(
              name: 'Withdraw Request',
              imageUrl: 'assets/images/withdraw.png',
              color: AppColor.seaGreenLight),
          ContainerItemModel(
              name: 'Invoices',
              imageUrl: 'assets/images/invocies.png',
              color: AppColor.purpleLight),
          ContainerItemModel(
              name: 'Waste Collection',
              imageUrl: 'assets/images/waste.png',
              color: AppColor.purpleDark),
          ContainerItemModel(
              name: 'Calendar',
              imageUrl: 'assets/images/calendar.png',
              color: AppColor.purple),
          ContainerItemModel(
              name: 'Ticketing',
              imageUrl: 'assets/images/ticketing.png',
              color: AppColor.greenMedium),
        ];
      } else if (userType == "subAdmin") {
        containerItems = [
          ContainerItemModel(
              name: 'User Management Model',
              imageUrl: 'assets/images/user.png',
              color: AppColor.blueLight),
          ContainerItemModel(
              name: 'Nylon Management',
              imageUrl: 'assets/images/nylon.png',
              color: AppColor.pinkLight),
          ContainerItemModel(
              name: 'Revenue',
              imageUrl: 'assets/images/revenue.png',
              color: AppColor.redLight),
          ContainerItemModel(
              name: 'Invoices',
              imageUrl: 'assets/images/invocies.png',
              color: AppColor.purpleLight),
          ContainerItemModel(
              name: 'Waste Collection',
              imageUrl: 'assets/images/waste.png',
              color: AppColor.purpleDark),
          ContainerItemModel(
              name: 'Calendar',
              imageUrl: 'assets/images/calendar.png',
              color: AppColor.purple),
          ContainerItemModel(
              name: 'Ticketing',
              imageUrl: 'assets/images/ticketing.png',
              color: AppColor.greenMedium),
        ];
      } else if (userType == "vendor") {
        containerItems = [
          ContainerItemModel(
              name: 'Staff Management',
              imageUrl: 'assets/images/user.png',
              color: AppColor.blueLight),
          ContainerItemModel(
              name: 'Order Management',
              imageUrl: 'assets/images/nylon.png',
              color: AppColor.pinkLight),
          ContainerItemModel(
              name: 'Waste Management',
              imageUrl: 'assets/images/vendor_waste.png',
              color: AppColor.yellowLight),
          ContainerItemModel(
              name: 'Sales Report',
              imageUrl: 'assets/images/invocies.png',
              color: AppColor.purpleLight),
          ContainerItemModel(
              name: 'Withdraw Request',
              imageUrl: 'assets/images/withdraw.png',
              color: AppColor.seaGreenLight),
          ContainerItemModel(
              name: 'Revenue Generated',
              imageUrl: 'assets/images/revenue.png',
              color: AppColor.redLight),
          ContainerItemModel(
              name: 'Assigned Areas',
              imageUrl: 'assets/images/vendor_assigned.png',
              color: AppColor.purpleDark),
          ContainerItemModel(
              name: 'Calendar',
              imageUrl: 'assets/images/calendar.png',
              color: AppColor.purple),
          ContainerItemModel(
              name: 'Ticketing',
              imageUrl: 'assets/images/ticketing.png',
              color: AppColor.greenMedium),
        ];
      } else if (userType == "vendorStaff") {
        containerItems = [
          ContainerItemModel(
              name: 'Waste Collected',
              imageUrl: 'assets/images/vendor_waste.png',
              color: AppColor.yellowLight),
          ContainerItemModel(
              name: 'Sales Report',
              imageUrl: 'assets/images/invocies.png',
              color: AppColor.purpleLight),
          ContainerItemModel(
              name: 'Calendar',
              imageUrl: 'assets/images/calendar.png',
              color: AppColor.purple),
          ContainerItemModel(
              name: 'Ticketing',
              imageUrl: 'assets/images/ticketing.png',
              color: AppColor.greenMedium),
        ];
      } else if (userType == "wasteManagementAgency") {
        containerItems = [
          ContainerItemModel(
              name: 'Staff Management',
              imageUrl: 'assets/images/user.png',
              color: AppColor.blueLight),
          ContainerItemModel(
              name: 'Nylon Management',
              imageUrl: 'assets/images/nylon.png',
              color: AppColor.pinkLight),
          ContainerItemModel(
              name: 'Waste Collection',
              imageUrl: 'assets/images/invocies.png',
              color: AppColor.purpleDark),
          ContainerItemModel(
              name: 'Revenue Generated',
              imageUrl: 'assets/images/revenue.png',
              color: AppColor.redLight),
          ContainerItemModel(
              name: 'Sales Report',
              imageUrl: 'assets/images/invocies.png',
              color: AppColor.purpleLight),
          ContainerItemModel(
              name: 'Calendar',
              imageUrl: 'assets/images/calendar.png',
              color: AppColor.purple),
          ContainerItemModel(
              name: 'Ticketing',
              imageUrl: 'assets/images/ticketing.png',
              color: AppColor.greenMedium),
        ];
      } else if (userType == "wasteManagementStaff") {
        containerItems = [
          ContainerItemModel(
              name: 'Waste Collected',
              imageUrl: 'assets/images/was_delete.png',
              color: AppColor.maroon),
          ContainerItemModel(
              name: 'Sales Report',
              imageUrl: 'assets/images/invocies.png',
              color: AppColor.purpleLight),
          ContainerItemModel(
              name: 'Calendar',
              imageUrl: 'assets/images/was_cal.png',
              color: AppColor.blueLight),
          ContainerItemModel(
              name: 'Ticketing',
              imageUrl: 'assets/images/ticketing.png',
              color: AppColor.greenMedium),
        ];
      } else {
        containerItems = [
          ContainerItemModel(
              name: 'Nylon Management',
              imageUrl: 'assets/images/nylon.png',
              color: AppColor.pinkLight),
          ContainerItemModel(
              name: 'Revenue Generated',
              imageUrl: 'assets/images/revenue.png',
              color: AppColor.redLight),
          ContainerItemModel(
              name: 'Sales Report',
              imageUrl: 'assets/images/invocies.png',
              color: AppColor.purpleLight),
          ContainerItemModel(
              name: 'Waste Collection',
              imageUrl: 'assets/images/invocies.png',
              color: AppColor.purpleDark),
          ContainerItemModel(
              name: 'Calendar',
              imageUrl: 'assets/images/calendar.png',
              color: AppColor.purple),
          ContainerItemModel(
              name: 'Ticketing',
              imageUrl: 'assets/images/ticketing.png',
              color: AppColor.greenMedium),
        ];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (userType == "vendorStaff") // Display only for vendorStaff
          Container(
            padding: EdgeInsets.all(13.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: AppColor.green,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.qr_code_scanner_rounded,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 7,
                ),
                Text(
                  'Scan Nylon Serial QR Code',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: AppFont.poppinsSemiBold,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        SizedBox(
          height: 7,
        ),
        Expanded(
          child: ScrollConfiguration(
            behavior: MyBehavior(),
            child: GridView.builder(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 140.0,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  childAspectRatio: 4.0),
              itemCount: containerItems.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => widget.widgetList[index]),
                    );
                  },
                  child: Card(
                    elevation: 1,
                    margin: EdgeInsets.zero,
                    shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    clipBehavior: Clip.hardEdge,
                    child: Row(
                      children: [
                        Container(
                          width: 10,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color: containerItems[index].color,
                          ),
                        ),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 7,
                              ),
                              Image.asset(
                                containerItems[index].imageUrl,
                                height: 70,
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 14, right: 12),
                                child: Text(
                                  containerItems[index].name,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
