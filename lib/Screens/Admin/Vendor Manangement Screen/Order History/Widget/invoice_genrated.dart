import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:waste_track/Utils/Components/app_font.dart';
import 'package:waste_track/Utils/behavior.dart';
import 'package:waste_track/Utils/colors/app_colors.dart';
import 'package:waste_track/Utils/images/images.dart';

class OrderHistoryInvoiceGenerated extends StatefulWidget {
  const OrderHistoryInvoiceGenerated({super.key});

  @override
  State<OrderHistoryInvoiceGenerated> createState() =>
      _OrderHistoryInvoiceGeneratedState();
}

class _OrderHistoryInvoiceGeneratedState
    extends State<OrderHistoryInvoiceGenerated> {
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
        padding: const EdgeInsets.all(20.0),
        child: ScrollConfiguration(
          behavior: MyBehavior(),
          child: ListView(
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text('Invoice Number: ',
                          style: TextStyle(
                              color: AppColor.black.withOpacity(0.5),
                              fontFamily: AppFont.poppinsMedium)),
                      Text(" IN-05866",
                          style: TextStyle(
                              fontFamily: AppFont.poppinsSemiBold,
                              fontSize: 14)),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          Future.delayed(Duration(seconds: 1), () {
                            Navigator.pop(context);
                          });

                          return CupertinoAlertDialog(
                            title: Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: AppColor.green,
                                  ),
                                  child: Icon(
                                    Icons.done,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Flexible(
                                  child: Text(
                                    "Invoice Download Successfully",
                                    style: TextStyle(
                                        fontSize: 14, color: AppColor.green),
                                  ),
                                ),
                              ],
                            ), // show pop-up
                          );
                        },
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: AppColor.green),
                      child: Row(
                        children: [
                          Icon(
                            Icons.download_outlined,
                            color: Colors.white,
                            size: 20,
                          ),
                          SizedBox(width: 7),
                          Text(
                            'Download',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
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
                          Text("Reference:",
                              style: TextStyle(
                                  fontFamily: AppFont.poppinsSemiBold,
                                  fontSize: 13)),
                          Text("Invoice Date",
                              style: TextStyle(
                                  fontFamily: AppFont.poppinsSemiBold,
                                  fontSize: 13)),
                        ],
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("INV-057",
                              style: TextStyle(
                                  fontFamily: AppFont.poppinsRegular,
                                  fontSize: 13)),
                          Text("14 Sept 2023, 11:45AM",
                              style: TextStyle(
                                  fontFamily: AppFont.poppinsRegular,
                                  fontSize: 13)),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text("Invoice From::",
                          style: TextStyle(
                              fontFamily: AppFont.poppinsSemiBold,
                              fontSize: 13)),
                      SizedBox(
                        height: 5,
                      ),
                      Text("Waste Track",
                          style: TextStyle(
                              fontFamily: AppFont.poppinsRegular,
                              fontSize: 13)),
                      SizedBox(
                        height: 5,
                      ),
                      Text("Company Address, City, Country-00000 ",
                          style: TextStyle(
                              fontFamily: AppFont.poppinsRegular,
                              fontSize: 13)),
                      SizedBox(
                        height: 5,
                      ),
                      Text("(+234) 09-461-4000",
                          style: TextStyle(
                              fontFamily: AppFont.poppinsRegular,
                              fontSize: 13)),
                      SizedBox(
                        height: 5,
                      ),
                      Text("wastetrack@gmail.com",
                          style: TextStyle(
                              fontFamily: AppFont.poppinsRegular,
                              fontSize: 13)),
                      SizedBox(
                        height: 15,
                      ),
                      Text("Invoice To::",
                          style: TextStyle(
                              fontFamily: AppFont.poppinsSemiBold,
                              fontSize: 13)),
                      SizedBox(
                        height: 5,
                      ),
                      Text("Enumeral Solutions Limited",
                          style: TextStyle(
                              fontFamily: AppFont.poppinsRegular,
                              fontSize: 13)),
                      SizedBox(
                        height: 5,
                      ),
                      Text("Company Address, City, Country-00000 ",
                          style: TextStyle(
                              fontFamily: AppFont.poppinsRegular,
                              fontSize: 13)),
                      SizedBox(
                        height: 5,
                      ),
                      Text("(+234) 09-461-4000",
                          style: TextStyle(
                              fontFamily: AppFont.poppinsRegular,
                              fontSize: 13)),
                      SizedBox(
                        height: 5,
                      ),
                      Text("enumeralwaste@gmail.com",
                          style: TextStyle(
                              fontFamily: AppFont.poppinsRegular,
                              fontSize: 13)),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        color: AppColor.grey,
                        thickness: 1,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("ITEM DETAIL ",
                              style: TextStyle(
                                  fontFamily: AppFont.poppinsRegular,
                                  fontSize: 13)),
                          Text("RATE",
                              style: TextStyle(
                                  fontFamily: AppFont.poppinsRegular,
                                  fontSize: 13)),
                          Text("QTY",
                              style: TextStyle(
                                  fontFamily: AppFont.poppinsRegular,
                                  fontSize: 13)),
                          Text("AMOUNT",
                              style: TextStyle(
                                  fontFamily: AppFont.poppinsRegular,
                                  fontSize: 13)),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Divider(
                        color: AppColor.grey,
                        thickness: 1,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Nylon Rollins ",
                              style: TextStyle(
                                  fontFamily: AppFont.poppinsSemiBold,
                                  fontSize: 13)),
                          Text("₦758.00",
                              style: TextStyle(
                                  fontFamily: AppFont.poppinsSemiBold,
                                  fontSize: 13)),
                          Text("50",
                              style: TextStyle(
                                  fontFamily: AppFont.poppinsSemiBold,
                                  fontSize: 13)),
                          Text("₦37,900.00",
                              style: TextStyle(
                                  fontFamily: AppFont.poppinsSemiBold,
                                  fontSize: 13)),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Subtotal",
                              style: TextStyle(
                                  fontFamily: AppFont.poppinsRegular,
                                  fontSize: 13)),
                          Text("₦37,900.00",
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
                          Text("Vat Tax (7.5%)",
                              style: TextStyle(
                                  fontFamily: AppFont.poppinsRegular,
                                  fontSize: 13)),
                          Text("₦2,842.00",
                              style: TextStyle(
                                  fontFamily: AppFont.poppinsSemiBold,
                                  fontSize: 13)),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Divider(
                        color: AppColor.grey,
                        thickness: 1,
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total",
                              style: TextStyle(
                                  fontFamily: AppFont.poppinsSemiBold,
                                  fontSize: 13)),
                          Text("₦40,742.00",
                              style: TextStyle(
                                  fontFamily: AppFont.poppinsSemiBold,
                                  fontSize: 13)),
                        ],
                      ),
                      SizedBox(
                        height: 7,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text("Thanks for the business.",
                  style: TextStyle(
                    fontFamily: AppFont.poppinsSemiBold,
                    fontSize: 13,
                  )),
              SizedBox(
                height: 12,
              ),
              Text("BANK DETAILS",
                  style: TextStyle(
                      fontFamily: AppFont.poppinsRegular,
                      fontSize: 13,
                      color: AppColor.green)),
              SizedBox(
                height: 5,
              ),
              Text("Bank Transfer",
                  style: TextStyle(
                      fontFamily: AppFont.poppinsRegular, fontSize: 13)),
              SizedBox(
                height: 5,
              ),
              Text("Bank name: ABC Bank limited",
                  style: TextStyle(
                      fontFamily: AppFont.poppinsRegular, fontSize: 13)),
              SizedBox(
                height: 5,
              ),
              Text("SWIFT/IBAN: NZ0201230012",
                  style: TextStyle(
                      fontFamily: AppFont.poppinsRegular, fontSize: 13)),
              SizedBox(
                height: 5,
              ),
              Text("Account number: 12-1234-123456-12",
                  style: TextStyle(
                      fontFamily: AppFont.poppinsRegular, fontSize: 13)),
              SizedBox(
                height: 5,
              ),
              Text("Please use INV-057 as a reference number",
                  style: TextStyle(
                      fontFamily: AppFont.poppinsRegular, fontSize: 13)),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
