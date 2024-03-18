import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:waste_track/Utils/Components/app_font.dart';
import 'package:waste_track/Utils/behavior.dart';
import 'package:waste_track/Utils/colors/app_colors.dart';
import 'package:waste_track/Utils/images/images.dart';

class WithdrawViewDetails extends StatefulWidget {
  const WithdrawViewDetails({super.key});

  @override
  State<WithdrawViewDetails> createState() => _WithdrawViewDetailsState();
}

class _WithdrawViewDetailsState extends State<WithdrawViewDetails> {
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
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CupertinoAlertDialog(
                          title: Column(
                            children: [
                              Text(
                                "Do you want to Reject this Request?",
                                style: TextStyle(
                                    fontSize: 15, color: AppColor.black),
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
                                        borderRadius: BorderRadius.circular(7),
                                        color: AppColor.green,
                                      ),
                                      child: Text(
                                        'Cancel',
                                        style: TextStyle(
                                            fontFamily: AppFont.poppinsLight,
                                            fontSize: 15,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          Future.delayed(Duration(seconds: 1),
                                              () {
                                            Navigator.pop(context);
                                            Navigator.pop(context);
                                          });

                                          return CupertinoAlertDialog(
                                            title: Row(
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.all(10),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                    color: Colors.red
                                                        .withOpacity(0.1),
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
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.red),
                                                  ),
                                                ),
                                              ],
                                            ), // show pop-up
                                          );
                                        },
                                      );
                                    },
                                    child: Container(
                                      padding: EdgeInsets.only(
                                          left: 20,
                                          right: 20,
                                          bottom: 10,
                                          top: 10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(7),
                                        color: AppColor.green,
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Reject',
                                          style: TextStyle(
                                              fontFamily: AppFont.poppinsLight,
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
                  child: Container(
                    padding:
                        EdgeInsets.only(top: 7, right: 15, left: 15, bottom: 7),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.red),
                        borderRadius: BorderRadius.circular(10),
                        color: AppColor.redLight.withOpacity(0.3)),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          AppImages.cancel,
                          height: 25,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Reject',
                          style: TextStyle(
                              color: Colors.red,
                              fontFamily: AppFont.poppinsSemiBold),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
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
                                "Do you want to Approve this Request?",
                                style: TextStyle(
                                    fontSize: 15, color: AppColor.black),
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
                                        borderRadius: BorderRadius.circular(7),
                                        color: AppColor.green,
                                      ),
                                      child: Text(
                                        'Cancel',
                                        style: TextStyle(
                                            fontFamily: AppFont.poppinsLight,
                                            fontSize: 15,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          Future.delayed(Duration(seconds: 1),
                                              () {
                                            Navigator.pop(context);
                                            Navigator.pop(context);
                                          });

                                          return CupertinoAlertDialog(
                                            title: Row(
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.all(9),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                    color: AppColor.green
                                                        .withOpacity(0.7),
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
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        color: AppColor.green),
                                                  ),
                                                ),
                                              ],
                                            ), // show pop-up
                                          );
                                        },
                                      );
                                    },
                                    child: Container(
                                      padding: EdgeInsets.only(
                                          left: 20,
                                          right: 20,
                                          bottom: 10,
                                          top: 10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(7),
                                        color: AppColor.green,
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Approve',
                                          style: TextStyle(
                                              fontFamily: AppFont.poppinsLight,
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
                  child: Container(
                    padding: EdgeInsets.all(7),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.green),
                        borderRadius: BorderRadius.circular(10),
                        color: AppColor.greenMedium1.withOpacity(0.5)),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          AppImages.check_circle,
                          height: 25,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Approve',
                          style: TextStyle(
                              color: Colors.green,
                              fontFamily: AppFont.poppinsSemiBold),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Flexible(
              child: ScrollConfiguration(
                behavior: MyBehavior(),
                child: ListView(
                  children: [
                    Card(
                      elevation: 1,
                      shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      clipBehavior: Clip.hardEdge,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Request Info",
                              style: TextStyle(
                                  color: AppColor.black,
                                  fontSize: 15,
                                  fontFamily: AppFont.poppinsBold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  " Request ID :",
                                  style: TextStyle(
                                      color: AppColor.black,
                                      fontSize: 13,
                                      fontFamily: AppFont.poppinsLight),
                                ),
                                Text(
                                  "#1234567890",
                                  style: TextStyle(
                                      color: AppColor.black,
                                      fontSize: 13,
                                      fontFamily: AppFont.poppinsLight),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Request Date & Time :",
                                  style: TextStyle(
                                      color: AppColor.black,
                                      fontSize: 13,
                                      fontFamily: AppFont.poppinsLight),
                                ),
                                Text(
                                  "2 Sept 2023, 11:45AM",
                                  style: TextStyle(
                                      color: AppColor.black,
                                      fontSize: 13,
                                      fontFamily: AppFont.poppinsLight),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Approval Date & Time:",
                                  style: TextStyle(
                                      color: AppColor.black,
                                      fontSize: 14,
                                      fontFamily: AppFont.poppinsLight),
                                ),
                                Text(
                                  "2 Sept 2023, 11:45AM",
                                  style: TextStyle(
                                      color: AppColor.black,
                                      fontSize: 14,
                                      fontFamily: AppFont.poppinsLight),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Rejection Date & Time:",
                                  style: TextStyle(
                                      color: AppColor.black,
                                      fontSize: 14,
                                      fontFamily: AppFont.poppinsLight),
                                ),
                                Text(
                                  "2 Sept 2023, 11:45AM",
                                  style: TextStyle(
                                      color: AppColor.black,
                                      fontSize: 14,
                                      fontFamily: AppFont.poppinsLight),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Status:",
                                  style: TextStyle(
                                      color: AppColor.black,
                                      fontSize: 13,
                                      fontFamily: AppFont.poppinsLight),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.circle,
                                      color: AppColor.orange,
                                      size: 20,
                                    ),
                                    Text(
                                      "Pending",
                                      style: TextStyle(
                                          color: AppColor.orange,
                                          fontSize: 13,
                                          fontFamily: AppFont.poppinsSemiBold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Status:",
                                  style: TextStyle(
                                      color: AppColor.black,
                                      fontSize: 13,
                                      fontFamily: AppFont.poppinsLight),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.circle,
                                      color: AppColor.green,
                                      size: 20,
                                    ),
                                    Text(
                                      "Approve",
                                      style: TextStyle(
                                          color: AppColor.green,
                                          fontSize: 13,
                                          fontFamily: AppFont.poppinsSemiBold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Status:",
                                  style: TextStyle(
                                      color: AppColor.black,
                                      fontSize: 13,
                                      fontFamily: AppFont.poppinsLight),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.circle,
                                      color: Colors.red,
                                      size: 20,
                                    ),
                                    Text(
                                      "Rejected",
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 13,
                                          fontFamily: AppFont.poppinsSemiBold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Card(
                      elevation: 1,
                      shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      clipBehavior: Clip.hardEdge,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  " Vendor Details",
                                  style: TextStyle(
                                      color: AppColor.black,
                                      fontSize: 13,
                                      fontFamily: AppFont.poppinsSemiBold),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      " Vendor Code :",
                                      style: TextStyle(
                                          color: AppColor.black,
                                          fontSize: 14,
                                          fontFamily: AppFont.poppinsLight),
                                    ),
                                    Text(
                                      " 123456",
                                      style: TextStyle(
                                          color: AppColor.green,
                                          fontSize: 14,
                                          fontFamily: AppFont.poppinsSemiBold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              " Enumeral Waste Solutions Limited",
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: AppColor.black,
                                  fontSize: 13,
                                  fontFamily: AppFont.poppinsSemiBold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.person_outline_rounded,
                                  color: AppColor.green,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  " Lorem Ipsum",
                                  style: TextStyle(
                                      color: AppColor.black,
                                      fontSize: 13,
                                      fontFamily: AppFont.poppinsMedium),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.email_outlined,
                                    color: AppColor.green),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  " subadmin@gmail.com",
                                  style: TextStyle(
                                      color: AppColor.black,
                                      fontSize: 13,
                                      fontFamily: AppFont.poppinsMedium),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.call_end_outlined,
                                    color: AppColor.green),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  "+234 90-461-4000",
                                  style: TextStyle(
                                      color: AppColor.black,
                                      fontSize: 13,
                                      fontFamily: AppFont.poppinsMedium),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.location_on_outlined,
                                    color: AppColor.green),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  "abc colony, xyz area, pqr city",
                                  style: TextStyle(
                                      color: AppColor.black,
                                      fontSize: 13,
                                      fontFamily: AppFont.poppinsMedium),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Card(
                      elevation: 1,
                      margin: EdgeInsets.zero,
                      shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      clipBehavior: Clip.hardEdge,
                      child: Container(
                        padding: EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Serial Details",
                                    style: TextStyle(
                                        fontFamily: AppFont.poppinsSemiBold,
                                        fontSize: 14)),
                                Text("Collected On",
                                    style: TextStyle(
                                        fontFamily: AppFont.poppinsSemiBold,
                                        fontSize: 14)),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Column(
                              children: <Widget>[
                                for (int i = 0; i < 10; i++)
                                  Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("HCX8849287896",
                                              style: TextStyle(
                                                  fontFamily:
                                                      'AppFont.poppinsRegular',
                                                  fontSize: 13)),
                                          Text("2 Sept 2023, 11:45AM",
                                              style: TextStyle(
                                                  fontFamily:
                                                      'AppFont.poppinsRegular',
                                                  fontSize: 13)),
                                        ],
                                      ),
                                      SizedBox(
                                          height: 12), // Add space between Rows
                                    ],
                                  ),
                              ],
                            ),
                            Divider(
                              color: AppColor.grey,
                              thickness: 1,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Price/ Bag",
                                    style: TextStyle(
                                        color: AppColor.black, fontSize: 15)),
                                Text("₦380.00",
                                    style: TextStyle(
                                        fontFamily: AppFont.poppinsSemiBold,
                                        fontSize: 13)),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Revenue Share",
                                    style: TextStyle(
                                        fontFamily: AppFont.poppinsRegular,
                                        fontSize: 13)),
                                Text("₦57.00",
                                    style: TextStyle(
                                        fontFamily: AppFont.poppinsSemiBold,
                                        fontSize: 13)),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Total Amount",
                                    style: TextStyle(
                                        fontFamily: AppFont.poppinsBold,
                                        fontSize: 15)),
                                Text("₦456.0",
                                    style: TextStyle(
                                        fontFamily: AppFont.poppinsBold,
                                        fontSize: 15)),
                              ],
                            ),
                            SizedBox(
                              height: 7,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      elevation: 1,
                      shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      clipBehavior: Clip.hardEdge,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Payment Info",
                              style: TextStyle(
                                  color: AppColor.black,
                                  fontSize: 15,
                                  fontFamily: AppFont.poppinsBold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Potential Earning",
                                    style: TextStyle(
                                        fontFamily: AppFont.poppinsRegular,
                                        fontSize: 13)),
                                Text("₦456.00",
                                    style: TextStyle(
                                        fontFamily: AppFont.poppinsSemiBold,
                                        fontSize: 13)),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Available for Withdrawal",
                                    style: TextStyle(
                                        fontFamily: AppFont.poppinsBold,
                                        fontSize: 14)),
                                Text("₦456.0",
                                    style: TextStyle(
                                        fontFamily: AppFont.poppinsBold,
                                        fontSize: 14)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
